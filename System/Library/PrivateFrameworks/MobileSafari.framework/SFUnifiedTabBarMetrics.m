@implementation SFUnifiedTabBarMetrics

- (SFUnifiedTabBarMetrics)initWithTraitCollection:(id)a3
{
  SFUnifiedTabBarMetrics *v3;
  SFUnifiedTabBarMetrics *v4;
  SFUnifiedTabBarMetrics *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFUnifiedTabBarMetrics;
  v3 = -[SFUnifiedBarMetrics initWithTraitCollection:](&v7, sel_initWithTraitCollection_, a3);
  v4 = v3;
  if (v3)
  {
    -[SFUnifiedTabBarMetrics _sizeClassDidChange](v3, "_sizeClassDidChange");
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, self->_maximumActiveItemWidthDefaultsKey, &kvoContext);

  v4.receiver = self;
  v4.super_class = (Class)SFUnifiedTabBarMetrics;
  -[SFUnifiedTabBarMetrics dealloc](&v4, sel_dealloc);
}

- (void)setSizeClass:(unint64_t)a3
{
  if (self->_sizeClass != a3)
  {
    self->_sizeClass = a3;
    -[SFUnifiedTabBarMetrics _sizeClassDidChange](self, "_sizeClassDidChange");
  }
}

- (void)_sizeClassDidChange
{
  NSString **p_maximumActiveItemWidthDefaultsKey;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  p_maximumActiveItemWidthDefaultsKey = &self->_maximumActiveItemWidthDefaultsKey;
  v7 = self->_maximumActiveItemWidthDefaultsKey;
  objc_msgSend((id)objc_opt_class(), "_maximumActiveItemWidthDefaultsKeyForSizeClass:", self->_sizeClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)p_maximumActiveItemWidthDefaultsKey, v4);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, v7, &kvoContext);

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, v4, 4, &kvoContext);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  double v7;
  objc_super v8;

  if ((void *)kvoContext == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", self->_maximumActiveItemWidthDefaultsKey, a4, a5))
    {
      objc_msgSend((id)objc_opt_class(), "_maximumActiveItemWidthForSizeClass:", self->_sizeClass);
      self->_maximumActiveItemWidth = v7;
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFUnifiedTabBarMetrics;
    -[SFUnifiedTabBarMetrics observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

+ (double)minimumActiveItemWidthForSizeClass:(unint64_t)a3
{
  double v3;
  void *v4;
  void *v5;
  __CFString **v6;
  const __CFString *v7;
  double v8;
  double v9;

  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = SFUnifiedBarMinimumLandscapeActiveTabWidthKey;
      goto LABEL_4;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = SFUnifiedBarMinimumPortraitActiveTabWidthKey;
LABEL_4:
      v7 = *v6;
      v8 = 330.0;
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v7 = CFSTR("DebugUnifiedBarMinimumNarrowActiveTabWidth");
      v8 = 270.0;
      goto LABEL_7;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v7 = CFSTR("DebugUnifiedBarMinimumExtendedActiveTabWidth");
      v8 = 500.0;
LABEL_7:
      objc_msgSend(v4, "safari_doubleForKey:defaultValue:", v7, v8);
      v3 = v9;

      break;
    default:
      return v3;
  }
  return v3;
}

+ (double)minimumInactiveItemWidthForSizeClass:(unint64_t)a3
{
  double v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  __CFString **v8;
  double v9;
  double v10;

  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("DebugUnifiedBarMinimumInactiveTabWidth");
      *(double *)&v7 = 120.0;
      goto LABEL_6;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v8 = SFUnifiedBarMinimumPortraitInactiveTabWidthKey;
      goto LABEL_5;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v8 = SFUnifiedBarMinimumNarrowInactiveTabWidthKey;
LABEL_5:
      v6 = *v8;
      *(double *)&v7 = 100.0;
LABEL_6:
      v9 = *(double *)&v7;
      goto LABEL_8;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("DebugUnifiedBarMinimumExtendedInactiveTabWidth");
      v9 = 250.0;
LABEL_8:
      objc_msgSend(v4, "safari_doubleForKey:defaultValue:", v6, v9);
      v3 = v10;

      break;
    default:
      return v3;
  }
  return v3;
}

- (double)insetToRevealNextItem
{
  return 12.0;
}

+ (double)_maximumActiveItemWidthForSizeClass:(unint64_t)a3
{
  double v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(a1, "_maximumActiveItemWidthDefaultsKeyForSizeClass:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 <= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 664.0;
    goto LABEL_5;
  }
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 800.0;
LABEL_5:
    objc_msgSend(v6, "safari_doubleForKey:defaultValue:", v5, v8);
    v3 = v9;

  }
  return v3;
}

+ (id)_maximumActiveItemWidthDefaultsKeyForSizeClass:(unint64_t)a3
{
  if (a3 <= 3)
    a1 = *off_1E21E2320[a3];
  return a1;
}

- (double)minimumActiveItemWidth
{
  double result;

  objc_msgSend((id)objc_opt_class(), "minimumActiveItemWidthForSizeClass:", self->_sizeClass);
  return result;
}

- (double)minimumActiveItemWidthRatio
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_doubleForKey:defaultValue:", CFSTR("DebugUnifiedBarMinimumActiveTabWidthRatio"), 0.67);
  v4 = v3;

  return v4;
}

- (double)minimumInactiveItemWidth
{
  double result;

  objc_msgSend((id)objc_opt_class(), "minimumInactiveItemWidthForSizeClass:", self->_sizeClass);
  return result;
}

- (double)maximumItemSpacing
{
  return 12.0;
}

- (double)minimumItemSpacing
{
  return 6.0;
}

- (unint64_t)sizeClass
{
  return self->_sizeClass;
}

- (double)maximumActiveItemWidth
{
  return self->_maximumActiveItemWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumActiveItemWidthDefaultsKey, 0);
}

@end
