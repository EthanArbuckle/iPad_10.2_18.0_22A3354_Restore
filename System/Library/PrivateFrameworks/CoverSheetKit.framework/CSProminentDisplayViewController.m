@implementation CSProminentDisplayViewController

- (void)setDisplayDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = v6;
    if (!v6)
    {
      -[CSProminentDisplayViewController _fallbackDate](self, "_fallbackDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v4;
    objc_storeStrong((id *)&self->_displayDate, v4);
    -[CSProminentDisplayViewController _displayView](self, "_displayView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayDate:", v6);

  }
}

- (CSProminentDisplayViewController)initWithElements:(unint64_t)a3 date:(id)a4 textColor:(id)a5
{
  return -[CSProminentDisplayViewController initWithElements:baseFont:date:textColor:](self, "initWithElements:baseFont:date:textColor:", a3, 0, a4, a5);
}

- (CSProminentDisplayViewController)initWithElements:(unint64_t)a3 baseFont:(id)a4 date:(id)a5 textColor:(id)a6
{
  id v11;
  id v12;
  id v13;
  CSProminentDisplayViewController *v14;
  CSProminentDisplayViewController *v15;
  NSDate *v16;
  NSDate *displayDate;
  void *v18;
  objc_super v20;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CSProminentDisplayViewController;
  v14 = -[CSProminentDisplayViewController init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_elements = a3;
    if (v12)
    {
      v16 = (NSDate *)v12;
    }
    else
    {
      -[CSProminentDisplayViewController _fallbackDate](v14, "_fallbackDate");
      v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    displayDate = v15->_displayDate;
    v15->_displayDate = v16;

    v15->_effectType = 0;
    objc_storeStrong((id *)&v15->_textColor, a6);
    objc_storeStrong((id *)&v15->_baseFont, a4);
    v15->_timeAlpha = 1.0;
    v15->_complicationRowAlpha = 1.0;
    v15->_complicationSidebarAlpha = 1.0;
    v15->_vibrancyShadowAlpha = 1.0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:forKeyPath:options:context:", v15, CFSTR("SBSensitiveUIEnabled"), 1, 0);

    -[CSProminentDisplayViewController _updateContentForSensitiveUI](v15, "_updateContentForSensitiveUI");
  }

  return v15;
}

- (CSProminentDisplayViewController)init
{
  return -[CSProminentDisplayViewController initWithElements:baseFont:date:textColor:](self, "initWithElements:baseFont:date:textColor:", 63, 0, 0, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("SBSensitiveUIEnabled"));

  v4.receiver = self;
  v4.super_class = (Class)CSProminentDisplayViewController;
  -[CSProminentDisplayViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "viewClass"));
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v10 = (id)objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(v10, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v7);

  -[CSProminentDisplayViewController setView:](self, "setView:", v10);
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldApplyVibrancyToComplications:", -[CSProminentDisplayViewController shouldApplyVibrancyToComplications](self, "shouldApplyVibrancyToComplications"));
  objc_msgSend(v8, "vibrancyEffectView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentType:", -[CSProminentDisplayViewController vibrancyContentType](self, "vibrancyContentType"));

  -[CSProminentDisplayViewController _updateElements](self, "_updateElements");
  -[CSProminentDisplayViewController _updateViewColors](self, "_updateViewColors");

}

- (void)setShouldApplyVibrancyToComplications:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_shouldApplyVibrancyToComplications = a3;
  -[CSProminentDisplayViewController _displayViewIfLoaded](self, "_displayViewIfLoaded");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldApplyVibrancyToComplications:", v3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[6];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSProminentDisplayViewController;
  -[CSProminentDisplayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CSProminentDisplayViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "_toWindowOrientation");
  if (v10 != objc_msgSend(v9, "_fromWindowOrientation"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __87__CSProminentDisplayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E55EB118;
    v11[4] = self;
    v11[5] = v10;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, 0);
  }

}

void __87__CSProminentDisplayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_displayView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateContainerOrientationForBackgroundViews:", *(_QWORD *)(a1 + 40));

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSProminentDisplayViewController;
  -[CSProminentDisplayViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v9, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[CSProminentDisplayViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_windowInterfaceOrientation");

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateContainerOrientationForBackgroundViews:", v7);

}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSProminentDisplayViewController;
  -[CSProminentDisplayViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSProminentDisplayViewController;
  -[CSProminentDisplayViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisible:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSProminentDisplayViewController;
  -[CSProminentDisplayViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisible:", 0);

}

- (void)viewDidLayoutSubviews
{
  -[CSProminentDisplayViewController _timeStyleBounds](self, "_timeStyleBounds");
  if ((BSRectEqualToRect() & 1) == 0)
    -[CSProminentDisplayViewController _updateViewColors](self, "_updateViewColors");
}

- (CGRect)_timeStyleBounds
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGRect)contentBoundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  +[CSProminentLayoutController frameForElements:](CSProminentLayoutController, "frameForElements:", self->_elements);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAlternateCalendarIdentifier:(id)a3 locale:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  id v13;

  v13 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_alternateCalendarIdentifier, a3);
  objc_storeStrong((id *)&self->_alternateCalendarLocale, a4);
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtitleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subtitleView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v9, "setAlternateCalendarIdentifier:locale:", v13, v7);

}

- (void)setContentAlpha:(double)a3
{
  -[CSProminentDisplayViewController setContentAlpha:forElements:](self, "setContentAlpha:forElements:", -1, a3);
}

- (void)setContentAlpha:(double)a3 forElements:(unint64_t)a4
{
  char v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((v4 & 0x20) != 0)
  {
    self->_vibrancyShadowAlpha = a3;
    objc_msgSend(v11, "vibrancyShadowView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", a3);

  }
  if ((v4 & 1) != 0)
  {
    self->_timeAlpha = a3;
    objc_msgSend(v11, "timeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", a3);

  }
  if ((v4 & 6) != 0)
    objc_msgSend(v11, "setSubtitleAlpha:", a3);
  if ((v4 & 8) != 0)
  {
    self->_complicationRowAlpha = a3;
    objc_msgSend(v11, "complicationRowView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", a3);

  }
  if ((v4 & 0x10) != 0)
  {
    self->_complicationSidebarAlpha = a3;
    objc_msgSend(v11, "complicationSidebarView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", a3);

  }
}

- (id)beginInteractiveTransitionToBaseFont:(id)a3 textColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vibrancyEffectView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D01958]);
  v12 = objc_msgSend(v10, "effectType");
  v13 = objc_msgSend(v10, "backgroundType");
  -[CSProminentDisplayViewController alternativeVibrancyEffectLUT](self, "alternativeVibrancyEffectLUT");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", v12, v13, v7, 0, 0, v14, 0.0);

  -[CSProminentDisplayViewController beginInteractiveTransitionToBaseFont:vibrancyConfiguration:cachingVibrancyTransitionProvider:](self, "beginInteractiveTransitionToBaseFont:vibrancyConfiguration:cachingVibrancyTransitionProvider:", v6, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)beginInteractiveTransitionToBaseFont:(id)a3 vibrancyConfiguration:(id)a4
{
  return -[CSProminentDisplayViewController beginInteractiveTransitionToBaseFont:vibrancyConfiguration:cachingVibrancyTransitionProvider:](self, "beginInteractiveTransitionToBaseFont:vibrancyConfiguration:cachingVibrancyTransitionProvider:", a3, a4, 0);
}

- (id)beginInteractiveTransitionToBaseFont:(id)a3 vibrancyConfiguration:(id)a4 cachingVibrancyTransitionProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CSProminentDisplayInteractiveTransition *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 0.0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vibrancyEffectView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[CSProminentDisplayInteractiveTransition initWithViewController:baseFont:fromVibrancyConfiguration:toVibrancyConfiguration:cachingVibrancyTransitionProvider:]([CSProminentDisplayInteractiveTransition alloc], "initWithViewController:baseFont:fromVibrancyConfiguration:toVibrancyConfiguration:cachingVibrancyTransitionProvider:", self, v8, v13, v9, v10);
  -[CSProminentDisplayViewController setCurrentTransition:](self, "setCurrentTransition:", v14);

  return v14;
}

- (BOOL)usesLightTimeFontVariant
{
  void *v2;
  void *v3;
  char v4;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesLightTimeFontVariant");

  return v4;
}

- (void)setUsesLightTimeFontVariant:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesLightTimeFontVariant:", v3);

}

- (BOOL)usesLandscapeTimeFontVariant
{
  void *v2;
  void *v3;
  char v4;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesLandscapeTimeFontVariant");

  return v4;
}

- (void)setUsesLandscapeTimeFontVariant:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesLandscapeTimeFontVariant:", v3);

}

- (BOOL)animatesTimeChanges
{
  void *v2;
  void *v3;
  char v4;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "animatesTimeChanges");

  return v4;
}

- (void)setAnimatesTimeChanges:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = -[CSProminentDisplayViewController _sensitiveUIEnabled](self, "_sensitiveUIEnabled") & a3;
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimatesTimeChanges:", v4);

}

- (void)setDateTimeAlignment:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", a3);

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subtitleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextAlignment:", a3);

}

- (BOOL)usesEditingLayout
{
  void *v2;
  char v3;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesEditingLayout");

  return v3;
}

- (void)setUsesEditingLayout:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesEditingLayout:", v3);

}

- (id)transientSubtitleText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientSubtitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTransientSubtitleText:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CSProminentTextElementView *v10;
  void *v11;
  void *v12;
  CSProminentTextElementView *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (objc_msgSend(v16, "length"))
  {
    -[CSProminentDisplayViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSProminentLayoutController fontSizeForElementType:isLandscapeVariant:](CSProminentLayoutController, "fontSizeForElementType:isLandscapeVariant:", 2, (unint64_t)(objc_msgSend(v5, "interfaceOrientation") - 3) < 2);
    v7 = v6;

    +[CSProminentLayoutController fontWeightForElementType:](CSProminentLayoutController, "fontWeightForElementType:", 2);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [CSProminentTextElementView alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentDisplayViewController effectiveTextColor](self, "effectiveTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CSProminentTextElementView initWithDate:font:textColor:](v10, "initWithDate:font:textColor:", v11, v9, v12);

    -[CSProminentTextElementView textLabel](v13, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v14, "setMinimumScaleFactor:", 0.25);
    -[CSProminentTextElementView setOverrideString:](v13, "setOverrideString:", v16);
    -[CSProminentDisplayViewController _displayView](self, "_displayView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTransientSubtitleView:", v13);

  }
  else
  {
    -[CSProminentDisplayViewController _displayView](self, "_displayView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTransientSubtitleView:", 0);
  }

}

- (void)setTransientSubtitleText:(id)a3 withTimeout:(double)a4
{
  id v6;
  uint64_t v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  -[CSProminentDisplayViewController setTransientSubtitleText:](self, "setTransientSubtitleText:", v6);
  if (v7)
  {
    objc_initWeak(&location, self);
    v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__CSProminentDisplayViewController_setTransientSubtitleText_withTimeout___block_invoke;
    block[3] = &unk_1E55EB140;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __73__CSProminentDisplayViewController_setTransientSubtitleText_withTimeout___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  id WeakRetained;

  v1 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_displayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientSubtitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overrideString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if (v5)
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "setTransientSubtitleText:", 0);

  }
}

- (BOOL)isFourDigitTime
{
  void *v2;
  void *v3;
  char v4;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fourDigitTime");

  return v4;
}

- (void)setCustomSubtitleWithText:(id)a3 glyphName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  CSProminentLabeledElementView *v12;
  void *v13;
  void *v14;
  void *v15;
  CSProminentLabeledElementView *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (objc_msgSend(v18, "length"))
  {
    -[CSProminentDisplayViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSProminentLayoutController fontSizeForElementType:isLandscapeVariant:](CSProminentLayoutController, "fontSizeForElementType:isLandscapeVariant:", 2, (unint64_t)(objc_msgSend(v8, "interfaceOrientation") - 3) < 2);
    v10 = v9;

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [CSProminentLabeledElementView alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentDisplayViewController effectiveTextColor](self, "effectiveTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentDisplayViewController _customSubtitleGlyphWithName:](self, "_customSubtitleGlyphWithName:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CSProminentLabeledElementView initWithDate:font:textColor:glyph:](v12, "initWithDate:font:textColor:glyph:", v13, v11, v14, v15);

    -[CSProminentLabeledElementView setAccessibilityIdentifier:](v16, "setAccessibilityIdentifier:", CFSTR("cs-timer-countdown-view"));
    -[CSProminentLabeledElementView setOverrideString:](v16, "setOverrideString:", v18);
    -[CSProminentDisplayViewController _displayView](self, "_displayView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCustomSubtitleView:", v16);

  }
  else
  {
    -[CSProminentDisplayViewController _displayView](self, "_displayView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCustomSubtitleView:", 0);
  }

}

- (void)updateCustomSubtitleWithText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customSubtitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverrideString:", v4);

}

- (id)_customSubtitleGlyphWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CSProminentDisplayViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSProminentLayoutController fontSizeForElementType:isLandscapeVariant:](CSProminentLayoutController, "fontSizeForElementType:isLandscapeVariant:", 2, (unint64_t)(objc_msgSend(v6, "interfaceOrientation") - 3) < 2);
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "imageWithRenderingMode:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_fallbackDate
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1168335660.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1168335660.0 - (double)objc_msgSend(v3, "secondsFromGMTForDate:", v2);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setBaseFont:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_baseFont, a3);
  v5 = a3;
  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBaseFont:", v5);

}

- (void)setNumberingSystem:(id)a3
{
  id v4;
  NSString *v5;
  NSString *numberingSystem;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  numberingSystem = self->_numberingSystem;
  self->_numberingSystem = v5;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = CSTimeNumberingSystemStringToType(v4);

  objc_msgSend(v8, "setNumberingSystem:", v7);
}

- (void)setSubtitleComplicationViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *subtitleComplicationViewController;
  void *v7;
  UIViewController *v8;

  v5 = (UIViewController *)a3;
  subtitleComplicationViewController = self->_subtitleComplicationViewController;
  if (subtitleComplicationViewController != v5)
  {
    v8 = v5;
    if (subtitleComplicationViewController)
    {
      -[UIViewController willMoveToParentViewController:](subtitleComplicationViewController, "willMoveToParentViewController:", 0);
      -[CSProminentDisplayViewController _displayView](self, "_displayView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSubtitleComplicationView:", 0);

      -[UIViewController removeFromParentViewController](self->_subtitleComplicationViewController, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_subtitleComplicationViewController, a3);
    -[CSProminentDisplayViewController _updateElements](self, "_updateElements");
    v5 = v8;
  }

}

- (void)setComplicationContainerViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *complicationContainerViewController;
  void *v7;
  UIViewController *v8;

  v5 = (UIViewController *)a3;
  complicationContainerViewController = self->_complicationContainerViewController;
  if (complicationContainerViewController != v5)
  {
    v8 = v5;
    if (complicationContainerViewController)
    {
      -[UIViewController willMoveToParentViewController:](complicationContainerViewController, "willMoveToParentViewController:", 0);
      -[CSProminentDisplayViewController _displayView](self, "_displayView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setComplicationRowView:", 0);

      -[UIViewController removeFromParentViewController](self->_complicationContainerViewController, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_complicationContainerViewController, a3);
    -[CSProminentDisplayViewController _updateElements](self, "_updateElements");
    v5 = v8;
  }

}

- (void)setComplicationSidebarViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *complicationSidebarViewController;
  void *v7;
  UIViewController *v8;

  v5 = (UIViewController *)a3;
  complicationSidebarViewController = self->_complicationSidebarViewController;
  if (complicationSidebarViewController != v5)
  {
    v8 = v5;
    if (complicationSidebarViewController)
    {
      -[UIViewController willMoveToParentViewController:](complicationSidebarViewController, "willMoveToParentViewController:", 0);
      -[CSProminentDisplayViewController _displayView](self, "_displayView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setComplicationSidebarView:", 0);

      -[UIViewController removeFromParentViewController](self->_complicationSidebarViewController, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_complicationSidebarViewController, a3);
    -[CSProminentDisplayViewController _updateElements](self, "_updateElements");
    v5 = v8;
  }

}

- (UIView)backgroundView
{
  void *v2;
  void *v3;

  -[CSProminentDisplayViewController _displayViewIfLoaded](self, "_displayViewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  -[CSProminentDisplayViewController _updateViewColors](self, "_updateViewColors");
}

- (void)setBackgroundType:(int64_t)a3
{
  self->_backgroundType = a3;
  -[CSProminentDisplayViewController _updateViewColors](self, "_updateViewColors");
}

- (void)setEffectType:(int64_t)a3
{
  self->_effectType = a3;
  -[CSProminentDisplayViewController _updateViewColors](self, "_updateViewColors");
}

- (void)setGroupName:(id)a3
{
  NSString *v4;
  NSString *groupName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  groupName = self->_groupName;
  self->_groupName = v4;

  -[CSProminentDisplayViewController _updateViewColors](self, "_updateViewColors");
}

- (void)setAlternativeVibrancyEffectLUTIdentifier:(id)a3 alternativeVibrancyEffectLUTBundleURL:(id)a4
{
  id v6;
  BSUIVibrancyLUT *alternativeVibrancyEffectLUT;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    alternativeVibrancyEffectLUT = (BSUIVibrancyLUT *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01968]), "initWithIdentifier:bundleURL:", v8, v6);
    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alternativeVibrancyEffectLUT, alternativeVibrancyEffectLUT);
      -[CSProminentDisplayViewController _updateViewColors](self, "_updateViewColors");
    }
  }
  else
  {
    alternativeVibrancyEffectLUT = self->_alternativeVibrancyEffectLUT;
    self->_alternativeVibrancyEffectLUT = 0;
  }

}

- (void)setAlternativeVibrancyEffectLUTIdentifier:(id)a3 alternativeVibrancyEffectLUTBundleURL:(id)a4 luminanceReduced:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  BSUIVibrancyLUT *alternativeVibrancyEffectLUT;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  if (v11 && v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01968]), "initWithIdentifier:bundleURL:", v11, v8);
    alternativeVibrancyEffectLUT = (BSUIVibrancyLUT *)objc_msgSend(v9, "copyWithLuminanceReduced:", v5);

    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alternativeVibrancyEffectLUT, alternativeVibrancyEffectLUT);
      -[CSProminentDisplayViewController _updateViewColors](self, "_updateViewColors");
    }
  }
  else
  {
    alternativeVibrancyEffectLUT = self->_alternativeVibrancyEffectLUT;
    self->_alternativeVibrancyEffectLUT = 0;
  }

}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  BSUIVibrancyConfiguration *vibrancyConfiguration;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BSUIVibrancyConfiguration *v21;
  BSUIVibrancyConfiguration *v22;

  vibrancyConfiguration = self->_vibrancyConfiguration;
  if (!vibrancyConfiguration)
    goto LABEL_7;
  v4 = -[BSUIVibrancyConfiguration backgroundType](vibrancyConfiguration, "backgroundType");
  if (v4 != -[CSProminentDisplayViewController backgroundType](self, "backgroundType"))
    goto LABEL_7;
  -[BSUIVibrancyConfiguration color](self->_vibrancyConfiguration, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSProminentDisplayViewController textColor](self, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  if (!v7)
    goto LABEL_7;
  v8 = -[BSUIVibrancyConfiguration effectType](self->_vibrancyConfiguration, "effectType");
  if (v8 != -[CSProminentDisplayViewController effectType](self, "effectType"))
    goto LABEL_7;
  -[BSUIVibrancyConfiguration groupName](self->_vibrancyConfiguration, "groupName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSProminentDisplayViewController groupName](self, "groupName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = BSEqualObjects();

  if (!v11
    || (-[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](self->_vibrancyConfiguration, "alternativeVibrancyEffectLUT"), v12 = (void *)objc_claimAutoreleasedReturnValue(), -[CSProminentDisplayViewController alternativeVibrancyEffectLUT](self, "alternativeVibrancyEffectLUT"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v14 = BSEqualObjects(), v13, v12, (v14 & 1) == 0))
  {
LABEL_7:
    v15 = objc_alloc(MEMORY[0x1E0D01958]);
    v16 = -[CSProminentDisplayViewController effectType](self, "effectType");
    v17 = -[CSProminentDisplayViewController backgroundType](self, "backgroundType");
    -[CSProminentDisplayViewController textColor](self, "textColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentDisplayViewController groupName](self, "groupName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentDisplayViewController alternativeVibrancyEffectLUT](self, "alternativeVibrancyEffectLUT");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (BSUIVibrancyConfiguration *)objc_msgSend(v15, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", v16, v17, v18, v19, 0, v20, 0.0);
    v22 = self->_vibrancyConfiguration;
    self->_vibrancyConfiguration = v21;

  }
  return self->_vibrancyConfiguration;
}

- (void)setVibrancyContentType:(int64_t)a3
{
  void *v4;
  id v5;

  self->_vibrancyContentType = a3;
  -[CSProminentDisplayViewController _displayViewIfLoaded](self, "_displayViewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vibrancyEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentType:", a3);

}

- (id)effectiveTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (void)_updateViewColors
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CSVibrantContentStyleRenderer *timeRenderer;
  CSVibrantContentStyleRenderer *v13;
  void *v14;
  CSVibrantContentStyleRenderer *v15;
  CSVibrantContentStyleRenderer *v16;
  CSVibrantContentStyleRenderer *complicationRenderer;
  CSVibrantContentStyleRenderer *v18;
  void *v19;
  CSVibrantContentStyleRenderer *v20;
  CSVibrantContentStyleRenderer *v21;
  void *v22;
  CSVibrantContentStyleRenderer *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  CSVibrantContentStyleRenderer *v27;
  void *v28;
  objc_class *v29;
  id v30;
  CSVibrantContentStyleRenderer *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSProminentDisplayViewController _timeStyleBounds](self, "_timeStyleBounds");
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  timeRenderer = self->_timeRenderer;
  if (timeRenderer)
  {
    -[CSVibrantContentStyleRenderer setStyleBoundingRect:](timeRenderer, "setStyleBoundingRect:", v4, v5, v6, v7);
  }
  else
  {
    v13 = [CSVibrantContentStyleRenderer alloc];
    objc_msgSend(v3, "timeVibrancyEffectView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CSVibrantContentStyleRenderer initWithVibrancyView:styleBoundingRect:](v13, "initWithVibrancyView:styleBoundingRect:", v14, v8, v9, v10, v11);
    v16 = self->_timeRenderer;
    self->_timeRenderer = v15;

  }
  complicationRenderer = self->_complicationRenderer;
  if (complicationRenderer)
  {
    -[CSVibrantContentStyleRenderer setStyleBoundingRect:](complicationRenderer, "setStyleBoundingRect:", v8, v9, v10, v11);
  }
  else
  {
    v18 = [CSVibrantContentStyleRenderer alloc];
    objc_msgSend(v3, "vibrancyEffectView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CSVibrantContentStyleRenderer initWithVibrancyView:styleBoundingRect:](v18, "initWithVibrancyView:styleBoundingRect:", v19, v8, v9, v10, v11);
    v21 = self->_complicationRenderer;
    self->_complicationRenderer = v20;

  }
  -[CSProminentDisplayViewController vibrancyConfiguration](self, "vibrancyConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSVibrantContentStyleRenderer setVibrancyConfiguration:](self->_timeRenderer, "setVibrancyConfiguration:", v22);
  v23 = self->_timeRenderer;
  -[CSProminentDisplayViewController titleContentStyle](self, "titleContentStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSVibrantContentStyleRenderer applyStyle:](v23, "applyStyle:", v24);

  -[CSProminentDisplayViewController titleContentStyle](self, "titleContentStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "type");

  v27 = self->_complicationRenderer;
  if (v26 == 1)
  {
    -[CSVibrantContentStyleRenderer clearAllStyling](v27, "clearAllStyling");
    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v28 = (void *)getPRPosterContentVibrantMonochromeStyleClass_softClass;
    v42 = getPRPosterContentVibrantMonochromeStyleClass_softClass;
    if (!getPRPosterContentVibrantMonochromeStyleClass_softClass)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __getPRPosterContentVibrantMonochromeStyleClass_block_invoke;
      v38[3] = &unk_1E55EB168;
      v38[4] = &v39;
      __getPRPosterContentVibrantMonochromeStyleClass_block_invoke((uint64_t)v38);
      v28 = (void *)v40[3];
    }
    v29 = objc_retainAutorelease(v28);
    _Block_object_dispose(&v39, 8);
    v30 = objc_alloc_init(v29);
    -[CSVibrantContentStyleRenderer applyStyle:](self->_complicationRenderer, "applyStyle:", v30);

  }
  else
  {
    -[CSVibrantContentStyleRenderer setVibrancyConfiguration:](v27, "setVibrancyConfiguration:", v22);
    v31 = self->_complicationRenderer;
    -[CSProminentDisplayViewController titleContentStyle](self, "titleContentStyle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSVibrantContentStyleRenderer applyStyle:](v31, "applyStyle:", v32);

  }
  objc_msgSend(v3, "vibrancyShadowView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setConfiguration:", v22);

  -[CSProminentDisplayViewController effectiveTextColor](self, "effectiveTextColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPrimaryTextColor:", v34);

  objc_msgSend(v3, "subtitleView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setPrimaryTextColor:", v34);

  objc_msgSend(v3, "transientSubtitleView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setPrimaryTextColor:", v34);

  self->_previousTimeStyleBounds.origin.x = v8;
  self->_previousTimeStyleBounds.origin.y = v9;
  self->_previousTimeStyleBounds.size.width = v10;
  self->_previousTimeStyleBounds.size.height = v11;

}

- (void)_updateStyleBoundingRects
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[CSProminentDisplayViewController _timeStyleBounds](self, "_timeStyleBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CSVibrantContentStyleRenderer setStyleBoundingRect:](self->_timeRenderer, "setStyleBoundingRect:");
  -[CSVibrantContentStyleRenderer setStyleBoundingRect:](self->_complicationRenderer, "setStyleBoundingRect:", v4, v6, v8, v10);
}

- (void)setTitleContentStyle:(id)a3
{
  objc_storeStrong((id *)&self->_titleContentStyle, a3);
  -[CSProminentDisplayViewController _updateViewColors](self, "_updateViewColors");
}

- (BOOL)_sensitiveUIEnabled
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("SBSensitiveUIEnabled")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("SBSensitiveUIEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5 == 0;

  }
  return v3;
}

- (void)_updateContentForSensitiveUI
{
  -[CSProminentDisplayViewController setAnimatesTimeChanges:](self, "setAnimatesTimeChanges:", -[CSProminentDisplayViewController _sensitiveUIEnabled](self, "_sensitiveUIEnabled"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (BSEqualStrings())
    -[CSProminentDisplayViewController _updateContentForSensitiveUI](self, "_updateContentForSensitiveUI");
}

- (void)setElements:(unint64_t)a3
{
  if (self->_elements != a3)
  {
    self->_elements = a3;
    -[CSProminentDisplayViewController _updateElements](self, "_updateElements");
  }
}

- (void)_updateElements
{
  id v3;

  -[CSProminentDisplayViewController _createOrDestroyVibrancyShadowViewIfNecessary](self, "_createOrDestroyVibrancyShadowViewIfNecessary");
  -[CSProminentDisplayViewController _createOrDestroyTimeElementIfNecessary](self, "_createOrDestroyTimeElementIfNecessary");
  -[CSProminentDisplayViewController _createOrDestroySubtitleElementIfNecessary](self, "_createOrDestroySubtitleElementIfNecessary");
  -[CSProminentDisplayViewController _createOrDestroySubtitleComplicationElementIfNecessary](self, "_createOrDestroySubtitleComplicationElementIfNecessary");
  -[CSProminentDisplayViewController _createOrDestroyComplicationRowElementIfNecessary](self, "_createOrDestroyComplicationRowElementIfNecessary");
  -[CSProminentDisplayViewController _createOrDestroyComplicationSidebarElementIfNecessary](self, "_createOrDestroyComplicationSidebarElementIfNecessary");
  -[CSProminentDisplayViewController _updateViewColors](self, "_updateViewColors");
  -[CSProminentDisplayViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)_createOrDestroyVibrancyShadowViewIfNecessary
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  id v8;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vibrancyShadowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  v5 = -[CSProminentDisplayViewController _shouldShowElement:](self, "_shouldShowElement:", 32);
  if (((v4 ^ v5) & 1) == 0)
  {
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D01970]);
      -[CSProminentDisplayViewController vibrancyConfiguration](self, "vibrancyConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setConfiguration:", v7);

      objc_msgSend(v6, "setAlpha:", self->_vibrancyShadowAlpha);
      objc_msgSend(v8, "setVibrancyShadowView:", v6);

    }
    else
    {
      objc_msgSend(v8, "setVibrancyShadowView:", 0);
    }
  }

}

- (void)_createOrDestroyTimeElementIfNecessary
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  UIFont *baseFont;
  UIFont *v7;
  UIFont *v8;
  CSProminentTimeView *v9;
  NSDate *displayDate;
  void *v11;
  CSProminentTimeView *v12;
  id v13;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  v5 = -[CSProminentDisplayViewController _shouldShowElement:](self, "_shouldShowElement:", 1);
  if (((v4 ^ v5) & 1) == 0)
  {
    if (v5)
    {
      baseFont = self->_baseFont;
      if (baseFont)
      {
        v7 = baseFont;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 0.0);
        v7 = (UIFont *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v7;
      v9 = [CSProminentTimeView alloc];
      displayDate = self->_displayDate;
      -[CSProminentDisplayViewController effectiveTextColor](self, "effectiveTextColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[CSProminentTimeView initWithDate:baseFont:textColor:](v9, "initWithDate:baseFont:textColor:", displayDate, v8, v11);

      -[CSProminentTimeView setNumberingSystem:](v12, "setNumberingSystem:", CSTimeNumberingSystemStringToType(self->_numberingSystem));
      -[CSProminentTimeView setAlpha:](v12, "setAlpha:", self->_timeAlpha);
      objc_msgSend(v13, "setTimeView:", v12);

    }
    else
    {
      objc_msgSend(v13, "setTimeView:", 0);
    }
  }

}

- (void)_createOrDestroySubtitleElementIfNecessary
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  CSProminentSubtitleDateView *v6;
  NSDate *displayDate;
  void *v8;
  CSProminentSubtitleDateView *v9;
  id v10;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subtitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  v5 = -[CSProminentDisplayViewController _shouldShowElement:](self, "_shouldShowElement:", 2);
  if (((v4 ^ v5) & 1) == 0)
  {
    if (v5)
    {
      v6 = [CSProminentSubtitleDateView alloc];
      displayDate = self->_displayDate;
      -[CSProminentDisplayViewController effectiveTextColor](self, "effectiveTextColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CSProminentSubtitleDateView initWithDate:textColor:](v6, "initWithDate:textColor:", displayDate, v8);

      -[CSProminentSubtitleDateView setAlternateCalendarIdentifier:locale:](v9, "setAlternateCalendarIdentifier:locale:", self->_alternateCalendarIdentifier, self->_alternateCalendarLocale);
      objc_msgSend(v10, "setSubtitleView:", v9);

    }
    else
    {
      objc_msgSend(v10, "setSubtitleView:", 0);
    }
  }

}

- (void)_createOrDestroySubtitleComplicationElementIfNecessary
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  CSProminentEmptyElementView *v6;
  void *v7;
  CSProminentEmptyElementView *v8;
  id v9;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subtitleComplicationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  v5 = -[CSProminentDisplayViewController _shouldShowElement:](self, "_shouldShowElement:", 4);
  if (((v4 ^ v5) & 1) == 0)
  {
    if (v5 && self->_subtitleComplicationViewController)
    {
      -[CSProminentDisplayViewController addChildViewController:](self, "addChildViewController:");
      v6 = [CSProminentEmptyElementView alloc];
      -[UIViewController view](self->_subtitleComplicationViewController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CSProminentEmptyElementView initWithContentView:](v6, "initWithContentView:", v7);

      objc_msgSend(v9, "setSubtitleComplicationView:", v8);
      -[UIViewController didMoveToParentViewController:](self->_subtitleComplicationViewController, "didMoveToParentViewController:", self);

    }
    else
    {
      objc_msgSend(v9, "setSubtitleComplicationView:", 0);
    }
  }

}

- (void)_createOrDestroyComplicationRowElementIfNecessary
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  CSProminentEmptyElementView *v6;
  void *v7;
  CSProminentEmptyElementView *v8;
  id v9;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "complicationRowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  v5 = -[CSProminentDisplayViewController _shouldShowElement:](self, "_shouldShowElement:", 8);
  if (((v4 ^ v5) & 1) == 0)
  {
    if (v5 && self->_complicationContainerViewController)
    {
      -[CSProminentDisplayViewController addChildViewController:](self, "addChildViewController:");
      v6 = [CSProminentEmptyElementView alloc];
      -[UIViewController view](self->_complicationContainerViewController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CSProminentEmptyElementView initWithContentView:](v6, "initWithContentView:", v7);

      -[CSProminentEmptyElementView setAlpha:](v8, "setAlpha:", self->_complicationRowAlpha);
      objc_msgSend(v9, "setComplicationRowView:", v8);
      -[UIViewController didMoveToParentViewController:](self->_complicationContainerViewController, "didMoveToParentViewController:", self);

    }
    else
    {
      objc_msgSend(v9, "setComplicationRowView:", 0);
    }
  }

}

- (void)_createOrDestroyComplicationSidebarElementIfNecessary
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  CSProminentEmptyElementView *v6;
  void *v7;
  CSProminentEmptyElementView *v8;
  id v9;

  -[CSProminentDisplayViewController _displayView](self, "_displayView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "complicationSidebarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  v5 = -[CSProminentDisplayViewController _shouldShowElement:](self, "_shouldShowElement:", 16);
  if (((v4 ^ v5) & 1) == 0)
  {
    if (v5 && self->_complicationSidebarViewController)
    {
      -[CSProminentDisplayViewController addChildViewController:](self, "addChildViewController:");
      v6 = [CSProminentEmptyElementView alloc];
      -[UIViewController view](self->_complicationSidebarViewController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CSProminentEmptyElementView initWithContentView:](v6, "initWithContentView:", v7);

      -[CSProminentEmptyElementView setAlpha:](v8, "setAlpha:", self->_complicationSidebarAlpha);
      objc_msgSend(v9, "setComplicationSidebarView:", v8);
      -[UIViewController didMoveToParentViewController:](self->_complicationSidebarViewController, "didMoveToParentViewController:", self);

    }
    else
    {
      objc_msgSend(v9, "setComplicationSidebarView:", 0);
    }
  }

}

- (BOOL)_shouldShowElement:(unint64_t)a3
{
  return (a3 & ~self->_elements) == 0;
}

- (void)interactiveTransition:(id)a3 didUpdate:(double)a4
{
  id v6;
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
  id v22;

  v22 = a3;
  -[CSProminentDisplayViewController currentTransition](self, "currentTransition");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v22;
  if (v6 == v22)
  {
    objc_msgSend(v22, "cachingVibrancyTransitionProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v22, "cachingVibrancyTransitionProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fromVibrancyConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "alternativeVibrancyEffectLUT");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "toVibrancyConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "alternativeVibrancyEffectLUT");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lutIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "vibrancyLUTWithStartingLUT:transitionProgress:toIdentifier:", v11, v14, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "fromVibrancyConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "toVibrancyConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v16, "copyWithBlendAmount:blendConfiguration:alternativeVibrancyEffectLUT:", v17, v15, a4);

    }
    -[CSProminentDisplayViewController _displayView](self, "_displayView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeVibrancyEffectView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setConfiguration:", v8);

    objc_msgSend(v18, "vibrancyEffectView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setConfiguration:", v8);

    objc_msgSend(v18, "vibrancyShadowView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setConfiguration:", v8);

    v7 = v22;
  }

}

- (void)interactiveTransition:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v6;
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
  -[CSProminentDisplayViewController currentTransition](self, "currentTransition");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v15;
  if (v6 == v15)
  {
    if (a4)
    {
      objc_msgSend(v15, "baseFont");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSProminentDisplayViewController setBaseFont:](self, "setBaseFont:", v8);

      objc_msgSend(v15, "toVibrancyConfiguration");
    }
    else
    {
      objc_msgSend(v15, "fromVibrancyConfiguration");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentDisplayViewController setTextColor:](self, "setTextColor:", v10);

    -[CSProminentDisplayViewController setBackgroundType:](self, "setBackgroundType:", objc_msgSend(v9, "backgroundType"));
    -[CSProminentDisplayViewController setEffectType:](self, "setEffectType:", objc_msgSend(v9, "effectType"));
    objc_msgSend(v9, "alternativeVibrancyEffectLUT");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lutIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentDisplayViewController setAlternativeVibrancyEffectLUTIdentifier:alternativeVibrancyEffectLUTBundleURL:luminanceReduced:](self, "setAlternativeVibrancyEffectLUTIdentifier:alternativeVibrancyEffectLUTBundleURL:luminanceReduced:", v12, v13, 0);

    objc_msgSend(v9, "groupName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentDisplayViewController setGroupName:](self, "setGroupName:", v14);

    -[CSProminentDisplayViewController setCurrentTransition:](self, "setCurrentTransition:", 0);
    v7 = v15;
  }

}

- (unint64_t)elements
{
  return self->_elements;
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BSUIVibrancyLUT)alternativeVibrancyEffectLUT
{
  return self->_alternativeVibrancyEffectLUT;
}

- (int64_t)vibrancyContentType
{
  return self->_vibrancyContentType;
}

- (PRPosterContentStyle)titleContentStyle
{
  return self->_titleContentStyle;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (UIFont)baseFont
{
  return self->_baseFont;
}

- (NSString)numberingSystem
{
  return self->_numberingSystem;
}

- (UIViewController)subtitleComplicationViewController
{
  return self->_subtitleComplicationViewController;
}

- (UIViewController)complicationContainerViewController
{
  return self->_complicationContainerViewController;
}

- (UIViewController)complicationSidebarViewController
{
  return self->_complicationSidebarViewController;
}

- (BOOL)shouldApplyVibrancyToComplications
{
  return self->_shouldApplyVibrancyToComplications;
}

- (double)vibrancyShadowAlpha
{
  return self->_vibrancyShadowAlpha;
}

- (void)setVibrancyShadowAlpha:(double)a3
{
  self->_vibrancyShadowAlpha = a3;
}

- (double)timeAlpha
{
  return self->_timeAlpha;
}

- (void)setTimeAlpha:(double)a3
{
  self->_timeAlpha = a3;
}

- (double)complicationRowAlpha
{
  return self->_complicationRowAlpha;
}

- (void)setComplicationRowAlpha:(double)a3
{
  self->_complicationRowAlpha = a3;
}

- (double)complicationSidebarAlpha
{
  return self->_complicationSidebarAlpha;
}

- (void)setComplicationSidebarAlpha:(double)a3
{
  self->_complicationSidebarAlpha = a3;
}

- (NSString)alternateCalendarIdentifier
{
  return self->_alternateCalendarIdentifier;
}

- (void)setAlternateCalendarIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (NSLocale)alternateCalendarLocale
{
  return self->_alternateCalendarLocale;
}

- (void)setAlternateCalendarLocale:(id)a3
{
  objc_storeStrong((id *)&self->_alternateCalendarLocale, a3);
}

- (CSProminentDisplayInteractiveTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)setCurrentTransition:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransition, a3);
}

- (CSVibrantContentStyleRenderer)timeRenderer
{
  return self->_timeRenderer;
}

- (void)setTimeRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_timeRenderer, a3);
}

- (CSVibrantContentStyleRenderer)complicationRenderer
{
  return self->_complicationRenderer;
}

- (void)setComplicationRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_complicationRenderer, a3);
}

- (CGRect)previousTimeStyleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousTimeStyleBounds.origin.x;
  y = self->_previousTimeStyleBounds.origin.y;
  width = self->_previousTimeStyleBounds.size.width;
  height = self->_previousTimeStyleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousTimeStyleBounds:(CGRect)a3
{
  self->_previousTimeStyleBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationRenderer, 0);
  objc_storeStrong((id *)&self->_timeRenderer, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_alternateCalendarLocale, 0);
  objc_storeStrong((id *)&self->_alternateCalendarIdentifier, 0);
  objc_storeStrong((id *)&self->_complicationSidebarViewController, 0);
  objc_storeStrong((id *)&self->_complicationContainerViewController, 0);
  objc_storeStrong((id *)&self->_subtitleComplicationViewController, 0);
  objc_storeStrong((id *)&self->_numberingSystem, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_titleContentStyle, 0);
  objc_storeStrong((id *)&self->_alternativeVibrancyEffectLUT, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
}

@end
