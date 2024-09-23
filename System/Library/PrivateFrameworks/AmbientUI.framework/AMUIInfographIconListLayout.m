@implementation AMUIInfographIconListLayout

- (AMUIInfographIconListLayout)initWithRootFolderVisualConfiguration:(id)a3 screenType:(unint64_t)a4
{
  id v7;
  AMUIInfographIconListLayout *v8;
  AMUIInfographIconListLayout *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMUIInfographIconListLayout;
  v8 = -[AMUIInfographIconListLayout init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_visualConfiguration, a3);
    v9->_screenType = a4;
  }

  return v9;
}

- (AMUIInfographIconListLayout)initWithRootFolderVisualConfiguration:(id)a3
{
  id v4;
  AMUIInfographIconListLayout *v5;

  v4 = a3;
  v5 = -[AMUIInfographIconListLayout initWithRootFolderVisualConfiguration:screenType:](self, "initWithRootFolderVisualConfiguration:screenType:", v4, SBHScreenTypeForCurrentDevice());

  return v5;
}

- (AMUIInfographIconListLayout)init
{
  id v3;
  AMUIInfographIconListLayout *v4;

  v3 = objc_alloc_init(MEMORY[0x24BEB0910]);
  v4 = -[AMUIInfographIconListLayout initWithRootFolderVisualConfiguration:](self, "initWithRootFolderVisualConfiguration:", v3);

  return v4;
}

- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration
{
  return (SBHRootFolderVisualConfiguration *)(id)-[SBHRootFolderVisualConfiguration copy](self->_visualConfiguration, "copy");
}

- (unint64_t)numberOfRowsForOrientation:(int64_t)a3
{
  return 1;
}

- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3
{
  return 2;
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  unint64_t screenType;
  NSObject *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  screenType = self->_screenType;
  if (screenType < 0x1D && ((0x1FFFFFFBu >> screenType) & 1) != 0)
  {
    v5 = dbl_23603B350[screenType];
    v6 = dbl_23603B438[screenType];
  }
  else
  {
    AMUILogInfograph();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AMUIInfographIconListLayout layoutInsetsForOrientation:].cold.1();

    v5 = 70.0;
    v6 = 70.0;
  }
  v7 = v6;
  v8 = v5;
  result.right = v8;
  result.bottom = v7;
  result.left = v5;
  result.top = v6;
  return result;
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  -[AMUIInfographIconListLayout _widgetDimensionForScreenType:](self, "_widgetDimensionForScreenType:", self->_screenType);
  return (SBIconImageInfo *)-[AMUIInfographIconListLayout _widgetCornerRadius](self, "_widgetCornerRadius");
}

- (SBHIconAccessoryVisualConfiguration)iconAccessoryVisualConfiguration
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGAffineTransform v12;

  -[AMUIInfographIconListLayout _defaultIconListLayout](self, "_defaultIconListLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconAccessoryVisualConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIInfographIconListLayout widgetScaleFactor](self, "widgetScaleFactor");
  v6 = v5;
  objc_msgSend(v4, "size");
  v8 = v7;
  v10 = v9;
  CGAffineTransformMakeScale(&v12, v6, v6);
  objc_msgSend(v4, "setSize:", v10 * v12.c + v12.a * v8, v10 * v12.d + v12.b * v8);

  return (SBHIconAccessoryVisualConfiguration *)v4;
}

- (double)_widgetDimensionForScreenType:(unint64_t)a3
{
  double v4;
  double v5;

  SBHGetScreenSpecification();
  -[AMUIInfographIconListLayout layoutInsetsForOrientation:](self, "layoutInsetsForOrientation:", 3);
  return 0.0 - v4 - v5;
}

- (double)_widgetCornerRadius
{
  double v3;
  double v4;
  double v5;

  -[AMUIInfographIconListLayout _defaultSmallWidgetIconImageInfo](self, "_defaultSmallWidgetIconImageInfo");
  v4 = v3;
  -[AMUIInfographIconListLayout widgetScaleFactor](self, "widgetScaleFactor");
  return v4 * v5;
}

- (id)_defaultIconListLayout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB08C0]), "initWithScreenType:", self->_screenType);
  objc_msgSend(v2, "layoutForIconLocation:", *MEMORY[0x24BEB09F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SBIconImageInfo)_defaultSmallWidgetIconImageInfo
{
  void *v3;
  SBIconImageInfo *result;

  -[AMUIInfographIconListLayout _defaultIconListLayout](self, "_defaultIconListLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconImageInfoForGridSizeClass:", *MEMORY[0x24BEB09D0]);

  return result;
}

- (SBIconImageInfo)iconImageInfo
{
  return -[AMUIInfographIconListLayout iconImageInfoForGridSizeClass:](self, "iconImageInfoForGridSizeClass:", *MEMORY[0x24BEB0988]);
}

- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses
{
  id v2;

  v2 = objc_alloc(MEMORY[0x24BEB08D8]);
  return (SBHIconGridSizeClassSet *)(id)objc_msgSend(v2, "initWithGridSizeClass:", *MEMORY[0x24BEB09D0]);
}

- (double)widgetScaleFactor
{
  double v3;
  double v4;
  double v5;

  -[AMUIInfographIconListLayout _widgetDimensionForScreenType:](self, "_widgetDimensionForScreenType:", self->_screenType);
  v4 = v3;
  -[AMUIInfographIconListLayout _defaultSmallWidgetIconImageInfo](self, "_defaultSmallWidgetIconImageInfo");
  return v4 / v5;
}

- (UIEdgeInsets)widgetContentMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[AMUIInfographIconListLayout _contentMarginsForMarginRatio:](self, "_contentMarginsForMarginRatio:", 0.101265823);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)widgetContentMarginsWithBackgroundRemoved
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[AMUIInfographIconListLayout _contentMarginsForMarginRatio:](self, "_contentMarginsForMarginRatio:", 0.0443037975);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)_contentMarginsForMarginRatio:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[AMUIInfographIconListLayout _defaultSmallWidgetIconImageInfo](self, "_defaultSmallWidgetIconImageInfo");
  SBHGetScreenSpecification();
  BSFloatRoundForScale();
  v4 = v3;
  v5 = v3;
  v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)widgetsSupportDynamicText
{
  return 0;
}

- (CGSize)iconSpacingForOrientation:(int64_t)a3
{
  unint64_t screenType;
  NSObject *v4;
  double v5;
  double v6;
  CGSize result;

  screenType = self->_screenType;
  if (screenType < 0x1D && ((0x1FFFFFFBu >> screenType) & 1) != 0)
  {
    v5 = dbl_23603B520[screenType];
  }
  else
  {
    AMUILogInfograph();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AMUIInfographIconListLayout iconSpacingForOrientation:].cold.1();

    v5 = 40.0;
  }
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)editingAnimationStrengthForGridSizeClass:(id)a3
{
  return 0.25;
}

- (BOOL)supportsExtensibleGridSizeClasses
{
  return 1;
}

- (void)iconListView:(id)a3 willLayoutIconView:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v4 = a4;
  objc_msgSend(v4, "icon");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isPlaceholder") & 1) != 0)
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(v4, "contentContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconImageInfo");
  objc_msgSend(v7, "_setContinuousCornerRadius:", v8);

  objc_msgSend(v4, "contentContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setNeedsLayout");
}

- (unint64_t)screenType
{
  return self->_screenType;
}

- (SBHRootFolderVisualConfiguration)visualConfiguration
{
  return self->_visualConfiguration;
}

- (void)setVisualConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_visualConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualConfiguration, 0);
}

- (void)layoutInsetsForOrientation:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  SBHStringForScreenType();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_23600A000, v1, v2, "Requesting layout insets for unexpected screen type: %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)iconSpacingForOrientation:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  SBHStringForScreenType();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_23600A000, v1, v2, "Requesting icon spacing for unexpected screen type: %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
