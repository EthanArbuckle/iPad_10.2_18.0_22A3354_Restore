@implementation MFModernAtomView

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

  +[MFModernAtomView defaultFont](MFModernAtomView, "defaultFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mf_baselinePointFromOriginPoint:", 0.0, 0.0);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

+ (double)horizontalPadding
{
  return 6.0;
}

+ (id)defaultFont
{
  void *v2;
  void *v3;

  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFont:forKey:", &__block_literal_global_28, CFSTR("MFModernAtomViewDefaultFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __31__MFModernAtomView_defaultFont__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0x8000, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)primaryAtomFont
{
  void *v2;
  void *v3;

  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFont:forKey:", &__block_literal_global_28, CFSTR("MFModernAtomViewPrimaryFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __35__MFModernAtomView_primaryAtomFont__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AD8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v1, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)_defaultTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (id)_failureTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

+ (id)_SMSTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.16, 0.772, 0.098, 1.0);
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
  +[MFModernAtomView _defaultTintColor](MFModernAtomView, "_defaultTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  v13[2] = *MEMORY[0x1E0DC1138];
  +[MFModernAtomView defaultFont](MFModernAtomView, "defaultFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setFirstLineIndent:(double)a3
{
  self->_firstLineIndent = a3;
  if (-[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled"))
    -[MFModernAtomView _updateLabelAttributes](self, "_updateLabelAttributes");
}

+ (id)_defaultLabelAttributesWithFont:(id)a3 wrappingEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  +[MFModernAtomView _defaultLabelAttributesWithWrappingEnabled:](MFModernAtomView, "_defaultLabelAttributesWithWrappingEnabled:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:forKey:", v5, *MEMORY[0x1E0DC1138]);
  return v7;
}

+ (id)_badgeImagesForPresentationOptions:(unint64_t)a3 iconOrder:(const unint64_t *)a4 orderingLength:(unint64_t)a5 tintColor:(id)a6 large:(BOOL)a7 variant:(int64_t)a8
{
  _BOOL4 v9;
  id v13;
  void *i;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v9 = a7;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a5; --a5)
  {
    v16 = *a4++;
    v15 = v16;
    if ((v16 & a3) != 0)
    {
      MFAtomViewIconImageForPresentationOption(v15, v13, a8, v9);
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

- (MFModernAtomView)initWithFrame:(CGRect)a3 presentationOptions:(unint64_t)a4 separatorStyle:(int64_t)a5 wrappingSupported:(BOOL)a6
{
  MFModernAtomView *v9;
  MFModernAtomView *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  UIView *titleLabelFillView;
  id v19;
  uint64_t v20;
  UIView *compositingView;
  MFModernAtomBackgroundView *v22;
  MFModernAtomBackgroundView *v23;
  void *v24;
  uint64_t v25;
  UILabel *label;
  UILabel *v27;
  void *v28;
  MFModernAtomIconView *v29;
  uint64_t v30;
  MFModernAtomIconView *badgeIconView;
  void *v32;
  MFModernAtomIconView *v33;
  uint64_t v34;
  MFModernAtomIconView *accessoryIconView;
  void *v36;
  uint64_t v37;
  UIActivityIndicatorView *activityIndicator;
  void *v39;
  void *v40;
  void *v41;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)MFModernAtomView;
  v9 = -[MFModernAtomView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    v9->_scalingFactor = 1.0;
    v9->_separatorHidden = 0;
    v9->_presentationOptions = a4;
    v9->_firstLineIndent = 0.0;
    v9->_wrappingSupported = a6;
    v9->_cachedIsWrappingEnabled = -[MFModernAtomView isWrappingEnabled](v9, "isWrappingEnabled");
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_separatorIsLeftAligned = objc_msgSend(v11, "userInterfaceLayoutDirection") == 1;

    v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v13 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v17 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], v14, v15, v16);
    titleLabelFillView = v10->_titleLabelFillView;
    v10->_titleLabelFillView = (UIView *)v17;

    -[UIView setUserInteractionEnabled:](v10->_titleLabelFillView, "setUserInteractionEnabled:", 0);
    -[MFModernAtomView addSubview:](v10, "addSubview:", v10->_titleLabelFillView);
    v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[MFModernAtomView bounds](v10, "bounds");
    v20 = objc_msgSend(v19, "initWithFrame:");
    compositingView = v10->_compositingView;
    v10->_compositingView = (UIView *)v20;

    -[UIView setAutoresizingMask:](v10->_compositingView, "setAutoresizingMask:", 2);
    -[UIView setUserInteractionEnabled:](v10->_compositingView, "setUserInteractionEnabled:", 0);
    -[MFModernAtomView addSubview:](v10, "addSubview:", v10->_compositingView);
    v22 = [MFModernAtomBackgroundView alloc];
    -[MFModernAtomView bounds](v10, "bounds");
    v23 = -[MFModernAtomBackgroundView initWithFrame:](v22, "initWithFrame:");
    -[MFModernAtomBackgroundView setOpaque:](v23, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFModernAtomBackgroundView setBackgroundColor:](v23, "setBackgroundColor:", v24);

    -[MFModernAtomBackgroundView setUserInteractionEnabled:](v23, "setUserInteractionEnabled:", 0);
    -[MFModernAtomBackgroundView setAutoresizingMask:](v23, "setAutoresizingMask:", 18);
    -[MFModernAtomBackgroundView setHostAtomView:](v23, "setHostAtomView:", v10);
    -[MFModernAtomBackgroundView setSeparatorStyle:](v23, "setSeparatorStyle:", a5);
    -[UIView addSubview:](v10->_compositingView, "addSubview:", v23);
    objc_storeStrong((id *)&v10->_background, v23);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v13, v14, v15, v16);
    label = v10->_label;
    v10->_label = (UILabel *)v25;

    -[UILabel setAutoresizingMask:](v10->_label, "setAutoresizingMask:", 16);
    -[UILabel setOpaque:](v10->_label, "setOpaque:", 0);
    v27 = v10->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v27, "setBackgroundColor:", v28);

    -[UILabel setAdjustsFontForContentSizeCategory:](v10->_label, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setUserInteractionEnabled:](v10->_label, "setUserInteractionEnabled:", 0);
    -[UILabel _setWantsUnderlineForAccessibilityButtonShapesEnabled:](v10->_label, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);
    -[UILabel _setOverallWritingDirectionFollowsLayoutDirection:](v10->_label, "_setOverallWritingDirectionFollowsLayoutDirection:", 1);
    -[UIView addSubview:](v10->_compositingView, "addSubview:", v10->_label);
    v29 = [MFModernAtomIconView alloc];
    -[MFModernAtomView bounds](v10, "bounds");
    v30 = -[MFModernAtomIconView initWithFrame:](v29, "initWithFrame:");
    badgeIconView = v10->_badgeIconView;
    v10->_badgeIconView = (MFModernAtomIconView *)v30;

    -[MFModernAtomIconView setIconPadding:](v10->_badgeIconView, "setIconPadding:", 2.5);
    -[MFModernAtomIconView setAutoresizingMask:](v10->_badgeIconView, "setAutoresizingMask:", 16);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFModernAtomIconView setBackgroundColor:](v10->_badgeIconView, "setBackgroundColor:", v32);

    -[MFModernAtomIconView setContentMode:](v10->_badgeIconView, "setContentMode:", 3);
    v33 = [MFModernAtomIconView alloc];
    -[MFModernAtomView bounds](v10, "bounds");
    v34 = -[MFModernAtomIconView initWithFrame:](v33, "initWithFrame:");
    accessoryIconView = v10->_accessoryIconView;
    v10->_accessoryIconView = (MFModernAtomIconView *)v34;

    -[MFModernAtomIconView setIconPadding:](v10->_accessoryIconView, "setIconPadding:", 5.0);
    -[MFModernAtomIconView setAutoresizingMask:](v10->_accessoryIconView, "setAutoresizingMask:", 20);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFModernAtomIconView setBackgroundColor:](v10->_accessoryIconView, "setBackgroundColor:", v36);

    -[MFModernAtomIconView setContentMode:](v10->_accessoryIconView, "setContentMode:", 3);
    -[MFModernAtomView _updateIconViewsSemanticContentAttribute](v10, "_updateIconViewsSemanticContentAttribute");
    -[MFModernAtomView _updateSubviewsForWrapping](v10, "_updateSubviewsForWrapping");
    if ((a4 & 0x204) != 0)
    {
      v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 4);
      activityIndicator = v10->_activityIndicator;
      v10->_activityIndicator = (UIActivityIndicatorView *)v37;

    }
    v10->_disabledPresentationOptions = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", v10, sel__invalidatePresentationOptions, *MEMORY[0x1E0DC48E8], 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFModernAtomView setBackgroundColor:](v10, "setBackgroundColor:", v40);

    objc_msgSend((id)objc_opt_class(), "_defaultTintColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFModernAtomView setTintColor:](v10, "setTintColor:", v41);

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
  -[MFModernAtomView frame](self, "frame");
  NSStringFromCGRect(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_label, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %x; frame = %@; text = '%@'>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (int64_t)_preferredIconVariant
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  MFModernUIContentSizeCategoryOrdering();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "isEqualToString:", v5, (_QWORD)v14) & 1) != 0)
        {
          v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_12:

  -[MFModernAtomView scale](self, "scale");
  if (v12 > 1.0)
  {
    if (v11 + 3 >= (unint64_t)objc_msgSend(v6, "count"))
      v11 = 6;
    else
      v11 += 3;
  }

  return v11;
}

- (void)_updateIconViewsSemanticContentAttribute
{
  uint64_t v3;

  if (self->_separatorIsLeftAligned)
    v3 = 4;
  else
    v3 = 3;
  -[MFModernAtomIconView setSemanticContentAttribute:](self->_accessoryIconView, "setSemanticContentAttribute:", v3);
  -[MFModernAtomIconView setSemanticContentAttribute:](self->_badgeIconView, "setSemanticContentAttribute:", v3);
}

- (void)_updateSubviewsForWrapping
{
  _BOOL4 v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = -[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled");
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", !v3);
  if (v3)
    v4 = 0;
  else
    v4 = 2;
  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", v4);
  v5 = -[MFModernAtomView separatorStyle](self, "separatorStyle");
  -[MFModernAtomView backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSeparatorStyle:", 2);

  -[MFModernAtomView backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSeparatorStyle:", v5);

  if (v3)
  {
    -[MFModernAtomIconView removeFromSuperview](self->_badgeIconView, "removeFromSuperview");
    -[MFModernAtomIconView removeFromSuperview](self->_accessoryIconView, "removeFromSuperview");
  }
  else
  {
    -[UIView addSubview:](self->_compositingView, "addSubview:", self->_badgeIconView);
    -[UIView addSubview:](self->_compositingView, "addSubview:", self->_accessoryIconView);
    -[MFModernAtomIconView setNeedsDisplay](self->_badgeIconView, "setNeedsDisplay");
    -[MFModernAtomIconView setNeedsDisplay](self->_accessoryIconView, "setNeedsDisplay");
  }
}

- (id)_centeredTextAttachmentWithImage:(id)a3
{
  id v4;
  MFCenteredTextAttachment *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  void *v17;
  CGSize v19;

  v4 = a3;
  v5 = objc_alloc_init(MFCenteredTextAttachment);
  objc_msgSend(v4, "size");
  v7 = v6;
  objc_msgSend(v4, "size");
  v9 = v8;
  objc_msgSend(v4, "size");
  v11 = v10;
  objc_msgSend(v4, "size");
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;
  v19.width = v11 + 3.0;
  v19.height = v13;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v16);

  objc_msgSend(v4, "drawInRect:", 3.0, 0.0, v7, v9);
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[UIFont capHeight](self->_titleFont, "capHeight");
  -[MFCenteredTextAttachment setHeight:](v5, "setHeight:");
  -[MFCenteredTextAttachment setImage:](v5, "setImage:", v17);

  return v5;
}

- (id)_chevronTextAttachment
{
  MFCenteredTextAttachment *v3;
  uint64_t v4;
  _BOOL4 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  CGFloat v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  CGSize v30;

  v3 = objc_alloc_init(MFCenteredTextAttachment);
  if (_chevronTextAttachment_onceToken != -1)
    dispatch_once(&_chevronTextAttachment_onceToken, &__block_literal_global_56);
  v4 = -[MFModernAtomView _preferredIconVariant](self, "_preferredIconVariant");
  v5 = -[MFModernAtomView isPrimaryAddressAtom](self, "isPrimaryAddressAtom");
  v6 = v4 < 6 && v5;
  _MFAtomViewIconImageVariantNameForGlyphType((uint64_t)CFSTR("chevron"), v4 + v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_chevronTextAttachment__chevronImageCache, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageNamed:inBundle:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_flatImageWithColor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "size");
    v15 = v14;
    objc_msgSend(v13, "size");
    v17 = v16;
    objc_msgSend(v13, "size");
    v19 = v18;
    objc_msgSend(v13, "size");
    v21 = v20;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scale");
    v24 = v23;
    v30.width = v19 + 9.0;
    v30.height = v21;
    UIGraphicsBeginImageContextWithOptions(v30, 0, v24);

    objc_msgSend(v13, "drawInRect:", 3.0, 0.0, v15, v17);
    UIGraphicsGetImageFromCurrentImageContext();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend((id)_chevronTextAttachment__chevronImageCache, "setObject:forKeyedSubscript:", v8, v7);

  }
  if (-[MFModernAtomView separatorIsLeftAligned](self, "separatorIsLeftAligned"))
  {
    v25 = (void *)MEMORY[0x1E0DC3870];
    v26 = objc_retainAutorelease(v8);
    v27 = objc_msgSend(v26, "CGImage");
    objc_msgSend(v26, "scale");
    objc_msgSend(v25, "imageWithCGImage:scale:orientation:", v27, 4);
    v28 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v28;
  }
  -[UIFont capHeight](self->_titleFont, "capHeight");
  -[MFCenteredTextAttachment setHeight:](v3, "setHeight:");
  -[MFCenteredTextAttachment setImage:](v3, "setImage:", v8);

  return v3;
}

void __42__MFModernAtomView__chevronTextAttachment__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_chevronTextAttachment__chevronImageCache;
  _chevronTextAttachment__chevronImageCache = (uint64_t)v0;

}

- (BOOL)isWrappingEnabled
{
  NSString *v2;
  BOOL IsAccessibilityCategory;

  if (!self->_wrappingSupported)
    return 0;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (void)setIsPrimaryAddressAtom:(BOOL)a3
{
  id v4;

  if (self->_isPrimaryAddressAtom != a3)
  {
    self->_isPrimaryAddressAtom = a3;
    if (a3)
      +[MFModernAtomView primaryAtomFont](MFModernAtomView, "primaryAtomFont");
    else
      +[MFModernAtomView defaultFont](MFModernAtomView, "defaultFont");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MFModernAtomView setTitleFont:](self, "setTitleFont:", v4);

  }
}

- (MFModernAtomBackgroundView)backgroundView
{
  return self->_background;
}

- (UIColor)effectiveTintColor
{
  UIColor *effectiveTintColor;

  effectiveTintColor = self->_effectiveTintColor;
  if (effectiveTintColor)
    return effectiveTintColor;
  -[MFModernAtomView tintColor](self, "tintColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setEffectiveTintColor:(id)a3
{
  UIColor *v5;
  void *v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_effectiveTintColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_effectiveTintColor, a3);
    -[UILabel setTextColor:](self->_label, "setTextColor:", v7);
    -[MFModernAtomView backgroundView](self, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", v7);

    v5 = v7;
  }

}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (!self->_effectiveTintColor
    || (-[MFModernAtomView effectiveTintColor](self, "effectiveTintColor"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        -[MFModernAtomView tintColor](self, "tintColor"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v3, "isEqual:", v4),
        v4,
        v3,
        (v5 & 1) == 0))
  {
    -[MFModernAtomView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFModernAtomView _setEffectiveTintColor:](self, "_setEffectiveTintColor:", v6);

    -[MFModernAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");
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
    +[MFModernAtomView defaultFont](MFModernAtomView, "defaultFont");
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
    -[MFModernAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");

  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  title = self->_title;
  self->_title = v4;

  -[MFModernAtomView _updateLabelAttributes](self, "_updateLabelAttributes");
}

- (void)_updateLabelAttributes
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSString *title;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UILabel *label;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  -[MFModernAtomView title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("⁠"));
    if (!-[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled"))
    {
      v18 = objc_alloc(MEMORY[0x1E0CB3778]);
      title = self->_title;
      -[MFModernAtomView titleFont](self, "titleFont");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFModernAtomView _defaultLabelAttributesWithFont:wrappingEnabled:](MFModernAtomView, "_defaultLabelAttributesWithFont:wrappingEnabled:", v20, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (id)objc_msgSend(v18, "initWithString:attributes:", title, v11);
LABEL_21:

      -[UILabel setAttributedText:](self->_label, "setAttributedText:", v39);
      label = self->_label;
      -[MFModernAtomView effectiveTintColor](self, "effectiveTintColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](label, "setTextColor:", v35);

      -[UILabel sizeToFit](self->_label, "sizeToFit");
      -[MFModernAtomView sizeToFit](self, "sizeToFit");
      -[MFModernAtomView setNeedsLayout](self, "setNeedsLayout");

      return;
    }
    -[MFModernAtomView titleFont](self, "titleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFModernAtomView _defaultLabelAttributesWithFont:wrappingEnabled:](MFModernAtomView, "_defaultLabelAttributesWithFont:wrappingEnabled:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    -[MFModernAtomView effectiveTintColor](self, "effectiveTintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0DC1140]);

    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DC1178]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFirstLineHeadIndent:", self->_firstLineIndent);
    v37 = v8;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", self->_title);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "insertString:atIndex:", CFSTR("​"), 0);
    v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v36, v8);
    v12 = -[MFModernAtomView separatorStyle](self, "separatorStyle");
    if (v12 == 1)
    {
      v21 = (void *)MEMORY[0x1E0CB3778];
      -[MFModernAtomView _chevronTextAttachment](self, "_chevronTextAttachment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "attributedStringWithAttachment:", v13);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12)
      {
        v38 = 0;
LABEL_11:
        -[MFModernAtomIconView iconImages](self->_accessoryIconView, "iconImages");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFModernAtomIconView iconImages](self->_badgeIconView, "iconImages");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; objc_msgSend(v23, "count") > i; ++i)
        {
          objc_msgSend(v23, "objectAtIndex:", i);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x1E0CB3498];
          -[MFModernAtomView _centeredTextAttachmentWithImage:](self, "_centeredTextAttachmentWithImage:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "attributedStringWithAttachment:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "insertAttributedString:atIndex:", v5, 1);
          objc_msgSend(v39, "insertAttributedString:atIndex:", v28, 1);

        }
        for (j = 0; objc_msgSend(v22, "count") > j; ++j)
        {
          objc_msgSend(v22, "objectAtIndex:", j);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)MEMORY[0x1E0CB3498];
          -[MFModernAtomView _centeredTextAttachmentWithImage:](self, "_centeredTextAttachmentWithImage:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "attributedStringWithAttachment:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "insertAttributedString:atIndex:", v5, objc_msgSend(v39, "length"));
          objc_msgSend(v39, "insertAttributedString:atIndex:", v33, objc_msgSend(v39, "length"));

        }
        if (v38)
        {
          if (!self->_separatorHidden)
          {
            objc_msgSend(v39, "insertAttributedString:atIndex:", v5, objc_msgSend(v39, "length"));
            objc_msgSend(v39, "insertAttributedString:atIndex:", v38, objc_msgSend(v39, "length"));
          }
        }

        v20 = v37;
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFModernAtomView titleFont](self, "titleFont");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v14, *MEMORY[0x1E0DC1138]);

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v15, v10);

      v16 = objc_alloc(MEMORY[0x1E0CB3778]);
      MFLocalizedAddressSeparator();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v16, "initWithString:attributes:", v17, v13);

    }
    goto LABEL_11;
  }
}

- (void)_invalidatePresentationOptions
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  int64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  _BOOL4 cachedIsWrappingEnabled;
  id v12;
  id v13;

  -[MFModernAtomView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MFModernAtomView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MFModernAtomView tintAdjustmentMode](self, "tintAdjustmentMode") == 2)
    goto LABEL_10;
  if ((-[MFModernAtomView presentationOptions](self, "presentationOptions") & 1) != 0)
  {
    +[MFModernAtomView _failureTintColor](MFModernAtomView, "_failureTintColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((-[MFModernAtomView presentationOptions](self, "presentationOptions") & 2) == 0)
      goto LABEL_7;
    +[MFModernAtomView _SMSTintColor](MFModernAtomView, "_SMSTintColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  v3 = v5;
LABEL_7:
  if (v3)
  {
    -[MFModernAtomView _setEffectiveTintColor:](self, "_setEffectiveTintColor:", v3);
  }
  else
  {
    -[MFModernAtomView tintColor](self, "tintColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[MFModernAtomView _setEffectiveTintColor:](self, "_setEffectiveTintColor:");

    v3 = 0;
  }
LABEL_10:
  v6 = -[MFModernAtomView presentationOptions](self, "presentationOptions");
  v7 = -[MFModernAtomView _preferredIconVariant](self, "_preferredIconVariant");
  v13 = v3;
  v8 = -[MFModernAtomView isPrimaryAddressAtom](self, "isPrimaryAddressAtom");
  +[MFModernAtomView _badgeImagesForPresentationOptions:iconOrder:orderingLength:tintColor:large:variant:](MFModernAtomView, "_badgeImagesForPresentationOptions:iconOrder:orderingLength:tintColor:large:variant:", v6, &_badgeStyleOrder, 5, v13, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFModernAtomIconView setIconImages:](self->_badgeIconView, "setIconImages:", v9);
  +[MFModernAtomView _badgeImagesForPresentationOptions:iconOrder:orderingLength:tintColor:large:variant:](MFModernAtomView, "_badgeImagesForPresentationOptions:iconOrder:orderingLength:tintColor:large:variant:", v6, &_accessoryStyleOrder, 4, v13, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFModernAtomIconView setIconImages:](self->_accessoryIconView, "setIconImages:", v10);
  -[MFModernAtomView _updateActivityIndicator](self, "_updateActivityIndicator");
  -[MFModernAtomView setNeedsLayout](self, "setNeedsLayout");
  cachedIsWrappingEnabled = self->_cachedIsWrappingEnabled;
  if (cachedIsWrappingEnabled == -[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    -[MFModernAtomIconView setNeedsDisplay](self->_badgeIconView, "setNeedsDisplay");
    -[MFModernAtomIconView setNeedsDisplay](self->_accessoryIconView, "setNeedsDisplay");
  }
  else
  {
    self->_cachedIsWrappingEnabled = -[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled");
    -[MFModernAtomView _updateSubviewsForWrapping](self, "_updateSubviewsForWrapping");
    -[MFModernAtomView _updateLabelAttributes](self, "_updateLabelAttributes");
  }
  -[MFModernAtomBackgroundView invalidateIntrinsicContentSize](self->_background, "invalidateIntrinsicContentSize");
  -[MFModernAtomBackgroundView setNeedsLayout](self->_background, "setNeedsLayout");

}

- (void)setPresentationOptions:(unint64_t)a3
{
  if (self->_presentationOptions != a3)
  {
    self->_presentationOptions = a3;
    -[MFModernAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");
  }
}

- (void)appendPresentationOption:(unint64_t)a3
{
  self->_presentationOptions |= a3;
  -[MFModernAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");
}

- (void)clearPresentationOption:(unint64_t)a3
{
  self->_presentationOptions &= ~a3;
  -[MFModernAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");
}

- (void)_setPresentationOption:(unint64_t)a3 enabled:(BOOL)a4
{
  unint64_t v4;

  if (a4)
    v4 = self->_disabledPresentationOptions & ~a3;
  else
    v4 = self->_disabledPresentationOptions | a3;
  self->_disabledPresentationOptions = v4;
  -[MFModernAtomView _invalidatePresentationOptions](self, "_invalidatePresentationOptions");
}

- (unint64_t)effectivePresentationOptions
{
  return -[MFModernAtomView presentationOptions](self, "presentationOptions") & ~self->_disabledPresentationOptions;
}

- (void)setSeparatorHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  self->_separatorHidden = a3;
  if (-[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    -[MFModernAtomView _updateLabelAttributes](self, "_updateLabelAttributes");
  }
  else
  {
    -[MFModernAtomView backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "separatorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v3);

  }
  -[MFModernAtomView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (BOOL)separatorHidden
{
  BOOL v2;
  void *v3;

  if (self->_separatorHidden)
    return 1;
  -[MFModernAtomView backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "separatorStyle") == 2;

  return v2;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  void *v5;

  -[MFModernAtomView backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorStyle:", a3);

  if (-[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled"))
    -[MFModernAtomView _updateLabelAttributes](self, "_updateLabelAttributes");
  else
    -[MFModernAtomView sizeToFit](self, "sizeToFit");
}

- (int64_t)separatorStyle
{
  void *v2;
  int64_t v3;

  -[MFModernAtomView backgroundView](self, "backgroundView");
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
    -[MFModernAtomView _updateIconViewsSemanticContentAttribute](self, "_updateIconViewsSemanticContentAttribute");
    -[MFModernAtomView backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutSubviews");

    -[MFModernAtomView layoutSubviews](self, "layoutSubviews");
  }
}

- (void)setSelected:(BOOL)a3
{
  -[MFModernAtomView setSelected:animated:](self, "setSelected:animated:", a3, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  -[MFModernAtomView setSelected:animated:style:](self, "setSelected:animated:style:", a3, a4, 1);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 style:(unint64_t)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  _QWORD v13[5];
  BOOL v14;

  v6 = a4;
  v7 = a3;
  -[MFModernAtomView backgroundView](self, "backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelected:animated:style:", v7, v6, a5);

  if (self->_selected != v7)
  {
    self->_selected = v7;
    -[MFModernAtomView _updateActivityIndicator](self, "_updateActivityIndicator");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__MFModernAtomView_setSelected_animated_style___block_invoke;
    v13[3] = &unk_1E5A65D00;
    v13[4] = self;
    v14 = v7;
    v10 = _Block_copy(v13);
    v11 = v10;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v10, 0.15);
      if (!v7)
      {
        UIAnimationDragCoefficient();
        -[MFModernAtomView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateCompositingFilters, 0, v12 * 0.15);
LABEL_7:

        return;
      }
    }
    else
    {
      (*((void (**)(void *))v10 + 2))(v10);
    }
    -[MFModernAtomView _updateCompositingFilters](self, "_updateCompositingFilters");
    goto LABEL_7;
  }
}

void __47__MFModernAtomView_setSelected_animated_style___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setBackgroundColor:", v2);

}

- (BOOL)hidesVIPIndicator
{
  return (LOBYTE(self->_disabledPresentationOptions) >> 4) & 1;
}

- (void)setHidesVIPIndicator:(BOOL)a3
{
  -[MFModernAtomView _setPresentationOption:enabled:](self, "_setPresentationOption:enabled:", 16, !a3);
}

- (void)_updateCompositingFilters
{
  void *v3;
  void *v4;
  uint64_t i;
  id v6;
  void *v7;
  uint64_t j;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_selected)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v10 = 0xAAAAAAAAAAAAAAAALL;
  v9[0] = self->_badgeIconView;
  v9[1] = self->_accessoryIconView;
  v9[2] = self->_label;
  -[MFModernAtomView backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "separatorView");
  v10 = objc_claimAutoreleasedReturnValue();

  for (i = 0; i != 4; ++i)
  {
    v6 = (id)v9[i];
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompositingFilter:", v3);

  }
  for (j = 3; j != -1; --j)

}

- (void)_updateActivityIndicator
{
  unint64_t v3;
  uint64_t v4;
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *v8;
  UIActivityIndicatorView *v9;

  v3 = -[MFModernAtomView presentationOptions](self, "presentationOptions") & 0x204;
  if (-[MFModernAtomView isSelected](self, "isSelected"))
    v4 = 3;
  else
    v4 = 4;
  activityIndicator = self->_activityIndicator;
  if (v3)
  {
    if (activityIndicator)
    {
      if (-[UIActivityIndicatorView activityIndicatorViewStyle](activityIndicator, "activityIndicatorViewStyle") == v4)
        return;
      -[UIActivityIndicatorView removeFromSuperview](self->_activityIndicator, "removeFromSuperview");
      v6 = self->_activityIndicator;
      self->_activityIndicator = 0;

    }
    v7 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", v4);
    v8 = self->_activityIndicator;
    self->_activityIndicator = v7;

    -[MFModernAtomView addSubview:](self, "addSubview:", self->_activityIndicator);
    -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
    -[MFModernAtomView setNeedsLayout](self, "setNeedsLayout");
    -[MFModernAtomView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  else if (activityIndicator)
  {
    -[UIActivityIndicatorView removeFromSuperview](activityIndicator, "removeFromSuperview");
    v9 = self->_activityIndicator;
    self->_activityIndicator = 0;

  }
}

- (void)_updateFontIfNecessary
{
  UIFont *titleFont;
  int v4;
  id v5;
  id v6;

  if (-[MFModernAtomView isPrimaryAddressAtom](self, "isPrimaryAddressAtom"))
  {
    objc_msgSend((id)objc_opt_class(), "primaryAtomFont");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[MFModernAtomView setTitleFont:](self, "setTitleFont:");
LABEL_6:

    return;
  }
  titleFont = self->_titleFont;
  if (!titleFont
    || (objc_msgSend((id)objc_opt_class(), "primaryAtomFont"),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        v4 = -[UIFont isEqual:](titleFont, "isEqual:"),
        v6,
        v4))
  {
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[MFModernAtomView setTitleFont:](self, "setTitleFont:");
    goto LABEL_6;
  }
}

- (double)preferredWidth
{
  double result;

  -[MFModernAtomView preferredWidthWithSizeConstraints:](self, "preferredWidthWithSizeConstraints:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
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
  if (-[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    -[MFModernAtomView _leftPadding](self, "_leftPadding");
    v7 = v6;
    -[MFModernAtomView _rightPadding](self, "_rightPadding");
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", fmax(width - (v7 + v8), 0.0), 1.79769313e308);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MFModernAtomView;
    -[MFModernAtomView sizeThatFits:](&v11, sel_sizeThatFits_, width, height);
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
  -[MFModernAtomView _leftPadding](self, "_leftPadding");
  v7 = v6;
  -[MFModernAtomView _rightPadding](self, "_rightPadding");
  v9 = fmax(width - (v7 + v8), 0.0);
  -[UILabel attributedText](self->_label, "attributedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "boundingRectWithSize:options:context:", 1, 0, v9, height);
  v12 = ceil(v11);

  -[MFModernAtomView _leftPadding](self, "_leftPadding");
  v14 = v12 + v13;
  -[MFModernAtomView _rightPadding](self, "_rightPadding");
  result = fmax(v14 + v15, 25.0);
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

  -[MFModernAtomView _updateFontIfNecessary](self, "_updateFontIfNecessary");
  -[MFModernAtomView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_compositingView, "setFrame:");
  rect = v8;
  -[MFModernAtomView preferredWidthWithSizeConstraints:](self, "preferredWidthWithSizeConstraints:", v8, v10);
  v12 = v11;
  -[UILabel bounds](self->_label, "bounds");
  v14 = v13;
  -[UILabel font](self->_label, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineHeight");
  v17 = round(v14 / v16);

  if (-[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    -[MFModernAtomView titleLabel](self, "titleLabel");
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
    if (!-[MFModernAtomView separatorHidden](self, "separatorHidden")
      && !-[MFModernAtomView separatorStyle](self, "separatorStyle"))
    {
      -[MFModernAtomView backgroundView](self, "backgroundView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "separatorWidth");
      v12 = v12 - v23;

    }
  }
  -[MFModernAtomBackgroundView setFrame:](self->_background, "setFrame:", v21, 0.0, v12, v10);
  if (-[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    label = self->_label;
    -[MFModernAtomView bounds](self, "bounds");
    -[UILabel sizeThatFits:](label, "sizeThatFits:", v25, v26);
    v28 = v27;
    v30 = v29;
  }
  else
  {
    -[MFModernAtomView _leftPadding](self, "_leftPadding");
    -[MFModernAtomView _rightPadding](self, "_rightPadding");
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v30 = v31;
    UIRoundToViewScale();
    v28 = v32;
  }
  -[MFModernAtomView _leftPadding](self, "_leftPadding");
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
    -[MFModernAtomView _leftPadding](self, "_leftPadding");
    v34 = v38 - v39;
  }
  v40 = round(v10 * 0.5 - v30 * 0.5);
  -[UILabel setFrame:](self->_label, "setFrame:", v34, v40, v28, v30);
  if (-[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled") && v17 == 1.0)
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
  -[MFModernAtomIconView preferredWidth](self->_badgeIconView, "preferredWidth");
  v47 = v46;
  -[MFModernAtomIconView preferredWidth](self->_accessoryIconView, "preferredWidth");
  v49 = v48;
  -[MFModernAtomView _leftInset](self, "_leftInset");
  if (separatorIsLeftAligned)
  {
    v51 = rect - v47 - v50;
    v73.origin.x = v34;
    v73.origin.y = v40;
    v73.size.width = v28;
    v73.size.height = v30;
    v52 = CGRectGetMinX(v73) + -5.0 - v49;
  }
  else
  {
    v51 = v50 + self->_firstLineIndent;
    v74.origin.x = v34;
    v74.origin.y = v40;
    v74.size.width = v28;
    v74.size.height = v30;
    v52 = CGRectGetMaxX(v74) + 5.0;
  }
  -[MFModernAtomIconView setFrame:](self->_badgeIconView, "setFrame:", v51, 0.0, v47, v10);
  -[MFModernAtomIconView setFrame:](self->_accessoryIconView, "setFrame:", v52, 0.0, v49, v10);
  -[MFModernAtomView baselinePoint](self, "baselinePoint");
  v54 = v53;
  -[MFModernAtomIconView setDrawingOffset:](self->_accessoryIconView, "setDrawingOffset:", 0.0);
  -[MFModernAtomIconView setDrawingOffset:](self->_badgeIconView, "setDrawingOffset:", 0.0, v54);
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
    v63 = -[MFModernAtomView separatorHidden](self, "separatorHidden")
       || -[MFModernAtomView separatorStyle](self, "separatorStyle") != 0;
    if ((v62 & 1) != 0)
    {
      if (separatorIsLeftAligned)
        v64 = 7.0;
      else
        v64 = 5.0;
      if (!separatorIsLeftAligned)
        v63 = 1;
      if (v63)
        goto LABEL_42;
      -[MFModernAtomView backgroundView](self, "backgroundView");
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
        goto LABEL_42;
      -[MFModernAtomView backgroundView](self, "backgroundView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "separatorWidth");
      v64 = v64 - v68;
    }

LABEL_42:
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v64, v61, v57, v59);
  }
  v70.receiver = self;
  v70.super_class = (Class)MFModernAtomView;
  -[MFModernAtomView layoutSubviews](&v70, sel_layoutSubviews);
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

  -[MFModernAtomBackgroundView selectedView](self->_background, "selectedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[MFModernAtomView convertRect:fromView:](self, "convertRect:fromView:", self->_background);
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

  -[MFModernAtomView _leftInset](self, "_leftInset");
  v4 = v3;
  -[MFModernAtomView _rightInset](self, "_rightInset");
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
  if (!-[MFModernAtomView separatorHidden](self, "separatorHidden"))
  {
    -[MFModernAtomView backgroundView](self, "backgroundView");
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

  v3 = -[MFModernAtomView separatorHidden](self, "separatorHidden");
  if (-[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    v4 = 1;
  }
  else
  {
    -[MFModernAtomIconView iconImages](self->_accessoryIconView, "iconImages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") == 0;

  }
  v6 = 4.0;
  if (!v3 || !v4)
  {
    v6 = 2.0;
    if (!v3)
    {
      -[MFModernAtomView backgroundView](self, "backgroundView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "separatorWidth");
      v9 = v8 + 2.0;

      v6 = v9 + 2.0;
    }
    if (!v4)
    {
      -[MFModernAtomIconView preferredWidth](self->_accessoryIconView, "preferredWidth");
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
  if (!-[MFModernAtomView isWrappingEnabled](self, "isWrappingEnabled"))
  {
    -[MFModernAtomIconView preferredWidth](self->_badgeIconView, "preferredWidth");
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
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  if (self->_scalingFactor != a3)
  {
    self->_scalingFactor = a3;
    -[MFModernAtomView backgroundView](self, "backgroundView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScalingFactor:", a3);

    -[MFModernAtomView titleFont](self, "titleFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a3 != 1.0)
    {
      v9 = v5;
      objc_msgSend(v5, "_fontScaledByScaleFactor:", self->_scalingFactor);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    v10 = v6;
    -[MFModernAtomView setTitleFont:](self, "setTitleFont:", v6);
    -[MFModernAtomView setNeedsLayout](self, "setNeedsLayout");

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

  -[MFModernAtomView preferredWidth](self, "preferredWidth");
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
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0DC3990]);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UILabel attributedText](self->_label, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", v9);

  -[UILabel frame](self->_label, "frame");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "setTextColor:", v6);
  -[MFModernAtomView addSubview:](self, "addSubview:", v8);
  -[MFModernAtomBackgroundView setAlpha:](self->_background, "setAlpha:", 0.0);
  -[UILabel setAlpha:](self->_label, "setAlpha:", 0.0);
  v10 = MEMORY[0x1E0C809B0];
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__MFModernAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke;
  v15[3] = &unk_1E5A65430;
  v15[4] = self;
  v16 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __70__MFModernAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke_2;
  v13[3] = &unk_1E5A66750;
  v12 = v16;
  v14 = v12;
  objc_msgSend(v11, "animateWithDuration:animations:completion:", v15, v13, a4);

}

uint64_t __70__MFModernAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __70__MFModernAtomView_performBuildInAnimationFromTextColor_withDuration___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (UILabel)titleLabel
{
  return self->_label;
}

- (MFModernAtomIconView)accessoryIconView
{
  return self->_accessoryIconView;
}

- (MFModernAtomIconView)badgeIconView
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
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
