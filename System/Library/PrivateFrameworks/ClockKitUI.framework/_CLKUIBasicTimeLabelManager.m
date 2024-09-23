@implementation _CLKUIBasicTimeLabelManager

- (void)updateTimeText
{
  CLKTimeFormatter *timeFormatter;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  _BOOL4 showSubstringFromSeparator;
  CLKTimeFormatter *v9;
  char v10;
  void *v11;
  CLKTimeFormatter *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  id obj;

  if (self->_showsDesignator)
  {
    if (self->_showSubstringFromSeparator && self->_showSubstringToSeparator)
    {
      timeFormatter = self->_timeFormatter;
      if (self->_hideMinutesIfZero)
        -[CLKTimeFormatter timeAndDesignatorTextWithoutMinutesIfZero](timeFormatter, "timeAndDesignatorTextWithoutMinutesIfZero");
      else
        -[CLKTimeFormatter timeAndDesignatorText](timeFormatter, "timeAndDesignatorText");
LABEL_6:
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99768];
    v7 = CFSTR("Showing the designator and hiding a piece of the time is unsupported.");
    goto LABEL_8;
  }
  showSubstringFromSeparator = self->_showSubstringFromSeparator;
  if (self->_showSubstringToSeparator)
  {
    v9 = self->_timeFormatter;
    if (showSubstringFromSeparator)
      -[CLKTimeFormatter timeText](v9, "timeText");
    else
      -[CLKTimeFormatter timeSubstringToSeparatorText](v9, "timeSubstringToSeparatorText");
    goto LABEL_6;
  }
  if (!self->_showSubstringFromSeparator)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99768];
    v7 = CFSTR("Hiding the text both before and after the separator is unsupported.");
LABEL_8:
    objc_msgSend(v5, "raise:format:", v6, v7);
    v4 = 0;
    goto LABEL_16;
  }
  -[CLKTimeFormatter timeSubstringFromSeparatorText](self->_timeFormatter, "timeSubstringFromSeparatorText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  obj = v4;
  v10 = objc_msgSend(v4, "isEqualToString:", self->_timeText);
  v11 = obj;
  if ((v10 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeText, obj);
    if (self->_showSubstringFromSeparator)
    {
      if (self->_showSubstringToSeparator)
      {
        v12 = self->_timeFormatter;
        if (self->_showsDesignator)
          v13 = -[CLKTimeFormatter blinkerRangeInTimeAndDesignatorText](v12, "blinkerRangeInTimeAndDesignatorText");
        else
          v13 = -[CLKTimeFormatter blinkerRangeInTimeText](v12, "blinkerRangeInTimeText");
      }
      else
      {
        v13 = -[CLKTimeFormatter blinkerRangeInTimeSubstringFromSeparatorText](self->_timeFormatter, "blinkerRangeInTimeSubstringFromSeparatorText");
      }
    }
    else
    {
      v13 = -[CLKTimeFormatter blinkerRangeInTimeSubstringToSeparatorText](self->_timeFormatter, "blinkerRangeInTimeSubstringToSeparatorText");
    }
    self->_minutesBlinkerRange.location = v13;
    self->_minutesBlinkerRange.length = v14;
    if (self->_showSeconds)
    {
      v15 = -[CLKTimeFormatter lastBlinkerRangeInTimeText](self->_timeFormatter, "lastBlinkerRangeInTimeText");
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
    self->_secondsBlinkerRange.location = v15;
    self->_secondsBlinkerRange.length = v16;
    -[_CLKUIBasicTimeLabelManager _updateAttributedText](self, "_updateAttributedText");
    v11 = obj;
  }

}

- (void)_updateAttributedText
{
  NSAttributedString *v3;
  NSAttributedString *correctAttributedText;
  NSAttributedString *minutesBlinkerAttributedText;
  NSAttributedString *secondsBlinkerAttributedText;
  CGPoint v7;
  CGSize v8;
  _OWORD *v9;
  __int128 v10;

  -[_CLKUIBasicTimeLabelManager _attributedTextShowingBlinker:numbers:](self, "_attributedTextShowingBlinker:numbers:", self->_showsBlinker, self->_showsNumbers);
  v3 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  correctAttributedText = self->_correctAttributedText;
  self->_correctAttributedText = v3;

  minutesBlinkerAttributedText = self->_minutesBlinkerAttributedText;
  self->_minutesBlinkerAttributedText = 0;

  secondsBlinkerAttributedText = self->_secondsBlinkerAttributedText;
  self->_secondsBlinkerAttributedText = 0;

  v7 = (CGPoint)*MEMORY[0x1E0C9D628];
  v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_boundingRectOfMinutesBlinkerAttributedText.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_boundingRectOfMinutesBlinkerAttributedText.size = v8;
  self->_boundingRectOfSecondsBlinkerAttributedText.origin = v7;
  self->_boundingRectOfSecondsBlinkerAttributedText.size = v8;
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", self->_correctAttributedText);
  v9 = (_OWORD *)MEMORY[0x1E0DC49E8];
  self->_cachedIntrinsicSize = (CGSize)*MEMORY[0x1E0C9D820];
  v10 = v9[1];
  *(_OWORD *)&self->_cachedOpticalEdgeInsets.top = *v9;
  *(_OWORD *)&self->_cachedOpticalEdgeInsets.bottom = v10;
  self->_cachedOpticalEdgeInsetsIsValid = 0;
}

- (id)_attributedTextShowingBlinker:(BOOL)a3 numbers:(BOOL)a4
{
  id v5;
  NSString *timeText;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CLKTimeFormatter *timeFormatter;
  uint64_t v13;
  uint64_t v14;
  CLKTimeFormatter *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  if (!self->_timeText)
    return 0;
  v5 = objc_alloc(MEMORY[0x1E0CB3778]);
  timeText = self->_timeText;
  v7 = *MEMORY[0x1E0DC32A0];
  v51 = *MEMORY[0x1E0DC32A0];
  -[_CLKUIBasicTimeLabelManager effectiveFont](self, "effectiveFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithString:attributes:", timeText, v9);

  -[CLKUITimeLabelStyle designatorFont](self->_style, "designatorFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && self->_showsDesignator)
  {
    timeFormatter = self->_timeFormatter;
    if (self->_hideMinutesIfZero)
      v13 = -[CLKTimeFormatter designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero](timeFormatter, "designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero");
    else
      v13 = -[CLKTimeFormatter designatorRangeInTimeAndDesignatorText](timeFormatter, "designatorRangeInTimeAndDesignatorText");
    objc_msgSend(v10, "addAttribute:value:range:", v7, v11, v13, v14);
  }
  if (self->_showSubstringFromSeparator)
  {
    if (self->_showSubstringToSeparator)
    {
      v16 = self->_timeFormatter;
      if (self->_showsDesignator)
        v17 = -[CLKTimeFormatter blinkerRangeInTimeAndDesignatorText](v16, "blinkerRangeInTimeAndDesignatorText");
      else
        v17 = -[CLKTimeFormatter blinkerRangeInTimeText](v16, "blinkerRangeInTimeText");
    }
    else
    {
      v17 = -[CLKTimeFormatter blinkerRangeInTimeSubstringFromSeparatorText](self->_timeFormatter, "blinkerRangeInTimeSubstringFromSeparatorText");
    }
  }
  else
  {
    v17 = -[CLKTimeFormatter blinkerRangeInTimeSubstringToSeparatorText](self->_timeFormatter, "blinkerRangeInTimeSubstringToSeparatorText");
  }
  v19 = v17;
  v20 = v18;
  if (self->_showSeconds)
  {
    v46 = v18;
    v21 = v17;
    v22 = -[CLKTimeFormatter lastBlinkerRangeInTimeText](self->_timeFormatter, "lastBlinkerRangeInTimeText");
    v24 = v23;
    if (self->_showSeconds)
    {
      v45 = v11;
      v25 = -[CLKTimeFormatter rangeInTimeSubstringFromSecondsSeparatorText](self->_timeFormatter, "rangeInTimeSubstringFromSecondsSeparatorText");
      v27 = v26;
      if (v25 + v26 <= (unint64_t)objc_msgSend(v10, "length"))
      {
        v49 = v7;
        -[_CLKUIBasicTimeLabelManager effectiveFont](self, "effectiveFont");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "CLKFontWithMonospacedNumbers");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAttributes:range:", v30, v25, v27);

      }
      v11 = v45;
    }
    v31 = v22;
    v32 = v24;
    v19 = v21;
    v20 = v46;
  }
  else
  {
    v31 = 0;
    v32 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    if (v19 + v20 < (unint64_t)objc_msgSend(v10, "length"))
      objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC32A8], v33, v19, v20);
    if (self->_showSeconds && v32 + v31 < (unint64_t)objc_msgSend(v10, "length"))
      objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC32A8], v33, v31, v32);
  }
  if (!a4)
  {
    v34 = objc_msgSend(v10, "length");
    v35 = *MEMORY[0x1E0DC32A8];
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC32A8], v33, 0, v34);
    if (v19 + v20 < (unint64_t)objc_msgSend(v10, "length"))
      objc_msgSend(v10, "removeAttribute:range:", v35, v19, v20);
    if (self->_showSeconds && v32 + v31 < (unint64_t)objc_msgSend(v10, "length"))
      objc_msgSend(v10, "removeAttribute:range:", v35, v31, v32);
  }
  if (-[CLKTimeFormatter suppressesDesignatorWhitespace](self->_timeFormatter, "suppressesDesignatorWhitespace"))
  {
    v36 = (void *)objc_opt_new();
    objc_msgSend(v36, "setCompositionLanguage:", 1);
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC32C0], v36, 0, -[NSString length](self->_timeText, "length"));

  }
  -[CLKTimeFormatter fontTrackingAttribute](self->_timeFormatter, "fontTrackingAttribute");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    v38 = *MEMORY[0x1E0DC3318];
    -[CLKTimeFormatter fontTrackingAttribute](self->_timeFormatter, "fontTrackingAttribute");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAttribute:value:range:", v38, v39, 0, -[NSString length](self->_timeText, "length"));

  }
  if (-[CLKTimeFormatter forcedNumberSystem](self->_timeFormatter, "forcedNumberSystem") != -1)
  {
    -[CLKTimeFormatter forcedNumberSystem](self->_timeFormatter, "forcedNumberSystem");
    CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v10, "length");
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0CB2CE0], v40, 0, v41);

  }
  -[CLKUITimeLabelStyle stringAttributes](self->_style, "stringAttributes");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v43 = objc_msgSend(v10, "length");
    -[CLKUITimeLabelStyle stringAttributes](self->_style, "stringAttributes");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAttributes:range:", v44, 0, v43);

  }
  return v10;
}

- (id)effectiveFont
{
  return -[UILabel font](self->_label, "font");
}

- (CGSize)sizeThatFits
{
  double v3;
  double v4;
  double maxWidth;
  double v6;
  CGSize result;

  -[_CLKUIBasicTimeLabelManager intrinsicSize](self, "intrinsicSize");
  maxWidth = self->_maxWidth;
  v6 = fabs(maxWidth);
  if (v3 <= maxWidth)
    maxWidth = v3;
  if (v6 >= 0.00000011920929)
    v3 = maxWidth;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicSize
{
  double width;
  double height;
  CGSize result;

  if ((CLKSizeIsEmpty() & 1) != 0)
  {
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    self->_cachedIntrinsicSize.width = width;
    self->_cachedIntrinsicSize.height = height;
  }
  else
  {
    width = self->_cachedIntrinsicSize.width;
    height = self->_cachedIntrinsicSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (UIView)view
{
  return (UIView *)self->_label;
}

- (void)setAnimationsPaused:(BOOL)a3
{
  self->_animationsPaused = a3;
}

- (_CLKUIBasicTimeLabelManager)initWithForDevice:(id)a3 timeFormatter:(id)a4 options:(unint64_t)a5 timer:(id)a6 labelFactory:(id)a7
{
  return (_CLKUIBasicTimeLabelManager *)-[_CLKUIBasicTimeLabelManager _initForDevice:primary:withTimeFormatter:options:labelFactory:](self, "_initForDevice:primary:withTimeFormatter:options:labelFactory:", a3, 1, a4, a5, a7);
}

- (id)_initForDevice:(id)a3 primary:(BOOL)a4 withTimeFormatter:(id)a5 options:(unint64_t)a6 labelFactory:(id)a7
{
  __int16 v8;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  _CLKUIBasicTimeLabelManager *v16;
  _CLKUIBasicTimeLabelManager *v17;
  CGPoint v18;
  CGSize v19;
  uint64_t v20;
  UILabel *label;
  objc_super v23;

  v8 = a6;
  v13 = a3;
  v14 = a5;
  v15 = (void (**)(id, _QWORD))a7;
  v23.receiver = self;
  v23.super_class = (Class)_CLKUIBasicTimeLabelManager;
  v16 = -[_CLKUIBasicTimeLabelManager init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_device, a3);
    v17->_primary = a4;
    objc_storeStrong((id *)&v17->_timeFormatter, a5);
    v17->_hideMinutesIfZero = (v8 & 4) != 0;
    v17->_showSubstringFromSeparator = (v8 & 0x400) == 0;
    v17->_showSubstringToSeparator = (v8 & 0x800) == 0;
    v17->_showSeconds = 0;
    *(_WORD *)&v17->_showsBlinker = 257;
    v18 = (CGPoint)*MEMORY[0x1E0C9D628];
    v19 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v17->_boundingRectOfMinutesBlinkerAttributedText.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v17->_boundingRectOfMinutesBlinkerAttributedText.size = v19;
    v17->_boundingRectOfSecondsBlinkerAttributedText.origin = v18;
    v17->_boundingRectOfSecondsBlinkerAttributedText.size = v19;
    ((void (**)(id, BOOL))v15)[2](v15, v17->_primary);
    v20 = objc_claimAutoreleasedReturnValue();
    label = v17->_label;
    v17->_label = (UILabel *)v20;

    -[UILabel setTextAlignment:](v17->_label, "setTextAlignment:", 1);
  }

  return v17;
}

- (void)setStyle:(id)a3
{
  CLKUITimeLabelStyle *v4;
  CLKUITimeLabelStyle *style;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  CLKUITimeLabelStyle *v14;
  void *v15;
  id v16;

  v16 = a3;
  if ((objc_msgSend(v16, "isEqual:", self->_style) & 1) == 0)
  {
    v4 = objc_alloc_init(CLKUITimeLabelStyle);
    style = self->_style;
    self->_style = v4;

    objc_msgSend(v16, "threeDigitFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _FontWithCenteredColons(v6, -[CLKTimeFormatter forcedNumberSystem](self->_timeFormatter, "forcedNumberSystem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabelStyle setThreeDigitFont:](self->_style, "setThreeDigitFont:", v7);

    objc_msgSend(v16, "fourDigitFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _FontWithCenteredColons(v8, -[CLKTimeFormatter forcedNumberSystem](self->_timeFormatter, "forcedNumberSystem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabelStyle setFourDigitFont:](self->_style, "setFourDigitFont:", v9);

    objc_msgSend(v16, "designatorFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabelStyle setDesignatorFont:](self->_style, "setDesignatorFont:", v10);

    objc_msgSend(v16, "stringAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabelStyle setStringAttributes:](self->_style, "setStringAttributes:", v11);

    -[CLKTimeFormatter timeText](self->_timeFormatter, "timeText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");
    v14 = self->_style;
    if (v13 > 4)
      -[CLKUITimeLabelStyle fourDigitFont](v14, "fourDigitFont");
    else
      -[CLKUITimeLabelStyle threeDigitFont](v14, "threeDigitFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](self->_label, "setFont:", v15);
    -[_CLKUIBasicTimeLabelManager _updateAttributedText](self, "_updateAttributedText");

  }
}

- (void)setShowsDesignator:(BOOL)a3
{
  if (self->_showsDesignator != a3)
  {
    self->_showsDesignator = a3;
    -[_CLKUIBasicTimeLabelManager updateTimeText](self, "updateTimeText");
  }
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (double)_capOffsetFromBoundsTop
{
  double result;

  -[UILabel _capOffsetFromBoundsTop](self->_label, "_capOffsetFromBoundsTop");
  return result;
}

- (double)_lastLineBaseline
{
  double result;

  -[UILabel _lastLineBaseline](self->_label, "_lastLineBaseline");
  return result;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (id)effectiveAttributedText
{
  return -[_CLKUIBasicTimeLabelManager _attributedTextShowingBlinker:numbers:](self, "_attributedTextShowingBlinker:numbers:", 1, 1);
}

- (void)sizeViewToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[UILabel bounds](self->_label, "bounds");
  v4 = v3;
  v6 = v5;
  -[_CLKUIBasicTimeLabelManager sizeThatFits](self, "sizeThatFits");
  -[UILabel setBounds:](self->_label, "setBounds:", v4, v6, v7, v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  NSString *timeText;
  id v5;

  timeText = self->_timeText;
  self->_timeText = 0;
  v5 = a3;

  -[UILabel traitCollectionDidChange:](self->_label, "traitCollectionDidChange:", v5);
  -[_CLKUIBasicTimeLabelManager updateTimeText](self, "updateTimeText");
}

- (UIEdgeInsets)opticalInsets
{
  double v3;
  CGFloat top;
  double v5;
  double left;
  double v7;
  CGFloat bottom;
  double v9;
  double right;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  __int128 v21;
  CGFloat v22;
  double width;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  UIEdgeInsets result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UILabel opticalInsets](self->_label, "opticalInsets");
    top = v3;
    left = v5;
    bottom = v7;
    right = v9;
  }
  else if (CLKSizeIsEmpty())
  {
    top = *MEMORY[0x1E0DC49E8];
    left = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    bottom = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    right = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else if (self->_cachedOpticalEdgeInsetsIsValid)
  {
    top = self->_cachedOpticalEdgeInsets.top;
    left = self->_cachedOpticalEdgeInsets.left;
    bottom = self->_cachedOpticalEdgeInsets.bottom;
    right = self->_cachedOpticalEdgeInsets.right;
  }
  else
  {
    -[UILabel _stringDrawingContext](self->_label, "_stringDrawingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel attributedText](self->_label, "attributedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "boundingRectWithSize:options:context:", 9, v11, self->_cachedIntrinsicSize.width, self->_cachedIntrinsicSize.height);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v21 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&self->_cachedOpticalEdgeInsets.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&self->_cachedOpticalEdgeInsets.bottom = v21;
    CLKFloorForDevice();
    self->_cachedOpticalEdgeInsets.left = v22;
    width = self->_cachedIntrinsicSize.width;
    v29.origin.x = v14;
    v29.origin.y = v16;
    v29.size.width = v18;
    v29.size.height = v20;
    CGRectGetWidth(v29);
    CLKCeilForDevice();
    top = self->_cachedOpticalEdgeInsets.top;
    left = self->_cachedOpticalEdgeInsets.left;
    right = width - v24 - left;
    self->_cachedOpticalEdgeInsets.right = right;
    self->_cachedOpticalEdgeInsetsIsValid = 1;
    bottom = self->_cachedOpticalEdgeInsets.bottom;

  }
  v25 = top;
  v26 = left;
  v27 = bottom;
  v28 = right;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_textColor, a3);
  v5 = a3;
  -[UILabel setTextColor:](self->_label, "setTextColor:", v5);
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", self->_correctAttributedText);

}

- (void)setShowSeconds:(BOOL)a3
{
  NSString *timeText;

  if (self->_showSeconds != a3)
  {
    self->_showSeconds = a3;
    timeText = self->_timeText;
    self->_timeText = 0;

    -[_CLKUIBasicTimeLabelManager _updateAttributedText](self, "_updateAttributedText");
  }
}

- (void)enumerateUnderlyingLabelsWithBlock:(id)a3
{
  (*((void (**)(id, UILabel *, BOOL))a3 + 2))(a3, self->_label, self->_primary);
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", self->_correctAttributedText);
}

- (id)minutesDesignatorAttributedText
{
  NSAttributedString *v2;
  NSAttributedString *minutesBlinkerAttributedText;
  void *v5;
  void *v6;
  NSAttributedString *v7;
  NSAttributedString *v8;

  if (self->_minutesBlinkerRange.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    minutesBlinkerAttributedText = self->_minutesBlinkerAttributedText;
    if (!minutesBlinkerAttributedText)
    {
      -[NSAttributedString attributedSubstringFromRange:](self->_correctAttributedText, "attributedSubstringFromRange:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E0DC32A8], 0, objc_msgSend(v6, "length"));
      v7 = (NSAttributedString *)objc_msgSend(v6, "copy");
      v8 = self->_minutesBlinkerAttributedText;
      self->_minutesBlinkerAttributedText = v7;

      minutesBlinkerAttributedText = self->_minutesBlinkerAttributedText;
    }
    v2 = minutesBlinkerAttributedText;
  }
  return v2;
}

- (id)secondsDesignatorAttributedText
{
  NSAttributedString *v2;
  void *v4;
  void *v5;
  NSAttributedString *v6;
  NSAttributedString *secondsBlinkerAttributedText;

  if (self->_secondsBlinkerRange.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    if (self->_secondsBlinkerRange.length)
    {
      -[NSAttributedString attributedSubstringFromRange:](self->_correctAttributedText, "attributedSubstringFromRange:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v4, "mutableCopy");

      objc_msgSend(v5, "removeAttribute:range:", *MEMORY[0x1E0DC32A8], 0, objc_msgSend(v5, "length"));
      v6 = (NSAttributedString *)objc_msgSend(v5, "copy");
      secondsBlinkerAttributedText = self->_secondsBlinkerAttributedText;
      self->_secondsBlinkerAttributedText = v6;

    }
    v2 = self->_secondsBlinkerAttributedText;
  }
  return v2;
}

- (CGRect)_boundingRectOfBlinkerAtRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  NSUInteger v24;
  NSUInteger v25;
  double v26;
  uint64_t v27;
  const CGGlyph *v28;
  const __CTFont *v29;
  CGFloat width;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _QWORD v37[2];
  CGRect OpticalBoundsForGlyphs;
  CGRect result;

  length = a3.length;
  location = a3.location;
  v37[1] = *MEMORY[0x1E0C80C00];
  -[_CLKUIBasicTimeLabelManager intrinsicSize](self, "intrinsicSize");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC33E0]), "initWithAttributedString:", self->_correctAttributedText);
  v11 = objc_alloc_init(MEMORY[0x1E0DC33A8]);
  objc_msgSend(v10, "addLayoutManager:", v11);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC33D8]), "initWithSize:", v7, v9);
  objc_msgSend(v12, "setLineFragmentPadding:", 0.0);
  objc_msgSend(v11, "addTextContainer:", v12);
  -[_CLKUIBasicTimeLabelManager secondsDesignatorAttributedText](self, "secondsDesignatorAttributedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC32A0];
  objc_msgSend(v13, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC32A0], 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15
    || (-[NSAttributedString attribute:atIndex:effectiveRange:](self->_correctAttributedText, "attribute:atIndex:effectiveRange:", v14, 0, 0), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = objc_msgSend(v11, "locationForGlyphAtIndex:", location);
    v23 = v22;
    v24 = location + 1;
    if (location + 1 < location + length)
    {
      v25 = length - 1;
      do
      {
        v16 = objc_msgSend(v11, "locationForGlyphAtIndex:", v24);
        if (v26 < v23)
          v23 = v26;
        ++v24;
        --v25;
      }
      while (v25);
    }
    MEMORY[0x1E0C80A78](v16, v17, v18, v19, v20, v21);
    v28 = (const CGGlyph *)((char *)v37 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
    objc_msgSend(v11, "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", location, length, v28, 0, 0, 0);
    objc_msgSend(v10, "attribute:atIndex:effectiveRange:", v14, location, 0);
    v29 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
    OpticalBoundsForGlyphs = CTFontGetOpticalBoundsForGlyphs(v29, v28, 0, length, 0);
    width = OpticalBoundsForGlyphs.size.width;
    v31 = v23 + OpticalBoundsForGlyphs.origin.x;

    v32 = 0.0;
  }
  else
  {
    v31 = *MEMORY[0x1E0C9D648];
    v32 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v33 = v31;
  v34 = v32;
  v35 = width;
  v36 = v9;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (CGRect)_boundingRectOfMinutesBlinker
{
  CGRect *p_boundingRectOfMinutesBlinkerAttributedText;
  NSUInteger location;
  CGSize v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  p_boundingRectOfMinutesBlinkerAttributedText = &self->_boundingRectOfMinutesBlinkerAttributedText;
  if (CGRectIsNull(self->_boundingRectOfMinutesBlinkerAttributedText))
  {
    location = self->_minutesBlinkerRange.location;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      p_boundingRectOfMinutesBlinkerAttributedText->origin = (CGPoint)*MEMORY[0x1E0C9D648];
      p_boundingRectOfMinutesBlinkerAttributedText->size = v5;
    }
    else
    {
      -[_CLKUIBasicTimeLabelManager _boundingRectOfBlinkerAtRange:](self, "_boundingRectOfBlinkerAtRange:", location, self->_minutesBlinkerRange.length);
      self->_boundingRectOfMinutesBlinkerAttributedText.origin.x = v6;
      self->_boundingRectOfMinutesBlinkerAttributedText.origin.y = v7;
      self->_boundingRectOfMinutesBlinkerAttributedText.size.width = v8;
      self->_boundingRectOfMinutesBlinkerAttributedText.size.height = v9;
    }
  }
  x = self->_boundingRectOfMinutesBlinkerAttributedText.origin.x;
  y = self->_boundingRectOfMinutesBlinkerAttributedText.origin.y;
  width = self->_boundingRectOfMinutesBlinkerAttributedText.size.width;
  height = self->_boundingRectOfMinutesBlinkerAttributedText.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_boundingRectOfSecondsBlinker
{
  CGRect *p_boundingRectOfSecondsBlinkerAttributedText;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGSize v8;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  p_boundingRectOfSecondsBlinkerAttributedText = &self->_boundingRectOfSecondsBlinkerAttributedText;
  if (CGRectIsNull(self->_boundingRectOfSecondsBlinkerAttributedText))
  {
    if (self->_secondsBlinkerRange.length)
    {
      -[_CLKUIBasicTimeLabelManager _boundingRectOfBlinkerAtRange:](self, "_boundingRectOfBlinkerAtRange:", self->_secondsBlinkerRange.location);
      self->_boundingRectOfSecondsBlinkerAttributedText.origin.x = v4;
      self->_boundingRectOfSecondsBlinkerAttributedText.origin.y = v5;
      self->_boundingRectOfSecondsBlinkerAttributedText.size.width = v6;
      self->_boundingRectOfSecondsBlinkerAttributedText.size.height = v7;
    }
    else
    {
      v8 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      p_boundingRectOfSecondsBlinkerAttributedText->origin = (CGPoint)*MEMORY[0x1E0C9D648];
      p_boundingRectOfSecondsBlinkerAttributedText->size = v8;
    }
  }
  x = self->_boundingRectOfSecondsBlinkerAttributedText.origin.x;
  y = self->_boundingRectOfSecondsBlinkerAttributedText.origin.y;
  width = self->_boundingRectOfSecondsBlinkerAttributedText.size.width;
  height = self->_boundingRectOfSecondsBlinkerAttributedText.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)animationsPaused
{
  return self->_animationsPaused;
}

- (BOOL)showSeconds
{
  return self->_showSeconds;
}

- (BOOL)showsBlinker
{
  return self->_showsBlinker;
}

- (void)setShowsBlinker:(BOOL)a3
{
  self->_showsBlinker = a3;
}

- (BOOL)showsNumbers
{
  return self->_showsNumbers;
}

- (void)setShowsNumbers:(BOOL)a3
{
  self->_showsNumbers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsBlinkerAttributedText, 0);
  objc_storeStrong((id *)&self->_minutesBlinkerAttributedText, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_correctAttributedText, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_timeText, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
