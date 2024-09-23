@implementation CNAtomView

+ (double)defaultHeight
{
  return 20.0;
}

+ (CGPoint)defaultBaselinePoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  +[CNAtomView defaultFont](CNAtomView, "defaultFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cn_baselinePointFromOriginPoint:", 0.0, 0.0);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

+ (id)defaultFont
{
  void *v2;
  void *v3;

  +[CNAutocompleteFontMetricCache sharedFontMetricCache](CNAutocompleteFontMetricCache, "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFont:forKey:", &__block_literal_global_10, CFSTR("CNAtomViewDefaultFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __25__CNAtomView_defaultFont__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB590], 0x8000, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)primaryAtomFont
{
  void *v2;
  void *v3;

  +[CNAutocompleteFontMetricCache sharedFontMetricCache](CNAutocompleteFontMetricCache, "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFont:forKey:", &__block_literal_global_34, CFSTR("CNAtomViewPrimaryFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __29__CNAtomView_primaryAtomFont__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB570]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v1, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)_defaultTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_39_0);
}

uint64_t __31__CNAtomView__defaultTintColor__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
}

+ (id)_hoveredDefaultTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_40_0);
}

id __38__CNAtomView__hoveredDefaultTintColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.086;
    v3 = 0.42;
    v4 = 0.25;
  }
  else
  {
    v2 = 0.731;
    v4 = 0.847;
    v3 = 1.0;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v2, v4, v3, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_failureTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_41_0);
}

uint64_t __31__CNAtomView__failureTintColor__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
}

+ (id)_hoveredFailureTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_42);
}

id __38__CNAtomView__hoveredFailureTintColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.462;
    v3 = 0.233;
    v4 = 0.252;
  }
  else
  {
    v2 = 0.986;
    v3 = 0.778;
    v4 = 0.767;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v2, v3, v4, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_downtimeBlockedTintColor
{
  return +[CNAtomView _failureTintColor](CNAtomView, "_failureTintColor");
}

+ (id)_hoveredDowntimeBlockedTintColor
{
  return +[CNAtomView _hoveredFailureTintColor](CNAtomView, "_hoveredFailureTintColor");
}

+ (id)_SMSTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_43_0);
}

uint64_t __27__CNAtomView__SMSTintColor__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.16, 0.772, 0.098, 1.0);
}

+ (id)_hoveredSMSTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_44_0);
}

id __34__CNAtomView__hoveredSMSTintColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.22;
    v3 = 0.405;
    v4 = 0.243;
  }
  else
  {
    v2 = 0.73;
    v3 = 0.897;
    v4 = 0.755;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v2, v3, v4, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_faceTimeTintColor
{
  if (CNComposeIsAppDesignedForVisionOS())
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemTealColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_faceTimeUnresolvedColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
}

+ (id)_invalidAddressTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
}

+ (id)_clearBackgroundTextTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
}

+ (id)_defaultLabelAttributesWithWrappingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v3 = a3;
  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setLineBreakMode:", 0);
    LODWORD(v6) = 1.0;
    objc_msgSend(v5, "setHyphenationFactor:", v6);
  }
  else
  {
    objc_msgSend(v4, "setLineBreakMode:", 4);
  }
  v7 = *MEMORY[0x1E0DC1178];
  v14[0] = v5;
  v8 = *MEMORY[0x1E0DC1140];
  v13[0] = v7;
  v13[1] = v8;
  +[CNAtomView _defaultTintColor](CNAtomView, "_defaultTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  v13[2] = *MEMORY[0x1E0DC1138];
  +[CNAtomView defaultFont](CNAtomView, "defaultFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setFirstLineIndent:(double)a3
{
  self->_firstLineIndent = a3;
  if (-[CNAtomView isWrappingEnabled](self, "isWrappingEnabled"))
    -[CNAtomView _updateLabelAttributes](self, "_updateLabelAttributes");
}

+ (id)_defaultLabelAttributesWithFont:(id)a3 wrappingEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  +[CNAtomView _defaultLabelAttributesWithWrappingEnabled:](CNAtomView, "_defaultLabelAttributesWithWrappingEnabled:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:forKey:", v5, *MEMORY[0x1E0DC1138]);
  return v7;
}

+ (id)_badgeImagesForPresentationOptions:(unint64_t)a3 iconOrder:(const unint64_t *)a4 orderingLength:(unint64_t)a5 tintColor:(id)a6 large:(BOOL)a7 variant:(int)a8
{
  uint64_t v8;
  _BOOL8 v9;
  id v13;
  void *v14;
  uint64_t v16;

  v8 = *(_QWORD *)&a8;
  v9 = a7;
  v13 = a6;
  LOBYTE(v16) = 0;
  objc_msgSend((id)objc_opt_class(), "_badgeImagesForPresentationOptions:iconOrder:orderingLength:tintColor:large:variant:selected:", a3, a4, a5, v13, v9, v8, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_badgeImagesForPresentationOptions:(unint64_t)a3 iconOrder:(const unint64_t *)a4 orderingLength:(unint64_t)a5 tintColor:(id)a6 large:(BOOL)a7 variant:(int)a8 selected:(BOOL)a9
{
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a5; --a5)
  {
    v16 = *a4++;
    v15 = v16;
    if ((v16 & a3) != 0)
    {
      CNIconImageForPresentationOption(v15, v12, v13, 0, a9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(i, "addObject:", v17);

    }
  }

  return i;
}

+ (BOOL)presentationOptions:(unint64_t *)a3 encodedIntoAddress:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;

  v5 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?:\\{PO\\:)([0-9]+)(?:\\})"), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "length");
    if (objc_msgSend(v6, "numberOfMatchesInString:options:range:", v5, 0, 0, v7))
    {
      objc_msgSend(v6, "firstMatchInString:options:range:", v5, 0, 0, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "rangeAtIndex:", 1);
      v11 = v10;

      objc_msgSend(v5, "substringWithRange:", v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");
      v14 = v13 != 0;
      if (v13)
        *a3 = objc_msgSend(v12, "integerValue");

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (CNAtomView)initWithFrame:(CGRect)a3 presentationOptions:(unint64_t)a4 separatorStyle:(int)a5 wrappingSupported:(BOOL)a6
{
  uint64_t v7;
  CNAtomView *v9;
  CNAtomView *v10;
  void *v11;
  id v12;
  uint64_t v13;
  UIView *titleLabelFillView;
  id v15;
  uint64_t v16;
  UIView *compositingView;
  CNModernAtomBackgroundView *v18;
  CNModernAtomBackgroundView *v19;
  void *v20;
  UILabel *v21;
  UILabel *label;
  CNModernAtomIconView *v23;
  uint64_t v24;
  CNModernAtomIconView *badgeIconView;
  void *v26;
  CNModernAtomIconView *v27;
  uint64_t v28;
  CNModernAtomIconView *accessoryIconView;
  void *v30;
  uint64_t v31;
  UIActivityIndicatorView *activityIndicator;
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;

  v7 = *(_QWORD *)&a5;
  v37.receiver = self;
  v37.super_class = (Class)CNAtomView;
  v9 = -[CNAtomView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    v9->_scalingFactor = 1.0;
    v9->_separatorHidden = 0;
    v9->_presentationOptions = a4;
    v9->_firstLineIndent = 0.0;
    v9->_wrappingSupported = a6;
    v9->_cachedIsWrappingEnabled = -[CNAtomView isWrappingEnabled](v9, "isWrappingEnabled");
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_separatorIsLeftAligned = objc_msgSend(v11, "userInterfaceLayoutDirection") == 1;

    v12 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabelFillView = v10->_titleLabelFillView;
    v10->_titleLabelFillView = (UIView *)v13;

    -[UIView setUserInteractionEnabled:](v10->_titleLabelFillView, "setUserInteractionEnabled:", 0);
    -[CNAtomView addSubview:](v10, "addSubview:", v10->_titleLabelFillView);
    v15 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[CNAtomView bounds](v10, "bounds");
    v16 = objc_msgSend(v15, "initWithFrame:");
    compositingView = v10->_compositingView;
    v10->_compositingView = (UIView *)v16;

    -[UIView setAutoresizingMask:](v10->_compositingView, "setAutoresizingMask:", 2);
    -[UIView setUserInteractionEnabled:](v10->_compositingView, "setUserInteractionEnabled:", 0);
    -[CNAtomView addSubview:](v10, "addSubview:", v10->_compositingView);
    v18 = [CNModernAtomBackgroundView alloc];
    -[CNAtomView bounds](v10, "bounds");
    v19 = -[CNModernAtomBackgroundView initWithFrame:](v18, "initWithFrame:");
    -[CNModernAtomBackgroundView setOpaque:](v19, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNModernAtomBackgroundView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[CNModernAtomBackgroundView setUserInteractionEnabled:](v19, "setUserInteractionEnabled:", 0);
    -[CNModernAtomBackgroundView setAutoresizingMask:](v19, "setAutoresizingMask:", 18);
    -[CNModernAtomBackgroundView setHostAtomView:](v19, "setHostAtomView:", v10);
    -[CNModernAtomBackgroundView setSeparatorStyle:](v19, "setSeparatorStyle:", v7);
    -[UIView addSubview:](v10->_compositingView, "addSubview:", v19);
    objc_storeStrong((id *)&v10->_background, v19);
    v21 = +[CNAtomView _newTextLabel](CNAtomView, "_newTextLabel");
    label = v10->_label;
    v10->_label = v21;

    -[UIView addSubview:](v10->_compositingView, "addSubview:", v10->_label);
    v23 = [CNModernAtomIconView alloc];
    -[CNAtomView bounds](v10, "bounds");
    v24 = -[CNModernAtomIconView initWithFrame:](v23, "initWithFrame:");
    badgeIconView = v10->_badgeIconView;
    v10->_badgeIconView = (CNModernAtomIconView *)v24;

    -[CNModernAtomIconView setIconPadding:](v10->_badgeIconView, "setIconPadding:", 1.25);
    -[CNModernAtomIconView setAutoresizingMask:](v10->_badgeIconView, "setAutoresizingMask:", 16);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNModernAtomIconView setBackgroundColor:](v10->_badgeIconView, "setBackgroundColor:", v26);

    -[CNModernAtomIconView setContentMode:](v10->_badgeIconView, "setContentMode:", 3);
    v27 = [CNModernAtomIconView alloc];
    -[CNAtomView bounds](v10, "bounds");
    v28 = -[CNModernAtomIconView initWithFrame:](v27, "initWithFrame:");
    accessoryIconView = v10->_accessoryIconView;
    v10->_accessoryIconView = (CNModernAtomIconView *)v28;

    -[CNModernAtomIconView setIconPadding:](v10->_accessoryIconView, "setIconPadding:", 2.5);
    -[CNModernAtomIconView setAutoresizingMask:](v10->_accessoryIconView, "setAutoresizingMask:", 20);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNModernAtomIconView setBackgroundColor:](v10->_accessoryIconView, "setBackgroundColor:", v30);

    -[CNModernAtomIconView setContentMode:](v10->_accessoryIconView, "setContentMode:", 3);
    -[CNAtomView _updateIconViewsSemanticContentAttribute](v10, "_updateIconViewsSemanticContentAttribute");
    -[CNAtomView _updateSubviewsForWrapping](v10, "_updateSubviewsForWrapping");
    if ((a4 & 0x204) != 0)
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 4);
      activityIndicator = v10->_activityIndicator;
      v10->_activityIndicator = (UIActivityIndicatorView *)v31;

    }
    v10->_disabledPresentationOptions = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v10, sel__invalidatePresentationOptions, *MEMORY[0x1E0CEB3F0], 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "quaternarySystemFillColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAtomView setBackgroundColor:](v10, "setBackgroundColor:", v34);

    -[CNAtomView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:", 4.5);
    objc_msgSend((id)objc_opt_class(), "_defaultTintColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAtomView setTintColor:](v10, "setTintColor:", v35);

  }
  return v10;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGRect v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAtomView frame](self, "frame");
  NSStringFromCGRect(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_label, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %x; frame = %@; text = '%@'>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (int)_preferredIconVariant
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[13];

  v26[12] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CEB438];
  v26[0] = *MEMORY[0x1E0CEB410];
  v26[1] = v3;
  v4 = *MEMORY[0x1E0CEB420];
  v26[2] = *MEMORY[0x1E0CEB428];
  v26[3] = v4;
  v5 = *MEMORY[0x1E0CEB400];
  v26[4] = *MEMORY[0x1E0CEB408];
  v26[5] = v5;
  v6 = *MEMORY[0x1E0CEB3E0];
  v26[6] = *MEMORY[0x1E0CEB3F8];
  v26[7] = v6;
  v7 = *MEMORY[0x1E0CEB3D0];
  v26[8] = *MEMORY[0x1E0CEB3D8];
  v26[9] = v7;
  v8 = *MEMORY[0x1E0CEB3C0];
  v26[10] = *MEMORY[0x1E0CEB3C8];
  v26[11] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v22;
    while (2)
    {
      v17 = 0;
      v18 = v15 + v14;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v12);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "isEqualToString:", v11, (_QWORD)v21) & 1) != 0)
        {
          v18 = v15 + v17;
          goto LABEL_12;
        }
        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v15 = v18;
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_12:

  -[CNAtomView scale](self, "scale");
  if (v19 > 1.0)
  {
    if (v18 + 3 >= (unint64_t)objc_msgSend(v12, "count"))
      LODWORD(v18) = 6;
    else
      LODWORD(v18) = v18 + 3;
  }

  return v18;
}

- (void)_updateIconViewsSemanticContentAttribute
{
  uint64_t v3;

  if (self->_separatorIsLeftAligned)
    v3 = 4;
  else
    v3 = 3;
  -[CNModernAtomIconView setSemanticContentAttribute:](self->_accessoryIconView, "setSemanticContentAttribute:", v3);
  -[CNModernAtomIconView setSemanticContentAttribute:](self->_badgeIconView, "setSemanticContentAttribute:", v3);
}

- (void)_updateSubviewsForWrapping
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = -[CNAtomView isWrappingEnabled](self, "isWrappingEnabled");
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", !v3);
  if (v3)
    v4 = 0;
  else
    v4 = 2;
  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", v4);
  v5 = -[CNAtomView separatorStyle](self, "separatorStyle");
  -[CNAtomView backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSeparatorStyle:", 2);

  -[CNAtomView backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSeparatorStyle:", v5);

  if (v3)
  {
    -[CNModernAtomIconView removeFromSuperview](self->_badgeIconView, "removeFromSuperview");
    -[CNModernAtomIconView removeFromSuperview](self->_accessoryIconView, "removeFromSuperview");
  }
  else
  {
    -[UIView addSubview:](self->_compositingView, "addSubview:", self->_badgeIconView);
    -[UIView addSubview:](self->_compositingView, "addSubview:", self->_accessoryIconView);
    -[CNModernAtomIconView setNeedsDisplay](self->_badgeIconView, "setNeedsDisplay");
    -[CNModernAtomIconView setNeedsDisplay](self->_accessoryIconView, "setNeedsDisplay");
  }
}

- (id)_centeredTextAttachmentWithImage:(id)a3
{
  id v4;
  CNAtomCenteredTextAttachment *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  void *v17;
  CGSize v19;

  v4 = a3;
  v5 = objc_alloc_init(CNAtomCenteredTextAttachment);
  objc_msgSend(v4, "size");
  v7 = v6;
  objc_msgSend(v4, "size");
  v9 = v8;
  objc_msgSend(v4, "size");
  v11 = v10 + 3.0;
  objc_msgSend(v4, "size");
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;
  v19.width = v11;
  v19.height = v13;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v16);

  objc_msgSend(v4, "drawInRect:", 3.0, 0.0, v7, v9);
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[UIFont capHeight](self->_titleFont, "capHeight");
  -[CNAtomCenteredTextAttachment setHeight:](v5, "setHeight:");
  -[CNAtomCenteredTextAttachment setImage:](v5, "setImage:", v17);

  return v5;
}

- (id)_chevronTextAttachment
{
  CNAtomCenteredTextAttachment *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  void *v21;
  CGSize v23;

  v3 = objc_alloc_init(CNAtomCenteredTextAttachment);
  v4 = (void *)MEMORY[0x1E0CEA650];
  -[CNAtomView titleFont](self, "titleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v4, "configurationWithPointSize:weight:scale:", 6, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "size");
  v11 = v10;
  objc_msgSend(v9, "size");
  v13 = v12;
  objc_msgSend(v9, "size");
  v15 = v14 + 9.0;
  objc_msgSend(v9, "size");
  v17 = v16;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v19;
  v23.width = v15;
  v23.height = v17;
  UIGraphicsBeginImageContextWithOptions(v23, 0, v20);

  objc_msgSend(v9, "drawInRect:", 3.0, 0.0, v11, v13);
  UIGraphicsGetImageFromCurrentImageContext();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[UIFont capHeight](self->_titleFont, "capHeight");
  -[CNAtomCenteredTextAttachment setHeight:](v3, "setHeight:");
  -[CNAtomCenteredTextAttachment setImage:](v3, "setImage:", v21);

  return v3;
}

- (BOOL)isWrappingEnabled
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  if (!self->_wrappingSupported)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (void)setIsPrimaryAddressAtom:(BOOL)a3
{
  id v4;

  if (self->_isPrimaryAddressAtom != a3)
  {
    self->_isPrimaryAddressAtom = a3;
    if (a3)
      +[CNAtomView primaryAtomFont](CNAtomView, "primaryAtomFont");
    else
      +[CNAtomView defaultFont](CNAtomView, "defaultFont");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNAtomView setTitleFont:](self, "setTitleFont:", v4);

  }
}

- (CNModernAtomBackgroundView)backgroundView
{
  return self->_background;
}

- (UIColor)effectiveTintColor
{
  UIColor *effectiveTintColor;

  effectiveTintColor = self->_effectiveTintColor;
  if (effectiveTintColor)
    return effectiveTintColor;
  -[CNAtomView tintColor](self, "tintColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setEffectiveTintColor:(id)a3
{
  UILabel *label;
  UIColor *v6;
  void *v7;
  UIColor *v8;

  v8 = (UIColor *)a3;
  if (self->_effectiveTintColor != v8)
  {
    objc_storeStrong((id *)&self->_effectiveTintColor, a3);
    label = self->_label;
    v6 = v8;
    -[UILabel setTextColor:](label, "setTextColor:", v6);
    -[CNAtomView backgroundView](self, "backgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);

  }
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (!self->_effectiveTintColor
    || (-[CNAtomView effectiveTintColor](self, "effectiveTintColor"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        -[CNAtomView tintColor](self, "tintColor"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v3, "isEqual:", v4),
        v4,
        v3,
        (v5 & 1) == 0))
  {
    -[CNAtomView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAtomView _setEffectiveTintColor:](self, "_setEffectiveTintColor:", v6);

    -[CNAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");
  }
}

- (UIFont)titleFont
{
  UIFont *titleFont;
  UIFont *v4;
  UIFont *v5;

  titleFont = self->_titleFont;
  if (!titleFont)
  {
    +[CNAtomView defaultFont](CNAtomView, "defaultFont");
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_titleFont;
    self->_titleFont = v4;

    titleFont = self->_titleFont;
  }
  return titleFont;
}

- (void)setTitleFont:(id)a3
{
  UIFont **p_titleFont;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  p_titleFont = &self->_titleFont;
  v11 = a3;
  if ((-[UIFont isEqual:](*p_titleFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    -[UILabel attributedText](self->_label, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    -[UILabel attributedText](self->_label, "attributedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v9, "removeAttribute:range:", *MEMORY[0x1E0DC1138], 0, v7);
    objc_msgSend(v9, "addAttribute:value:range:", v10, *p_titleFont, 0, v7);
    -[UILabel setAttributedText:](self->_label, "setAttributedText:", v9);
    -[CNAtomView _updateOverlayLabelText](self, "_updateOverlayLabelText");
    -[CNAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");

  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

  -[CNAtomView _updateLabelAttributes](self, "_updateLabelAttributes");
}

- (void)_updateLabelAttributes
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSString *title;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  -[CNAtomView title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("⁠"));
    if (!-[CNAtomView isWrappingEnabled](self, "isWrappingEnabled"))
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3778]);
      title = self->_title;
      -[CNAtomView titleFont](self, "titleFont");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNAtomView _defaultLabelAttributesWithFont:wrappingEnabled:](CNAtomView, "_defaultLabelAttributesWithFont:wrappingEnabled:", v8, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (id)objc_msgSend(v20, "initWithString:attributes:", title, v22);
LABEL_20:

      -[UILabel setAttributedText:](self->_label, "setAttributedText:", v40);
      -[CNAtomView effectiveTintColor](self, "effectiveTintColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_label, "setTextColor:", v36);
      -[CNAtomView _updateOverlayLabelText](self, "_updateOverlayLabelText");
      -[UILabel sizeToFit](self->_label, "sizeToFit");
      -[CNAtomView sizeToFit](self, "sizeToFit");
      -[CNAtomView setNeedsLayout](self, "setNeedsLayout");

      return;
    }
    -[CNAtomView titleFont](self, "titleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAtomView _defaultLabelAttributesWithFont:wrappingEnabled:](CNAtomView, "_defaultLabelAttributesWithFont:wrappingEnabled:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    -[CNAtomView effectiveTintColor](self, "effectiveTintColor");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0DC1140]);
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DC1178]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFirstLineHeadIndent:", self->_firstLineIndent);
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", self->_title);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertString:atIndex:", CFSTR("​"), 0);
    v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v12, v8);
    v13 = -[CNAtomView separatorStyle](self, "separatorStyle");
    v38 = v11;
    v39 = (void *)v9;
    v37 = v12;
    if (v13 == 1)
    {
      v23 = (void *)MEMORY[0x1E0CB3778];
      -[CNAtomView _chevronTextAttachment](self, "_chevronTextAttachment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "attributedStringWithAttachment:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
      if (v13)
      {
LABEL_10:
        -[CNModernAtomIconView iconImages](self->_accessoryIconView, "iconImages");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNModernAtomIconView iconImages](self->_badgeIconView, "iconImages");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "count"))
        {
          v26 = 0;
          do
          {
            objc_msgSend(v25, "objectAtIndex:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x1E0CB3498];
            -[CNAtomView _centeredTextAttachmentWithImage:](self, "_centeredTextAttachmentWithImage:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "attributedStringWithAttachment:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v40, "insertAttributedString:atIndex:", v5, 1);
            objc_msgSend(v40, "insertAttributedString:atIndex:", v30, 1);

            ++v26;
          }
          while (objc_msgSend(v25, "count") > v26);
        }
        if (objc_msgSend(v24, "count"))
        {
          v31 = 0;
          do
          {
            objc_msgSend(v24, "objectAtIndex:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)MEMORY[0x1E0CB3498];
            -[CNAtomView _centeredTextAttachmentWithImage:](self, "_centeredTextAttachmentWithImage:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "attributedStringWithAttachment:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v40, "insertAttributedString:atIndex:", v5, objc_msgSend(v40, "length"));
            objc_msgSend(v40, "insertAttributedString:atIndex:", v35, objc_msgSend(v40, "length"));

            ++v31;
          }
          while (objc_msgSend(v24, "count") > v31);
        }
        if (v14)
        {
          if (!self->_separatorHidden)
          {
            objc_msgSend(v40, "insertAttributedString:atIndex:", v5, objc_msgSend(v40, "length"));
            objc_msgSend(v40, "insertAttributedString:atIndex:", v14, objc_msgSend(v40, "length"));
          }
        }

        v22 = v39;
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAtomView titleFont](self, "titleFont");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x1E0DC1138]);

      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.5, 1.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v17, v10);

      v18 = objc_alloc(MEMORY[0x1E0CB3778]);
      CNAUILocalizedAddressSeparator();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v15);

    }
    goto LABEL_10;
  }
}

- (void)_invalidatePresentationOptions
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  _BOOL4 cachedIsWrappingEnabled;
  id v11;

  -[CNAtomView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  if (-[CNAtomView tintAdjustmentMode](self, "tintAdjustmentMode") == 2)
  {
    v3 = 0;
    goto LABEL_18;
  }
  if ((-[CNAtomView presentationOptions](self, "presentationOptions") & 0x2000) != 0)
  {
    +[CNAtomView _downtimeBlockedTintColor](CNAtomView, "_downtimeBlockedTintColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if ((-[CNAtomView presentationOptions](self, "presentationOptions") & 1) != 0)
  {
    +[CNAtomView _failureTintColor](CNAtomView, "_failureTintColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if ((-[CNAtomView presentationOptions](self, "presentationOptions") & 0x10000) != 0)
  {
    +[CNAtomView _faceTimeUnresolvedColor](CNAtomView, "_faceTimeUnresolvedColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if ((-[CNAtomView presentationOptions](self, "presentationOptions") & 2) != 0)
  {
    +[CNAtomView _SMSTintColor](CNAtomView, "_SMSTintColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if ((-[CNAtomView presentationOptions](self, "presentationOptions") & 0x8000) != 0)
  {
    +[CNAtomView _faceTimeTintColor](CNAtomView, "_faceTimeTintColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((-[CNAtomView presentationOptions](self, "presentationOptions") & 0x20000) == 0)
    {
LABEL_16:
      -[CNAtomView tintColor](self, "tintColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    +[CNAtomView _invalidAddressTintColor](CNAtomView, "_invalidAddressTintColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)v4;
  if (!v4)
    goto LABEL_16;
LABEL_17:
  -[CNAtomView _setEffectiveTintColor:](self, "_setEffectiveTintColor:", v3);
LABEL_18:
  v5 = -[CNAtomView presentationOptions](self, "presentationOptions");
  v6 = -[CNAtomView _preferredIconVariant](self, "_preferredIconVariant");
  v11 = v3;
  v7 = -[CNAtomView isPrimaryAddressAtom](self, "isPrimaryAddressAtom");
  +[CNAtomView _badgeImagesForPresentationOptions:iconOrder:orderingLength:tintColor:large:variant:](CNAtomView, "_badgeImagesForPresentationOptions:iconOrder:orderingLength:tintColor:large:variant:", v5, &_badgeStyleOrder, 6, v11, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNModernAtomIconView setIconImages:](self->_badgeIconView, "setIconImages:", v8);
  +[CNAtomView _badgeImagesForPresentationOptions:iconOrder:orderingLength:tintColor:large:variant:](CNAtomView, "_badgeImagesForPresentationOptions:iconOrder:orderingLength:tintColor:large:variant:", v5, &_accessoryStyleOrder, 5, v11, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNModernAtomIconView setIconImages:](self->_accessoryIconView, "setIconImages:", v9);
  -[CNAtomView _updateActivityIndicator](self, "_updateActivityIndicator");
  -[CNAtomView setNeedsLayout](self, "setNeedsLayout");
  cachedIsWrappingEnabled = self->_cachedIsWrappingEnabled;
  if (cachedIsWrappingEnabled == -[CNAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    -[CNModernAtomIconView setNeedsDisplay](self->_badgeIconView, "setNeedsDisplay");
    -[CNModernAtomIconView setNeedsDisplay](self->_accessoryIconView, "setNeedsDisplay");
  }
  else
  {
    self->_cachedIsWrappingEnabled = -[CNAtomView isWrappingEnabled](self, "isWrappingEnabled");
    -[CNAtomView _updateSubviewsForWrapping](self, "_updateSubviewsForWrapping");
    -[CNAtomView _updateLabelAttributes](self, "_updateLabelAttributes");
  }
  -[CNModernAtomBackgroundView invalidateIntrinsicContentSize](self->_background, "invalidateIntrinsicContentSize");
  -[CNModernAtomBackgroundView setNeedsLayout](self->_background, "setNeedsLayout");

}

- (void)setPresentationOptions:(unint64_t)a3
{
  if (self->_presentationOptions != a3)
  {
    self->_presentationOptions = a3;
    -[CNAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");
  }
}

- (void)appendPresentationOption:(unint64_t)a3
{
  self->_presentationOptions |= a3;
  -[CNAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");
}

- (void)clearPresentationOption:(unint64_t)a3
{
  self->_presentationOptions &= ~a3;
  -[CNAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");
}

- (void)_setPresentationOption:(unint64_t)a3 enabled:(BOOL)a4
{
  unint64_t v4;

  if (a4)
    v4 = self->_disabledPresentationOptions & ~a3;
  else
    v4 = self->_disabledPresentationOptions | a3;
  self->_disabledPresentationOptions = v4;
  -[CNAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");
}

- (unint64_t)effectivePresentationOptions
{
  return -[CNAtomView presentationOptions](self, "presentationOptions") & ~self->_disabledPresentationOptions;
}

- (void)setSeparatorHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  self->_separatorHidden = a3;
  if (-[CNAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    -[CNAtomView _updateLabelAttributes](self, "_updateLabelAttributes");
  }
  else
  {
    -[CNAtomView backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "separatorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v3);

  }
  -[CNAtomView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (BOOL)separatorHidden
{
  BOOL v2;
  void *v3;

  if (self->_separatorHidden)
    return 1;
  -[CNAtomView backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "separatorStyle") == 2;

  return v2;
}

- (void)setSeparatorStyle:(int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  self->_separatorStyle = a3;
  -[CNAtomView backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorStyle:", v3);

  if (-[CNAtomView isWrappingEnabled](self, "isWrappingEnabled"))
    -[CNAtomView _updateLabelAttributes](self, "_updateLabelAttributes");
  else
    -[CNAtomView sizeToFit](self, "sizeToFit");
}

- (int)separatorStyle
{
  void *v2;
  int v3;

  -[CNAtomView backgroundView](self, "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "separatorStyle");

  return v3;
}

- (void)setSeparatorIsLeftAligned:(BOOL)a3
{
  void *v4;

  if (self->_separatorIsLeftAligned != a3)
  {
    self->_separatorIsLeftAligned = a3;
    -[CNAtomView _updateIconViewsSemanticContentAttribute](self, "_updateIconViewsSemanticContentAttribute");
    -[CNAtomView backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutSubviews");

    -[CNAtomView layoutSubviews](self, "layoutSubviews");
  }
}

- (void)setSelected:(BOOL)a3
{
  -[CNAtomView setSelected:animated:](self, "setSelected:animated:", a3, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  -[CNAtomView setSelected:animated:style:](self, "setSelected:animated:style:", a3, a4, 1);
}

- (BOOL)appearsSelected
{
  void *v3;
  BOOL v4;

  if (!-[CNAtomView isSelected](self, "isSelected"))
    return 0;
  -[CNAtomView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activeAppearance") == 1;

  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 style:(unint64_t)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[CNAtomView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "activeAppearance");

  -[CNAtomView backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelected:animated:style:updateVisualSelection:", v7, v6, a5, v10 == 1);

  if (self->_selected != v7)
  {
    self->_selected = v7;
    if (v10 == 1)
      -[CNAtomView displaySelectionChangeWithAnimation:](self, "displaySelectionChangeWithAnimation:", v6);
  }
}

- (void)displaySelectionChangeWithAnimation:(BOOL)a3
{
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  float v8;
  _QWORD v9[5];
  BOOL v10;

  -[CNAtomView _updateActivityIndicator](self, "_updateActivityIndicator");
  v5 = -[CNAtomView appearsSelected](self, "appearsSelected");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__CNAtomView_displaySelectionChangeWithAnimation___block_invoke;
  v9[3] = &unk_1E62BFBB8;
  v9[4] = self;
  v10 = v5;
  v6 = MEMORY[0x1B5E16810](v9);
  v7 = (void *)v6;
  if (!a3)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v6, 0.15);
  if (v5)
  {
LABEL_5:
    -[CNAtomView _updateCompositingFilters](self, "_updateCompositingFilters");
    goto LABEL_6;
  }
  UIAnimationDragCoefficient();
  -[CNAtomView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateCompositingFilters, 0, v8 * 0.15);
LABEL_6:

}

void __50__CNAtomView_displaySelectionChangeWithAnimation___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "presentationOptions") & 0x20000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateDisplayForInvalidAddressForSelectedState:", *(unsigned __int8 *)(a1 + 40));
  }
  else
  {
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setBackgroundColor:", v2);

  }
}

- (void)updateDisplayForInvalidAddressForSelectedState:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAtomView _setEffectiveTintColor:](self, "_setEffectiveTintColor:", v8);
    -[CNAtomView backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v4);

    LOBYTE(v7) = 1;
    +[CNAtomView _badgeImagesForPresentationOptions:iconOrder:orderingLength:tintColor:large:variant:selected:](CNAtomView, "_badgeImagesForPresentationOptions:iconOrder:orderingLength:tintColor:large:variant:selected:", self->_presentationOptions, &_badgeStyleOrder, 6, v8, -[CNAtomView isPrimaryAddressAtom](self, "isPrimaryAddressAtom"), -[CNAtomView _preferredIconVariant](self, "_preferredIconVariant"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNModernAtomIconView setIconImages:](self->_badgeIconView, "setIconImages:", v6);

  }
  else
  {
    -[CNAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");
  }
}

- (BOOL)hidesVIPIndicator
{
  return (LOBYTE(self->_disabledPresentationOptions) >> 4) & 1;
}

- (void)setHidesVIPIndicator:(BOOL)a3
{
  -[CNAtomView _setPresentationOption:enabled:](self, "_setPresentationOption:enabled:", 16, !a3);
}

+ (id)_newTextLabel
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CEA700]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setAutoresizingMask:", 16);
  objc_msgSend(v3, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  objc_msgSend(v3, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);
  objc_msgSend(v3, "_setOverallWritingDirectionFollowsLayoutDirection:", 1);
  return v3;
}

- (void)_updateOverlayLabelText
{
  void *v3;
  id v4;

  if (self->_overlayLabelForNonColoredGlyphs)
  {
    -[UILabel text](self->_label, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CNSubstringRangesContainingEmojiInString();
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[CNAtomView setupOverlayLabelTextForEmojiRanges:](self, "setupOverlayLabelTextForEmojiRanges:", v4);
  }
}

- (void)setupOverlayLabelTextForEmojiRanges:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[UILabel attributedText](self->_label, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAttributedString:", v6);

  v8 = objc_msgSend(v7, "length");
  objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], self->_titleFont, 0, v8);
  v9 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v9, v10, 0, v8);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
        objc_msgSend(MEMORY[0x1E0CEA478], "labelColor", (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "rangeValue");
        objc_msgSend(v7, "addAttribute:value:range:", v9, v17, v18, v19);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  -[UILabel setAttributedText:](self->_overlayLabelForNonColoredGlyphs, "setAttributedText:", v7);
}

- (void)_setupOverlayLabelForNonColoredGlyphs
{
  void *v3;
  UILabel *v4;
  UILabel *overlayLabelForNonColoredGlyphs;
  id v6;

  if (!self->_overlayLabelForNonColoredGlyphs)
  {
    -[UILabel text](self->_label, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CNSubstringRangesContainingEmojiInString();
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      v4 = +[CNAtomView _newTextLabel](CNAtomView, "_newTextLabel");
      overlayLabelForNonColoredGlyphs = self->_overlayLabelForNonColoredGlyphs;
      self->_overlayLabelForNonColoredGlyphs = v4;

      -[CNAtomView setupOverlayLabelTextForEmojiRanges:](self, "setupOverlayLabelTextForEmojiRanges:", v6);
      -[CNAtomView addSubview:](self, "addSubview:", self->_overlayLabelForNonColoredGlyphs);
    }

  }
}

- (void)_updateCompositingFilters
{
  unint64_t v3;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  uint64_t j;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  -[CNAtomView _setupOverlayLabelForNonColoredGlyphs](self, "_setupOverlayLabelForNonColoredGlyphs");
  v3 = -[CNAtomView presentationOptions](self, "presentationOptions") & 0x20000;
  if (self->_selected && v3 == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v10[0] = self->_badgeIconView;
  v10[1] = self->_accessoryIconView;
  v10[2] = self->_label;
  -[CNAtomView backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "separatorView");
  v10[3] = objc_claimAutoreleasedReturnValue();

  for (i = 0; i != 4; ++i)
  {
    objc_msgSend((id)v10[i], "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompositingFilter:", v5);

  }
  for (j = 3; j != -1; --j)

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNAtomView;
  -[CNAtomView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[CNAtomView _updateActivityIndicator](self, "_updateActivityIndicator");
  if (-[CNAtomView isSelected](self, "isSelected"))
  {
    -[CNAtomView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "activeAppearance");
    v7 = objc_msgSend(v4, "activeAppearance");

    if (v6 != v7)
    {
      -[CNAtomView backgroundView](self, "backgroundView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displaySelectionChangeWithAnimation:", 0);

      -[CNAtomView displaySelectionChangeWithAnimation:](self, "displaySelectionChangeWithAnimation:", 0);
    }
  }

}

- (void)_updateActivityIndicator
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *v8;
  UIActivityIndicatorView *v9;
  UIActivityIndicatorView *v10;

  v3 = -[CNAtomView presentationOptions](self, "presentationOptions") & 0x204;
  if (-[CNAtomView isSelected](self, "isSelected"))
  {
    v4 = 3;
  }
  else
  {
    -[CNAtomView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceStyle") == 2)
      v4 = 3;
    else
      v4 = 4;

  }
  activityIndicator = self->_activityIndicator;
  if (v3)
  {
    if (activityIndicator)
    {
      if (-[UIActivityIndicatorView activityIndicatorViewStyle](activityIndicator, "activityIndicatorViewStyle") == v4)
        return;
      -[UIActivityIndicatorView removeFromSuperview](self->_activityIndicator, "removeFromSuperview");
      v7 = self->_activityIndicator;
      self->_activityIndicator = 0;

    }
    v8 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", v4);
    v9 = self->_activityIndicator;
    self->_activityIndicator = v8;

    -[CNAtomView addSubview:](self, "addSubview:", self->_activityIndicator);
    -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
    -[CNAtomView setNeedsLayout](self, "setNeedsLayout");
    -[CNAtomView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  else if (activityIndicator)
  {
    -[UIActivityIndicatorView removeFromSuperview](activityIndicator, "removeFromSuperview");
    v10 = self->_activityIndicator;
    self->_activityIndicator = 0;

  }
}

- (void)_updateFontIfNecessary
{
  uint64_t v3;
  UIFont *titleFont;
  void *v5;
  int v6;
  id v7;

  if (-[CNAtomView isPrimaryAddressAtom](self, "isPrimaryAddressAtom"))
  {
    objc_msgSend((id)objc_opt_class(), "primaryAtomFont");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (id)v3;
    -[CNAtomView setTitleFont:](self, "setTitleFont:", v3);

    return;
  }
  titleFont = self->_titleFont;
  if (!titleFont
    || (objc_msgSend((id)objc_opt_class(), "primaryAtomFont"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[UIFont isEqual:](titleFont, "isEqual:", v5),
        v5,
        v6))
  {
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
}

- (double)preferredWidth
{
  double result;

  -[CNAtomView preferredWidthWithSizeConstraints:](self, "preferredWidthWithSizeConstraints:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[CNAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    -[CNAtomView _leftPadding](self, "_leftPadding");
    v7 = v6;
    -[CNAtomView _rightPadding](self, "_rightPadding");
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", fmax(width - (v7 + v8), 0.0), 1.79769313e308);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CNAtomView;
    -[CNAtomView sizeThatFits:](&v11, sel_sizeThatFits_, width, height);
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)preferredWidthWithSizeConstraints:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double result;

  height = a3.height;
  width = a3.width;
  -[CNAtomView _leftPadding](self, "_leftPadding");
  v7 = v6;
  -[CNAtomView _rightPadding](self, "_rightPadding");
  v9 = fmax(width - (v7 + v8), 0.0);
  -[UILabel attributedText](self->_label, "attributedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "boundingRectWithSize:options:context:", 1, 0, v9, height);
  v12 = ceil(v11);

  -[CNAtomView _leftPadding](self, "_leftPadding");
  v14 = v13 + v12;
  -[CNAtomView _rightPadding](self, "_rightPadding");
  result = fmax(v15 + v14, 25.0);
  if (width < result && width > 0.0)
    return width;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double firstLineIndent;
  double v21;
  void *v22;
  double v23;
  UILabel *label;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _BOOL4 separatorIsLeftAligned;
  CGFloat v36;
  double MaxX;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  UIView *titleLabelFillView;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  UIActivityIndicatorView *activityIndicator;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  char v62;
  BOOL v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double rect;
  objc_super v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  -[CNAtomView _updateFontIfNecessary](self, "_updateFontIfNecessary");
  -[CNAtomView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_compositingView, "setFrame:");
  rect = v8;
  -[CNAtomView preferredWidthWithSizeConstraints:](self, "preferredWidthWithSizeConstraints:", v8, v10);
  v12 = v11;
  -[UILabel bounds](self->_label, "bounds");
  v14 = v13;
  -[UILabel font](self->_label, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineHeight");
  v17 = round(v14 / v16);

  if (-[CNAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    -[CNAtomView titleLabel](self, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v12 = v19 + 4.0;

    if (v17 == 1.0)
    {
      firstLineIndent = self->_firstLineIndent;
      v12 = v12 - firstLineIndent;
      v21 = firstLineIndent + 0.0;
    }
    else
    {
      v21 = 0.0;
    }
  }
  else
  {
    v21 = 0.0;
    if (!-[CNAtomView separatorHidden](self, "separatorHidden")
      && !-[CNAtomView separatorStyle](self, "separatorStyle"))
    {
      -[CNAtomView backgroundView](self, "backgroundView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "separatorWidth");
      v12 = v12 - v23;

    }
  }
  -[CNModernAtomBackgroundView setFrame:](self->_background, "setFrame:", v21, 0.0, v12, v10);
  if (-[CNAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    label = self->_label;
    -[CNAtomView bounds](self, "bounds");
    -[UILabel sizeThatFits:](label, "sizeThatFits:", v25, v26);
    v28 = v27;
    v30 = v29;
  }
  else
  {
    -[CNAtomView _leftPadding](self, "_leftPadding");
    -[CNAtomView _rightPadding](self, "_rightPadding");
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v30 = v31;
    UIRoundToViewScale();
    v28 = v32;
  }
  -[CNAtomView _leftPadding](self, "_leftPadding");
  v34 = v33;
  separatorIsLeftAligned = self->_separatorIsLeftAligned;
  if (self->_separatorIsLeftAligned)
  {
    v36 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v71.origin.x = v4;
    v71.origin.y = v6;
    v71.size.width = rect;
    v71.size.height = v10;
    MaxX = CGRectGetMaxX(v71);
    v72.origin.x = v34;
    v72.origin.y = v36;
    v72.size.width = v28;
    v72.size.height = v30;
    v38 = MaxX - CGRectGetWidth(v72);
    -[CNAtomView _leftPadding](self, "_leftPadding");
    v34 = v38 - v39;
  }
  v40 = round(v10 * 0.5 - v30 * 0.5);
  -[UILabel setFrame:](self->_label, "setFrame:", v34, v40, v28, v30);
  if (self->_overlayLabelForNonColoredGlyphs)
  {
    -[UILabel frame](self->_label, "frame");
    -[UILabel setFrame:](self->_overlayLabelForNonColoredGlyphs, "setFrame:");
  }
  if (-[CNAtomView isWrappingEnabled](self, "isWrappingEnabled") && v17 == 1.0)
  {
    v41 = self->_firstLineIndent;
    v42 = v34 + v41;
    v43 = v28 - v41;
    titleLabelFillView = self->_titleLabelFillView;
    v45 = v40;
  }
  else
  {
    titleLabelFillView = self->_titleLabelFillView;
    v42 = v34;
    v45 = v40;
    v43 = v28;
  }
  -[UIView setFrame:](titleLabelFillView, "setFrame:", v42, v45, v43, v30);
  -[CNModernAtomIconView preferredWidth](self->_badgeIconView, "preferredWidth");
  v47 = v46;
  -[CNModernAtomIconView preferredWidth](self->_accessoryIconView, "preferredWidth");
  v49 = v48;
  -[CNAtomView _leftInset](self, "_leftInset");
  if (separatorIsLeftAligned)
  {
    v51 = rect - v47 - v50;
    v73.origin.x = v34;
    v73.origin.y = v40;
    v73.size.width = v28;
    v73.size.height = v30;
    v52 = CGRectGetMinX(v73) + -2.5 - v49;
  }
  else
  {
    v51 = v50 + self->_firstLineIndent;
    v74.origin.x = v34;
    v74.origin.y = v40;
    v74.size.width = v28;
    v74.size.height = v30;
    v52 = CGRectGetMaxX(v74) + 2.5;
  }
  -[CNModernAtomIconView setFrame:](self->_badgeIconView, "setFrame:", v51, 0.0, v47, v10);
  -[CNModernAtomIconView setFrame:](self->_accessoryIconView, "setFrame:", v52, 0.0, v49, v10);
  -[CNAtomView baselinePoint](self, "baselinePoint");
  v54 = v53;
  -[CNModernAtomIconView setDrawingOffset:](self->_accessoryIconView, "setDrawingOffset:", 0.0);
  -[CNModernAtomIconView setDrawingOffset:](self->_badgeIconView, "setDrawingOffset:", 0.0, v54);
  activityIndicator = self->_activityIndicator;
  if (activityIndicator)
  {
    -[UIActivityIndicatorView frame](activityIndicator, "frame");
    v57 = v56;
    v59 = v58;
    UIRoundToViewScale();
    v61 = v60;
    if (separatorIsLeftAligned)
      v62 = (self->_presentationOptions & 0x200) == 0;
    else
      v62 = (self->_presentationOptions & 0x200) >> 9;
    v63 = -[CNAtomView separatorHidden](self, "separatorHidden")
       || -[CNAtomView separatorStyle](self, "separatorStyle") != 0;
    if ((v62 & 1) != 0)
    {
      if (separatorIsLeftAligned)
        v64 = 7.0;
      else
        v64 = 5.0;
      if (!separatorIsLeftAligned)
        v63 = 1;
      if (v63)
        goto LABEL_44;
      -[CNAtomView backgroundView](self, "backgroundView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "separatorWidth");
      v64 = v64 + v66;
    }
    else
    {
      v67 = 5.0;
      if (!separatorIsLeftAligned)
        v67 = 7.0;
      v64 = rect - v67 - v57;
      if (separatorIsLeftAligned)
        v63 = 1;
      if (v63)
        goto LABEL_44;
      -[CNAtomView backgroundView](self, "backgroundView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "separatorWidth");
      v64 = v64 - v68;
    }

LABEL_44:
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v64, v61, v57, v59);
  }
  v70.receiver = self;
  v70.super_class = (Class)CNAtomView;
  -[CNAtomView layoutSubviews](&v70, sel_layoutSubviews);
}

- (CGRect)selectionFrame
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[CNModernAtomBackgroundView selectedView](self->_background, "selectedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[CNAtomView convertRect:fromView:](self, "convertRect:fromView:", self->_background);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[CNAtomView _leftInset](self, "_leftInset");
  v4 = v3;
  -[CNAtomView _rightInset](self, "_rightInset");
  v6 = v5;
  v7 = 0.0;
  v8 = 0.0;
  v9 = v4;
  result.right = v6;
  result.bottom = v8;
  result.left = v9;
  result.top = v7;
  return result;
}

- (double)_leftInset
{
  return floor(self->_scalingFactor * 4.0);
}

- (double)_rightInset
{
  double v3;
  void *v4;
  double v5;
  double result;

  v3 = 3.0;
  if (!-[CNAtomView separatorHidden](self, "separatorHidden"))
  {
    -[CNAtomView backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "separatorWidth");
    v3 = v5 + 5.0;

  }
  result = 0.0;
  if (self->_separatorIsLeftAligned)
    return v3;
  return result;
}

- (double)_rightPadding
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  UIActivityIndicatorView *activityIndicator;
  CGRect v13;

  v3 = -[CNAtomView separatorHidden](self, "separatorHidden");
  if (-[CNAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    v4 = 1;
  }
  else
  {
    -[CNModernAtomIconView iconImages](self->_accessoryIconView, "iconImages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") == 0;

  }
  v6 = 4.0;
  if (!v3 || !v4)
  {
    v6 = 2.0;
    if (!v3)
    {
      -[CNAtomView backgroundView](self, "backgroundView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "separatorWidth");
      v9 = v8 + 2.0;

      v6 = v9 + 2.0;
    }
    if (!v4)
    {
      -[CNModernAtomIconView preferredWidth](self->_accessoryIconView, "preferredWidth");
      v6 = v6 + -2.0 + v10 + 5.0;
    }
  }
  activityIndicator = self->_activityIndicator;
  if (activityIndicator && (self->_presentationOptions & 4) != 0)
  {
    -[UIActivityIndicatorView frame](activityIndicator, "frame");
    v6 = v6 + CGRectGetWidth(v13) + 5.0;
  }
  return v6 * self->_scalingFactor;
}

- (double)_leftPadding
{
  double v3;
  double v4;
  UIActivityIndicatorView *activityIndicator;
  CGRect v7;

  v3 = 4.0;
  if (!-[CNAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    -[CNModernAtomIconView preferredWidth](self->_badgeIconView, "preferredWidth");
    v3 = v4 + 4.0;
  }
  activityIndicator = self->_activityIndicator;
  if (activityIndicator && (self->_presentationOptions & 0x200) != 0)
  {
    -[UIActivityIndicatorView frame](activityIndicator, "frame");
    return v3 + CGRectGetWidth(v7) + 5.0;
  }
  return v3;
}

- (double)scale
{
  return self->_scalingFactor;
}

- (void)setScale:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  if (self->_scalingFactor != a3)
  {
    self->_scalingFactor = a3;
    -[CNAtomView backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScalingFactor:", a3);

    -[CNAtomView titleFont](self, "titleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a3 != 1.0)
    {
      v9 = v6;
      objc_msgSend(v6, "_fontScaledByScaleFactor:", self->_scalingFactor);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    v10 = v7;
    -[CNAtomView setTitleFont:](self, "setTitleFont:", v7);
    -[CNAtomView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (CGPoint)baselinePoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[UILabel frame](self->_label, "frame");
  v4 = v3;
  -[UILabel _firstLineBaseline](self->_label, "_firstLineBaseline");
  v6 = v4 + v5;
  v7 = 0.0;
  result.y = v6;
  result.x = v7;
  return result;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[CNAtomView preferredWidth](self, "preferredWidth");
  v4 = v3;
  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  v6 = v5 + 6.0;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)performBuildInAnimationFromTextColor:(id)a3 withDuration:(double)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = (objc_class *)MEMORY[0x1E0CEA700];
  v7 = a3;
  v8 = [v6 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UILabel attributedText](self->_label, "attributedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedText:", v10);

  -[UILabel frame](self->_label, "frame");
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(v9, "setTextColor:", v7);

  -[CNAtomView addSubview:](self, "addSubview:", v9);
  -[CNModernAtomBackgroundView setAlpha:](self->_background, "setAlpha:", 0.0);
  -[UILabel setAlpha:](self->_label, "setAlpha:", 0.0);
  v11 = MEMORY[0x1E0C809B0];
  v12 = (void *)MEMORY[0x1E0CEABB0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__CNAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke;
  v16[3] = &unk_1E62BF0D0;
  v16[4] = self;
  v17 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __64__CNAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke_2;
  v14[3] = &unk_1E62BF048;
  v15 = v17;
  v13 = v17;
  objc_msgSend(v12, "animateWithDuration:animations:completion:", v16, v14, a4);

}

uint64_t __64__CNAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __64__CNAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
  return result;
}

- (id)menuConfigurationForChevronButton
{
  return 0;
}

- (NSString)title
{
  return self->_title;
}

- (UILabel)titleLabel
{
  return self->_label;
}

- (CNModernAtomIconView)accessoryIconView
{
  return self->_accessoryIconView;
}

- (CNModernAtomIconView)badgeIconView
{
  return self->_badgeIconView;
}

- (BOOL)isPrimaryAddressAtom
{
  return self->_isPrimaryAddressAtom;
}

- (BOOL)separatorIsLeftAligned
{
  return self->_separatorIsLeftAligned;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (unint64_t)presentationOptions
{
  return self->_presentationOptions;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (double)firstLineIndent
{
  return self->_firstLineIndent;
}

- (UIImageView)downwardChevronImageView
{
  return self->_downwardChevronImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downwardChevronImageView, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_overlayLabelForNonColoredGlyphs, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_titleLabelFillView, 0);
  objc_storeStrong((id *)&self->_compositingView, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_baselineView, 0);
  objc_storeStrong((id *)&self->_effectiveTintColor, 0);
  objc_storeStrong((id *)&self->_accessoryIconView, 0);
  objc_storeStrong((id *)&self->_badgeIconView, 0);
}

@end
