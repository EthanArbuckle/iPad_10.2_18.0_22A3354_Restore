@implementation CLKUIColoringLabel

+ (id)labelWithOptions:(unint64_t)a3
{
  id v4;

  v4 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v4, "initWithFrame:options:", a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (CLKUIColoringLabel)initWithFrame:(CGRect)a3
{
  return -[CLKUIColoringLabel initWithFrame:options:](self, "initWithFrame:options:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CLKUIColoringLabel)initWithFrame:(CGRect)a3 options:(unint64_t)a4
{
  CLKUIColoringLabel *v5;
  void *v6;
  uint64_t v7;
  CLKDevice *device;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLKUIColoringLabel;
  v5 = -[CLKUILegibilityLabel initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (CLKDevice *)v7;

    v5->_usesTextProviderSize = 1;
    v5->_options = a4;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setBackgroundColor:](v5, "setBackgroundColor:", v9);

    v5->_maxWidth = 1.79769313e308;
    v5->_uppercase = 0;
    v5->_textSetExternally = 0;
    -[CLKUIColoringLabel _updateDynamicTracking](v5, "_updateDynamicTracking");
  }
  return v5;
}

- (double)_lastLineBaseline
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKUIColoringLabel;
  -[CLKUIColoringLabel _lastLineBaseline](&v3, sel__lastLineBaseline);
  return result;
}

- (double)_firstLineBaseline
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKUIColoringLabel;
  -[CLKUIColoringLabel _firstLineBaseline](&v3, sel__firstLineBaseline);
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)CLKUIColoringLabel;
  -[CLKUIColoringLabel setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKUIColoringLabel;
  v5 = -[CLKUIColoringLabel _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4)
    || -[_CLKUIColorManager shouldAnimatePropertyWithKey:](self->_colorManager, "shouldAnimatePropertyWithKey:", v4);

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_colorManager;
}

- (UIColor)overrideColor
{
  UIColor *overrideColor;

  overrideColor = self->_overrideColor;
  if (overrideColor)
    return overrideColor;
  -[CLKTextProvider tintColor](self->_textProvider, "tintColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGAffineTransform v7;

  -[CLKUIColoringLabel transform](self, "transform");
  if (CGAffineTransformIsIdentity(&v7))
  {
    -[CLKUIColoringLabel frame](self, "frame");
    -[CLKUIColoringLabel sizeThatFits:](self, "sizeThatFits:", v3, v4);
    CLKPixelAlignRectForDevice();
    -[CLKUIColoringLabel setFrame:](self, "setFrame:");
  }
  else
  {
    -[CLKUIColoringLabel bounds](self, "bounds");
    -[CLKUIColoringLabel sizeThatFits:](self, "sizeThatFits:", v5, v6);
    CLKPixelAlignRectForDevice();
    -[CLKUIColoringLabel setBounds:](self, "setBounds:");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CLKUIColoringLabel bounds](self, "bounds");
  CGRectGetWidth(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGRectGetWidth(v10);
  v8.receiver = self;
  v8.super_class = (Class)CLKUIColoringLabel;
  -[CLKUIColoringLabel setBounds:](&v8, sel_setBounds_, x, y, width, height);
  if ((self->_options & 4) != 0 && (CLKFloatEqualsFloat() & 1) == 0)
    -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 1);
}

- (void)setInTimeTravel:(BOOL)a3
{
  if (self->_inTimeTravel != a3)
  {
    self->_inTimeTravel = a3;
    self->_updatedAfterTimeTravelStateChange = 0;
  }
}

- (void)setTextProvider:(id)a3
{
  CLKTextProvider *v5;
  CLKTextProvider *textProvider;
  NSNumber *updateToken;
  BOOL v8;
  CLKTextProvider *v9;
  NSNumber *v10;
  NSNumber *v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  id location;

  v5 = (CLKTextProvider *)a3;
  if (v5)
    self->_textSetExternally = 0;
  textProvider = self->_textProvider;
  if (textProvider == v5)
  {
    if (self->_inTimeTravel && -[CLKTextProvider timeTravelUpdateFrequency](v5, "timeTravelUpdateFrequency") == 2
      || !self->_updatedAfterTimeTravelStateChange
      && -[CLKTextProvider timeTravelUpdateFrequency](v5, "timeTravelUpdateFrequency"))
    {
      -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
    }
  }
  else
  {
    -[CLKTextProvider stopUpdatesForToken:](textProvider, "stopUpdatesForToken:", self->_updateToken);
    updateToken = self->_updateToken;
    self->_updateToken = 0;

    objc_storeStrong((id *)&self->_textProvider, a3);
    objc_initWeak(&location, self);
    v8 = -[CLKTextProvider timeTravelUpdateFrequency](v5, "timeTravelUpdateFrequency") == 0;
    v9 = self->_textProvider;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __38__CLKUIColoringLabel_setTextProvider___block_invoke;
    v12[3] = &unk_1E86E0478;
    objc_copyWeak(&v13, &location);
    v14 = v8;
    -[CLKTextProvider startUpdatesWithHandler:](v9, "startUpdatesWithHandler:", v12);
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v11 = self->_updateToken;
    self->_updateToken = v10;

    -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __38__CLKUIColoringLabel_setTextProvider___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!objc_msgSend(WeakRetained, "inTimeTravel") || !*(_BYTE *)(a1 + 40))
  {
    v3 = objc_loadWeakRetained(v2);
    objc_msgSend(v3, "_requeryTextProviderAndNotify:", 1);

  }
}

- (void)setUppercase:(BOOL)a3
{
  if (self->_uppercase != a3)
  {
    self->_uppercase = a3;
    -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
  }
}

- (void)setMaxWidth:(double)a3
{
  if (self->_maxWidth != a3)
  {
    self->_maxWidth = a3;
    -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
  }
}

- (void)setUsesTextProviderTintColoring:(BOOL)a3
{
  if (self->_usesTextProviderTintColoring != a3)
  {
    self->_usesTextProviderTintColoring = a3;
    -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
  }
}

- (void)setParagraphStyle:(id)a3
{
  NSParagraphStyle *v4;
  NSParagraphStyle *paragraphStyle;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_paragraphStyle) & 1) == 0)
  {
    v4 = (NSParagraphStyle *)objc_msgSend(v6, "copy");
    paragraphStyle = self->_paragraphStyle;
    self->_paragraphStyle = v4;

    -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
  }

}

- (void)setTracking:(double)a3
{
  if (self->_tracking != a3)
  {
    self->_tracking = a3;
    -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
  }
}

- (void)setNumberOfLines:(int64_t)a3
{
  uint64_t v5;
  objc_super v6;

  v5 = -[CLKUIColoringLabel numberOfLines](self, "numberOfLines");
  v6.receiver = self;
  v6.super_class = (Class)CLKUIColoringLabel;
  -[CLKUIColoringLabel setNumberOfLines:](&v6, sel_setNumberOfLines_, a3);
  if (v5 != a3)
  {
    -[CLKUIColoringLabel _updateDynamicTracking](self, "_updateDynamicTracking");
    -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
    -[CLKUIColoringLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)_requeryTextProviderAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  void (**nowProvider)(id, SEL);
  NSAttributedString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CLKFont *smallCapsBaseFont;
  CLKFont *v12;
  unint64_t options;
  void *v14;
  _BOOL4 uppercase;
  double v16;
  void *v17;
  void *v18;
  double Width;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  NSAttributedString *v30;
  NSAttributedString *originalString;
  BOOL usesTextProviderSize;
  void *v33;
  void *v34;
  uint64_t v35;
  void (**needsResizeHandler)(void);
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CGSize v45;
  _BYTE v46[128];
  _QWORD v47[3];
  CGRect v48;

  v3 = a3;
  v47[1] = *MEMORY[0x1E0C80C00];
  v45 = (CGSize)*MEMORY[0x1E0C9D820];
  if (self->_textProvider)
  {
    nowProvider = (void (**)(id, SEL))self->_nowProvider;
    v39 = a3;
    if (nowProvider)
      nowProvider[2](nowProvider, a2);
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel font](self, "font");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    smallCapsBaseFont = self->_smallCapsBaseFont;
    if (!smallCapsBaseFont)
      smallCapsBaseFont = (CLKFont *)v9;
    v12 = smallCapsBaseFont;
    options = self->_options;
    CLKKernValueForDesignSpecTrackingValue();
    objc_msgSend(MEMORY[0x1E0C94548], "otherAttributesWithParagraphStyle:kerning:", self->_paragraphStyle);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C94548];
    uppercase = self->_uppercase;
    v16 = 0.0;
    if ((options & 2) != 0)
      -[CLKUIColoringLabel minimumScaleFactor](self, "minimumScaleFactor", 0.0);
    objc_msgSend(v14, "styleWithFont:smallCapsBaseFont:uppercase:otherAttributes:minimumScaleFactor:shouldEmbedTintColor:", v10, v12, uppercase, v40, self->_usesTextProviderTintColoring, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel monospacedDigitsFont](self, "monospacedDigitsFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMonospacedDigitsFont:", v18);

    if ((self->_options & 4) != 0)
    {
      -[CLKUIColoringLabel bounds](self, "bounds");
      Width = CGRectGetWidth(v48);
    }
    else
    {
      Width = self->_maxWidth;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CLKTextProvider textProviders](self->_textProvider, "textProviders", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47[0] = self->_textProvider;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1, v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v38 = v10;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v22)
    {
      v23 = v22;
      v7 = 0;
      v24 = *(_QWORD *)v42;
      do
      {
        v25 = 0;
        v26 = v7;
        do
        {
          if (*(_QWORD *)v42 != v24)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v25);
          v28 = -[CLKUIColoringLabel numberOfLines](self, "numberOfLines");
          v29 = 1.79769313e308;
          if (v28 == 1)
            v29 = Width;
          objc_msgSend(v27, "attributedTextAndSize:forMaxWidth:withStyle:now:", &v45, v17, v8, v29);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[CLKUIColoringLabel twoToneStyleInMonochrome](self, "twoToneStyleInMonochrome"))
          {
            v30 = (NSAttributedString *)objc_msgSend(v7, "copy");
            originalString = self->_originalString;
            self->_originalString = v30;

            if (fabs(self->_previousFraction + -1.0) >= 0.00000011920929)
              -[CLKUIColoringLabel _transitionTwoToneLabelToMonochromeWithFraction:](self, "_transitionTwoToneLabelToMonochromeWithFraction:", 0.0);
            else
              -[CLKUIColoringLabel _updateTwoToneLabelMonochromeColor](self, "_updateTwoToneLabelMonochromeColor");
          }
          else
          {
            -[CLKUIColoringLabel setAttributedText:](self, "setAttributedText:", v7);
          }
          if (-[CLKUIColoringLabel textDefinesTruncation](self, "textDefinesTruncation"))
          {
            if (!-[CLKUIColoringLabel isTextTruncated](self, "isTextTruncated"))
              goto LABEL_37;
          }
          else if (v45.width <= Width)
          {
            goto LABEL_37;
          }
          ++v25;
          v26 = v7;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v23);
    }
    else
    {
      v7 = 0;
    }
LABEL_37:

    v3 = v39;
  }
  else
  {
    if (self->_textSetExternally)
      return;
    v6 = self->_originalString;
    self->_originalString = 0;

    -[CLKUIColoringLabel setAttributedText:](self, "setAttributedText:", 0);
    v7 = 0;
  }
  usesTextProviderSize = self->_usesTextProviderSize;
  if (usesTextProviderSize)
  {
    objc_msgSend(v7, "string");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "rangeOfCharacterFromSet:", v34);

    if (v35 == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_cachedSingleLineSize = v45;
      usesTextProviderSize = 1;
    }
    else
    {
      usesTextProviderSize = 0;
    }
  }
  self->_cachedSizeIsValid = usesTextProviderSize;
  self->_cachedOpticalEdgeInsetsIsValid = 0;
  if (v3)
  {
    needsResizeHandler = (void (**)(void))self->_needsResizeHandler;
    if (needsResizeHandler)
      needsResizeHandler[2]();
  }
  self->_updatedAfterTimeTravelStateChange = 1;

}

- (double)widthForMaxWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;

  -[CLKUIColoringLabel font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel widthForMaxWidth:withFont:](self, "widthForMaxWidth:withFont:", v5, a3);
  v7 = v6;

  return v7;
}

- (double)widthForMaxWidth:(double)a3 withFont:(id)a4
{
  void *smallCapsBaseFont;
  double result;

  if (self->_smallCapsBaseFont)
    smallCapsBaseFont = self->_smallCapsBaseFont;
  else
    smallCapsBaseFont = a4;
  -[CLKUIColoringLabel widthForMaxWidth:withFont:smallCapsBaseFont:](self, "widthForMaxWidth:withFont:smallCapsBaseFont:", a4, smallCapsBaseFont, a3);
  return result;
}

- (double)widthForMaxWidth:(double)a3 withFont:(id)a4 smallCapsBaseFont:(id)a5
{
  id v8;
  id v9;
  void (**nowProvider)(void);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v18;
  uint64_t v19;

  v8 = a4;
  v9 = a5;
  nowProvider = (void (**)(void))self->_nowProvider;
  if (nowProvider)
    nowProvider[2]();
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0.0;
  v19 = 0;
  if (self->_textProvider && -[CLKUIColoringLabel numberOfLines](self, "numberOfLines") == 1)
  {
    CLKKernValueForDesignSpecTrackingValue();
    objc_msgSend(MEMORY[0x1E0C94548], "otherAttributesWithParagraphStyle:kerning:", self->_paragraphStyle);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C94548], "styleWithFont:smallCapsBaseFont:uppercase:otherAttributes:minimumScaleFactor:shouldEmbedTintColor:", v8, v9, self->_uppercase, v12, self->_usesTextProviderTintColoring, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)-[CLKTextProvider attributedTextAndSize:forMaxWidth:withStyle:now:](self->_textProvider, "attributedTextAndSize:forMaxWidth:withStyle:now:", &v18, v13, v11, a3);

    v15 = v18;
  }
  else
  {
    -[CLKUIColoringLabel sizeThatFits:](self, "sizeThatFits:", a3, 1.79769313e308, *(_QWORD *)&v18, v19);
    v15 = v16;
  }

  return v15;
}

- (double)minimumWidth
{
  void *v3;
  double v4;
  double v5;

  -[CLKUIColoringLabel font](self, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel minimumWithFont:](self, "minimumWithFont:", v3);
  v5 = v4;

  return v5;
}

- (double)minimumWithFont:(id)a3
{
  void *smallCapsBaseFont;
  double result;

  if (self->_smallCapsBaseFont)
    smallCapsBaseFont = self->_smallCapsBaseFont;
  else
    smallCapsBaseFont = a3;
  -[CLKUIColoringLabel minimumWithFont:smallCapsBaseFont:](self, "minimumWithFont:smallCapsBaseFont:", a3, smallCapsBaseFont);
  return result;
}

- (double)minimumWithFont:(id)a3 smallCapsBaseFont:(id)a4
{
  id v6;
  id v7;
  void (**nowProvider)(void);
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  v6 = a3;
  v7 = a4;
  nowProvider = (void (**)(void))self->_nowProvider;
  if (nowProvider)
    nowProvider[2]();
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_textProvider && -[CLKUIColoringLabel numberOfLines](self, "numberOfLines") == 1)
  {
    CLKKernValueForDesignSpecTrackingValue();
    objc_msgSend(MEMORY[0x1E0C94548], "otherAttributesWithParagraphStyle:kerning:", self->_paragraphStyle);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C94548], "styleWithFont:smallCapsBaseFont:uppercase:otherAttributes:minimumScaleFactor:shouldEmbedTintColor:", v6, v7, self->_uppercase, v10, self->_usesTextProviderTintColoring, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKTextProvider minimumSizeWithStyle:now:](self->_textProvider, "minimumSizeWithStyle:now:", v11, v9);
    v13 = v12;

  }
  else
  {
    -[CLKUIColoringLabel sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v13 = v14;
  }

  return v13;
}

- (UIEdgeInsets)opticalInsets
{
  CGFloat top;
  double left;
  CGFloat bottom;
  double right;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double Width;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  UIEdgeInsets result;

  if (-[CLKUIColoringLabel numberOfLines](self, "numberOfLines") == 1
    && self->_cachedSizeIsValid
    && self->_cachedOpticalEdgeInsetsIsValid)
  {
    top = self->_cachedOpticalEdgeInsets.top;
    left = self->_cachedOpticalEdgeInsets.left;
    bottom = self->_cachedOpticalEdgeInsets.bottom;
    right = self->_cachedOpticalEdgeInsets.right;
  }
  else
  {
    -[CLKUIColoringLabel _stringDrawingContext](self, "_stringDrawingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel attributedText](self, "attributedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel bounds](self, "bounds");
    objc_msgSend(v8, "boundingRectWithSize:options:context:", 9, v7, v9, v10);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    top = *MEMORY[0x1E0DC49E8];
    bottom = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    CLKFloorForDevice();
    left = v19;
    -[CLKUIColoringLabel bounds](self, "bounds");
    Width = CGRectGetWidth(v26);
    v27.origin.x = v12;
    v27.origin.y = v14;
    v27.size.width = v16;
    v27.size.height = v18;
    CGRectGetWidth(v27);
    CLKCeilForDevice();
    right = Width - v21 - left;
    if (-[CLKUIColoringLabel numberOfLines](self, "numberOfLines") == 1)
    {
      self->_cachedOpticalEdgeInsets.top = top;
      self->_cachedOpticalEdgeInsets.left = left;
      self->_cachedOpticalEdgeInsets.bottom = bottom;
      self->_cachedOpticalEdgeInsets.right = right;
      self->_cachedOpticalEdgeInsetsIsValid = 1;
    }

  }
  v22 = top;
  v23 = left;
  v24 = bottom;
  v25 = right;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (void)invalidateCachedSize
{
  self->_cachedSizeIsValid = 0;
  self->_cachedOpticalEdgeInsetsIsValid = 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  CGSize *p_cachedSingleLineSize;
  double v7;
  double v8;
  objc_super v9;
  objc_super v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[CLKUIColoringLabel numberOfLines](self, "numberOfLines") == 1)
  {
    p_cachedSingleLineSize = &self->_cachedSingleLineSize;
    if (self->_cachedSizeIsValid)
    {
      v7 = p_cachedSingleLineSize->width;
      v8 = self->_cachedSingleLineSize.height;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)CLKUIColoringLabel;
      -[CLKUIColoringLabel sizeThatFits:](&v10, sel_sizeThatFits_, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      p_cachedSingleLineSize->width = v7;
      self->_cachedSingleLineSize.height = v8;
      self->_cachedSizeIsValid = 1;
      self->_cachedOpticalEdgeInsetsIsValid = 0;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CLKUIColoringLabel;
    -[CLKUIColoringLabel sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (CLKFont)font
{
  CLKFont *font;
  objc_super v4;

  font = self->_font;
  if (font)
    return font;
  v4.receiver = self;
  v4.super_class = (Class)CLKUIColoringLabel;
  -[CLKUIColoringLabel font](&v4, sel_font);
  return (CLKFont *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setFont:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_font) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    v7.receiver = self;
    v7.super_class = (Class)CLKUIColoringLabel;
    -[CLKUIColoringLabel setFont:](&v7, sel_setFont_, v5);
    -[CLKFont CLKFontWithMonospacedNumbers](self->_font, "CLKFontWithMonospacedNumbers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setMonospacedDigitsFont:](self, "setMonospacedDigitsFont:", v6);

    -[CLKUIColoringLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
  }

}

- (void)setFontWithoutMonospacedNumbers:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if (!objc_msgSend(v5, "isEqual:", self->_font)
    || (-[CLKUIColoringLabel monospacedDigitsFont](self, "monospacedDigitsFont"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_storeStrong((id *)&self->_font, a3);
    v7.receiver = self;
    v7.super_class = (Class)CLKUIColoringLabel;
    -[CLKUIColoringLabel setFont:](&v7, sel_setFont_, v5);
    -[CLKUIColoringLabel setMonospacedDigitsFont:](self, "setMonospacedDigitsFont:", 0);
    -[CLKUIColoringLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
  }

}

- (void)setSmallCapsBaseFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_smallCapsBaseFont) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_smallCapsBaseFont, a3);
    -[CLKUIColoringLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
  }

}

- (void)setText:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  char v7;
  objc_super v8;

  v4 = a3;
  if (v4)
  {
    if (self->_textProvider)
      goto LABEL_6;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  self->_textSetExternally = v5;
LABEL_6:
  -[CLKUIColoringLabel text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
    -[CLKUIColoringLabel invalidateCachedSize](self, "invalidateCachedSize");
  v8.receiver = self;
  v8.super_class = (Class)CLKUIColoringLabel;
  -[CLKUIColoringLabel setText:](&v8, sel_setText_, v4);

}

- (void)setAttributedText:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  char v7;
  objc_super v8;

  v4 = a3;
  if (v4)
  {
    if (self->_textProvider)
      goto LABEL_6;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  self->_textSetExternally = v5;
LABEL_6:
  -[CLKUIColoringLabel attributedText](self, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToAttributedString:", v6);

  if ((v7 & 1) == 0)
    -[CLKUIColoringLabel invalidateCachedSize](self, "invalidateCachedSize");
  v8.receiver = self;
  v8.super_class = (Class)CLKUIColoringLabel;
  -[CLKUIColoringLabel setAttributedText:](&v8, sel_setAttributedText_, v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKUIColoringLabel;
  -[CLKUIColoringLabel traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CLKUIColoringLabel invalidateCachedSize](self, "invalidateCachedSize");
}

- (void)setShadowOffset:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  -[CLKUIColoringLabel shadowOffset](self, "shadowOffset");
  if (width != v7 || height != v6)
    -[CLKUIColoringLabel invalidateCachedSize](self, "invalidateCachedSize");
  v9.receiver = self;
  v9.super_class = (Class)CLKUIColoringLabel;
  -[CLKUIColoringLabel setShadowOffset:](&v9, sel_setShadowOffset_, width, height);
}

- (void)_updateDynamicTracking
{
  _BOOL8 v3;

  v3 = -[CLKUIColoringLabel numberOfLines](self, "numberOfLines") == 1 && (self->_options & 1) == 0;
  -[CLKUIColoringLabel setAllowsDefaultTighteningForTruncation:](self, "setAllowsDefaultTighteningForTruncation:", v3);
}

- (void)transitionToMonochromeWithFraction:(double)a3 style:(int64_t)a4
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[CLKUIColoringLabel twoToneStyleInMonochrome](self, "twoToneStyleInMonochrome"))
  {
    -[CLKUIColoringLabel _transitionTwoToneLabelToMonochromeWithFraction:](self, "_transitionTwoToneLabelToMonochromeWithFraction:", a3);
  }
  else
  {
    -[CLKUIColoringLabel text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_containsEmoji");

    if (v8)
    {
      if (fabs(a3) < 0.00000011920929)
      {
        -[CLKUIColoringLabel setUsesTextProviderTintColoring:](self, "setUsesTextProviderTintColoring:", 1);
        -[CLKUIColoringLabel _setAnimationAlpha:](self, "_setAnimationAlpha:", 1.0);
        -[UIView setAlpha:](self->_snapshot, "setAlpha:", 0.0);
      }
      a4 = CLKUIAssociatedDesaturatedType(a4);
    }
    -[CLKUIColoringLabel filterProvider](self, "filterProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filtersForView:style:fraction:", self, a4, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CLKUIColoringLabel layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFilters:", v10);

    }
  }
  self->_previousFraction = a3;
}

- (void)_transitionTwoToneLabelToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSAttributedString *originalString;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  double v19;

  -[CLKUIColoringLabel layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilters:", MEMORY[0x1E0C9AA60]);

  if (fabs(a3) >= 0.00000011920929)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
    objc_msgSend(WeakRetained, "colorForView:accented:", self, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "colorForView:accented:", self, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)-[NSAttributedString mutableCopy](self->_originalString, "mutableCopy");
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (!v9)
    {
      originalString = self->_originalString;
      v11 = *MEMORY[0x1E0DC32A8];
      v12 = -[NSAttributedString length](originalString, "length");
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __70__CLKUIColoringLabel__transitionTwoToneLabelToMonochromeWithFraction___block_invoke;
      v15[3] = &unk_1E86E04A0;
      v15[4] = self;
      v16 = v6;
      v19 = a3;
      v17 = v8;
      v18 = v7;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](originalString, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v15);

    }
    v13 = (void *)objc_msgSend(v8, "copy");
    -[CLKUIColoringLabel setAttributedText:](self, "setAttributedText:", v13);

  }
  else
  {
    -[CLKUIColoringLabel setAttributedText:](self, "setAttributedText:", self->_originalString);
  }
}

void __70__CLKUIColoringLabel__transitionTwoToneLabelToMonochromeWithFraction___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  char v9;
  double v10;
  void **v11;
  void *v12;
  char v13;
  float v14;
  void *v15;
  id v16;

  v7 = a2;
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(*(id *)(a1 + 32), "twoToneStyleInMonochrome") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "_isSimilarToColor:withinPercentage:", v8, 0.001);

    v10 = *(double *)(a1 + 64);
    if ((v9 & 1) != 0)
    {
LABEL_5:
      v11 = (void **)(a1 + 56);
LABEL_9:
      v14 = v10;
      CLKUIInterpolateBetweenColors(v7, *v11, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E0DC32A8], v15, a3, a4);

      goto LABEL_10;
    }
LABEL_8:
    v11 = (void **)(a1 + 40);
    goto LABEL_9;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "twoToneStyleInMonochrome") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "_isSimilarToColor:withinPercentage:", v12, 0.001);

    v10 = *(double *)(a1 + 64);
    if ((v13 & 1) == 0)
      goto LABEL_5;
    goto LABEL_8;
  }
LABEL_10:

}

- (void)updateMonochromeColorWithStyle:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[CLKUIColoringLabel twoToneStyleInMonochrome](self, "twoToneStyleInMonochrome"))
  {
    -[CLKUIColoringLabel _updateTwoToneLabelMonochromeColor](self, "_updateTwoToneLabelMonochromeColor");
  }
  else
  {
    -[CLKUIColoringLabel text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_containsEmoji");

    if (v6)
    {
      -[CLKUIColoringLabel setUsesTextProviderTintColoring:](self, "setUsesTextProviderTintColoring:", 0);
      -[CLKUIColoringLabel _setAnimationAlpha:](self, "_setAnimationAlpha:", 1.0);
      -[UIView setAlpha:](self->_snapshot, "setAlpha:", 0.0);
      a3 = CLKUIAssociatedDesaturatedType(a3);
    }
    -[CLKUIColoringLabel filterProvider](self, "filterProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filtersForView:style:", self, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CLKUIColoringLabel layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFilters:", v8);

    }
  }
  self->_previousFraction = 1.0;
}

- (void)_updateTwoToneLabelMonochromeColor
{
  void *v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSAttributedString *originalString;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  -[CLKUIColoringLabel layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", MEMORY[0x1E0C9AA60]);

  WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  objc_msgSend(WeakRetained, "interpolatedColorForView:", self);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained((id *)&self->_filterProvider);
  objc_msgSend(v5, "colorForView:accented:", self, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)-[NSAttributedString mutableCopy](self->_originalString, "mutableCopy");
  if (v13)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    originalString = self->_originalString;
    v10 = *MEMORY[0x1E0DC32A8];
    v11 = -[NSAttributedString length](originalString, "length");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__CLKUIColoringLabel__updateTwoToneLabelMonochromeColor__block_invoke;
    v14[3] = &unk_1E86E04C8;
    v14[4] = self;
    v15 = v7;
    v16 = v13;
    v17 = v6;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](originalString, "enumerateAttribute:inRange:options:usingBlock:", v10, 0, v11, 0, v14);

  }
  v12 = (void *)objc_msgSend(v7, "copy");
  -[CLKUIColoringLabel setAttributedText:](self, "setAttributedText:", v12);

}

void __56__CLKUIColoringLabel__updateTwoToneLabelMonochromeColor__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;

  v7 = a2;
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(*(id *)(a1 + 32), "twoToneStyleInMonochrome") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "_isSimilarToColor:withinPercentage:", v8, 0.001);

    v10 = *(void **)(a1 + 40);
    v11 = *MEMORY[0x1E0DC32A8];
    if ((v9 & 1) != 0)
    {
LABEL_5:
      v12 = *(_QWORD *)(a1 + 56);
LABEL_9:
      objc_msgSend(v10, "addAttribute:value:range:", v11, v12, a3, a4);
      goto LABEL_10;
    }
LABEL_8:
    v12 = *(_QWORD *)(a1 + 48);
    goto LABEL_9;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "twoToneStyleInMonochrome") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "_isSimilarToColor:withinPercentage:", v13, 0.001);

    v10 = *(void **)(a1 + 40);
    v11 = *MEMORY[0x1E0DC32A8];
    if ((v14 & 1) == 0)
      goto LABEL_5;
    goto LABEL_8;
  }
LABEL_10:

}

- (void)editingDidEnd
{
  UIView *snapshot;

  -[CLKUIColoringLabel _setAnimationAlpha:](self, "_setAnimationAlpha:", 1.0);
  -[UIView removeFromSuperview](self->_snapshot, "removeFromSuperview");
  snapshot = self->_snapshot;
  self->_snapshot = 0;

}

- (void)_setUpSnapshot
{
  UIView *v3;
  UIView *snapshot;

  -[CLKUIColoringLabel snapshotViewAfterScreenUpdates:](self, "snapshotViewAfterScreenUpdates:", 0);
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  snapshot = self->_snapshot;
  self->_snapshot = v3;

  -[CLKUIColoringLabel frame](self, "frame");
  -[UIView setFrame:](self->_snapshot, "setFrame:");
}

- (BOOL)inTimeTravel
{
  return self->_inTimeTravel;
}

- (void)setOverrideColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideColor, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (CLKFont)smallCapsBaseFont
{
  return self->_smallCapsBaseFont;
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (CLKFont)monospacedDigitsFont
{
  return self->_monospacedDigitsFont;
}

- (void)setMonospacedDigitsFont:(id)a3
{
  objc_storeStrong((id *)&self->_monospacedDigitsFont, a3);
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (BOOL)uppercase
{
  return self->_uppercase;
}

- (BOOL)usesTextProviderTintColoring
{
  return self->_usesTextProviderTintColoring;
}

- (BOOL)textDefinesTruncation
{
  return self->_textDefinesTruncation;
}

- (BOOL)isTextTruncated
{
  return self->_isTextTruncated;
}

- (NSParagraphStyle)paragraphStyle
{
  return self->_paragraphStyle;
}

- (double)tracking
{
  return self->_tracking;
}

- (id)nowProvider
{
  return self->_nowProvider;
}

- (void)setNowProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (id)needsResizeHandler
{
  return self->_needsResizeHandler;
}

- (void)setNeedsResizeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (int64_t)twoToneStyleInMonochrome
{
  return self->_twoToneStyleInMonochrome;
}

- (void)setTwoToneStyleInMonochrome:(int64_t)a3
{
  self->_twoToneStyleInMonochrome = a3;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (CGSize)cachedSingleLineSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedSingleLineSize.width;
  height = self->_cachedSingleLineSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedSingleLineSize:(CGSize)a3
{
  self->_cachedSingleLineSize = a3;
}

- (BOOL)cachedSizeIsValid
{
  return self->_cachedSizeIsValid;
}

- (void)setCachedSizeIsValid:(BOOL)a3
{
  self->_cachedSizeIsValid = a3;
}

- (UIEdgeInsets)cachedOpticalEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cachedOpticalEdgeInsets.top;
  left = self->_cachedOpticalEdgeInsets.left;
  bottom = self->_cachedOpticalEdgeInsets.bottom;
  right = self->_cachedOpticalEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)cachedOpticalEdgeInsetsIsValid
{
  return self->_cachedOpticalEdgeInsetsIsValid;
}

- (void)setCachedOpticalEdgeInsetsIsValid:(BOOL)a3
{
  self->_cachedOpticalEdgeInsetsIsValid = a3;
}

- (BOOL)usesTextProviderSize
{
  return self->_usesTextProviderSize;
}

- (void)setUsesTextProviderSize:(BOOL)a3
{
  self->_usesTextProviderSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong(&self->_needsResizeHandler, 0);
  objc_storeStrong(&self->_nowProvider, 0);
  objc_storeStrong((id *)&self->_paragraphStyle, 0);
  objc_storeStrong((id *)&self->_monospacedDigitsFont, 0);
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_smallCapsBaseFont, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_originalString, 0);
  objc_storeStrong((id *)&self->_preTimeTravelFont, 0);
  objc_storeStrong((id *)&self->_updateToken, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_colorManager, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
