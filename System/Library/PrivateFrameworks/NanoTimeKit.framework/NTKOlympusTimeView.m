@implementation NTKOlympusTimeView

- (NTKOlympusTimeView)initWithDevice:(id)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6 date:(id)a7
{
  return -[NTKOlympusTimeView initWithDevice:dial:style:colorPalette:date:useSmallFont:circularLogoImage:](self, "initWithDevice:dial:style:colorPalette:date:useSmallFont:circularLogoImage:", a3, a4, a5, a6, a7, 0, 0);
}

- (NTKOlympusTimeView)initWithDevice:(id)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6 date:(id)a7 useSmallFont:(BOOL)a8 circularLogoImage:(id)a9
{
  id v15;
  NTKOlympusColorPalette *v16;
  id v17;
  id v18;
  NTKOlympusTimeView *v19;
  NTKOlympusTimeView *v20;
  objc_super v23;

  v15 = a3;
  v16 = (NTKOlympusColorPalette *)a6;
  v17 = a7;
  v18 = a9;
  v23.receiver = self;
  v23.super_class = (Class)NTKOlympusTimeView;
  v19 = -[NTKOlympusTimeView init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_maskingPathStartsFromHourHand = -[NTKOlympusTimeView _maskingPathStartsFromHourHandForDate:](v19, "_maskingPathStartsFromHourHandForDate:", v17);
    objc_storeStrong((id *)&v20->_device, a3);
    v20->_currentStyle = a5;
    v20->_currentDial = a4;
    v20->_currentColorPalette = v16;
    objc_storeStrong((id *)&v20->_date, a7);
    v20->_useSmallFont = a8;
    objc_storeStrong((id *)&v20->_circularLogoImage, a9);
    -[NTKOlympusTimeView createAndRemoveViewsForCurrentStateIfNeeded](v20, "createAndRemoveViewsForCurrentStateIfNeeded");
  }

  return v20;
}

- (void)layoutSubviews
{
  NTKOlympusTimeContentView *contentView;
  void *v4;
  double v5;
  CGFloat v6;
  NTKOlympusTimeContentView *overlayContentView;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)NTKOlympusTimeView;
  -[NTKOlympusTimeView layoutSubviews](&v8, sel_layoutSubviews);
  contentView = self->_contentView;
  -[NTKOlympusTimeView bounds](self, "bounds");
  -[UIView ntk_setBoundsAndPositionFromFrame:](contentView, "ntk_setBoundsAndPositionFromFrame:");
  -[NTKOlympusTimeView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenScale");
  v6 = -1.0 / v5;

  overlayContentView = self->_overlayContentView;
  -[NTKOlympusTimeView bounds](self, "bounds");
  v10 = CGRectInset(v9, v6, v6);
  -[UIView ntk_setBoundsAndPositionFromFrame:](overlayContentView, "ntk_setBoundsAndPositionFromFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  -[NTKOlympusTimeView applyWindrunnerMaskWithDate:](self, "applyWindrunnerMaskWithDate:", self->_date);
}

- (void)createAndRemoveViewsForCurrentStateIfNeeded
{
  unint64_t currentStyle;
  NTKOlympusTimeContentView *overlayContentView;

  currentStyle = self->_currentStyle;
  if (currentStyle - 1 >= 2)
  {
    if (!currentStyle)
    {
      -[NTKOlympusTimeView _createContentViewIfNeeded](self, "_createContentViewIfNeeded");
      -[NTKOlympusTimeContentView removeFromSuperview](self->_overlayContentView, "removeFromSuperview");
      overlayContentView = self->_overlayContentView;
      self->_overlayContentView = 0;

    }
  }
  else
  {
    -[NTKOlympusTimeView _createContentViewIfNeeded](self, "_createContentViewIfNeeded");
    -[NTKOlympusTimeView _createOverlayViewIfNeeded](self, "_createOverlayViewIfNeeded");
  }
}

- (void)setCurrentDial:(unint64_t)a3
{
  void *v5;
  id v6;

  self->_currentDial = a3;
  -[NTKOlympusTimeView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDial:", a3);

  -[NTKOlympusTimeView overlayContentView](self, "overlayContentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDial:", a3);

}

- (void)setCurrentColorPalette:(id)a3
{
  id v4;
  void *v5;
  id v6;

  self->_currentColorPalette = (NTKOlympusColorPalette *)a3;
  v4 = a3;
  -[NTKOlympusTimeView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColorPalette:", v4);

  -[NTKOlympusTimeView overlayContentView](self, "overlayContentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColorPalette:", v4);

}

- (void)setCurrentStyle:(unint64_t)a3
{
  void *v5;
  id v6;

  self->_currentStyle = a3;
  -[NTKOlympusTimeView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyle:", a3);

  -[NTKOlympusTimeView overlayContentView](self, "overlayContentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStyle:", a3);

}

- (void)configureViewsForEditing
{
  -[NTKOlympusTimeView _createOverlayViewIfNeeded](self, "_createOverlayViewIfNeeded");
  -[NTKOlympusTimeView _createContentViewIfNeeded](self, "_createContentViewIfNeeded");
}

- (void)_createContentViewIfNeeded
{
  NTKOlympusTimeContentView *contentView;
  NTKOlympusTimeContentView *v4;
  void *v5;
  NTKOlympusTimeContentView *v6;
  NTKOlympusTimeContentView *v7;
  NTKOlympusTimeView *v8;
  NTKOlympusTimeContentView *v9;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = [NTKOlympusTimeContentView alloc];
    -[NTKOlympusTimeView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKOlympusTimeContentView initWithDevice:dial:style:colorPalette:useSmallFont:circularLogoImage:](v4, "initWithDevice:dial:style:colorPalette:useSmallFont:circularLogoImage:", v5, self->_currentDial, self->_currentStyle, self->_currentColorPalette, self->_useSmallFont, self->_circularLogoImage);
    v7 = self->_contentView;
    self->_contentView = v6;

    -[NTKOlympusTimeView bounds](self, "bounds");
    -[NTKOlympusTimeContentView setFrame:](self->_contentView, "setFrame:");
    -[NTKOlympusTimeContentView clipsToBounds](self->_contentView, "clipsToBounds");
    -[NTKOlympusTimeContentView setDelegate:](self->_contentView, "setDelegate:", self);
    -[NTKOlympusTimeContentView setOverrideDate:duration:](self->_contentView, "setOverrideDate:duration:", self->_date, 0.0);
    contentView = self->_contentView;
  }
  -[NTKOlympusTimeContentView superview](contentView, "superview");
  v8 = (NTKOlympusTimeView *)objc_claimAutoreleasedReturnValue();

  if (v8 != self)
  {
    v9 = self->_contentView;
    if (self->_overlayContentView)
      -[NTKOlympusTimeView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v9);
    else
      -[NTKOlympusTimeView addSubview:](self, "addSubview:", v9);
  }
}

- (void)_createOverlayViewIfNeeded
{
  NTKOlympusTimeContentView *overlayContentView;
  NTKOlympusTimeContentView *v4;
  void *v5;
  NTKOlympusTimeContentView *v6;
  NTKOlympusTimeContentView *v7;
  void *v8;
  NTKOlympusTimeView *v9;
  NTKOlympusTimeContentView *v10;

  overlayContentView = self->_overlayContentView;
  if (!overlayContentView)
  {
    v4 = [NTKOlympusTimeContentView alloc];
    -[NTKOlympusTimeView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKOlympusTimeContentView initWithDevice:dial:style:colorPalette:useSmallFont:circularLogoImage:](v4, "initWithDevice:dial:style:colorPalette:useSmallFont:circularLogoImage:", v5, self->_currentDial, self->_currentStyle, self->_currentColorPalette, self->_useSmallFont, self->_circularLogoImage);
    v7 = self->_overlayContentView;
    self->_overlayContentView = v6;

    -[NTKOlympusTimeView bounds](self, "bounds");
    -[NTKOlympusTimeContentView setFrame:](self->_overlayContentView, "setFrame:");
    -[NTKOlympusTimeContentView setInvertedColors:](self->_overlayContentView, "setInvertedColors:", 1);
    -[NTKOlympusTimeContentView layer](self->_overlayContentView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMasksToBounds:", 1);

    -[NTKOlympusTimeContentView clipsToBounds](self->_overlayContentView, "clipsToBounds");
    -[NTKOlympusTimeContentView setOverrideDate:duration:](self->_overlayContentView, "setOverrideDate:duration:", self->_date, 0.0);
    -[NTKOlympusTimeContentView setDelegate:](self->_overlayContentView, "setDelegate:", self);
    -[NTKOlympusTimeView applyWindrunnerMaskWithDate:](self, "applyWindrunnerMaskWithDate:", self->_date);
    overlayContentView = self->_overlayContentView;
  }
  -[NTKOlympusTimeContentView superview](overlayContentView, "superview");
  v9 = (NTKOlympusTimeView *)objc_claimAutoreleasedReturnValue();

  if (v9 != self)
  {
    v10 = self->_overlayContentView;
    if (self->_contentView)
      -[NTKOlympusTimeView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v10);
    else
      -[NTKOlympusTimeView addSubview:](self, "addSubview:", v10);
  }
}

- (void)prepareForEditing
{
  -[NTKOlympusTimeContentView prepareForEditing](self->_contentView, "prepareForEditing");
  -[NTKOlympusTimeContentView prepareForEditing](self->_overlayContentView, "prepareForEditing");
}

- (void)cleanupAfterEditing
{
  -[NTKOlympusTimeContentView cleanupAfterEditing](self->_contentView, "cleanupAfterEditing");
  -[NTKOlympusTimeContentView cleanupAfterEditing](self->_overlayContentView, "cleanupAfterEditing");
}

- (void)setupViewsForCurrentState:(BOOL)a3
{
  NTKOlympusTimeContentView *contentView;
  NTKOlympusTimeContentView *overlayContentView;
  id v7;

  if (!a3)
    -[NTKOlympusTimeView createAndRemoveViewsForCurrentStateIfNeeded](self, "createAndRemoveViewsForCurrentStateIfNeeded");
  contentView = self->_contentView;
  if (contentView)
  {
    -[NTKOlympusTimeContentView setDial:](contentView, "setDial:", self->_currentDial);
    -[NTKOlympusTimeContentView setColorPalette:](self->_contentView, "setColorPalette:", self->_currentColorPalette);
    -[NTKOlympusTimeContentView setStyle:](self->_contentView, "setStyle:", self->_currentStyle);
    if (!a3)
      -[NTKOlympusTimeContentView cleanupAfterEditing](self->_contentView, "cleanupAfterEditing");
  }
  overlayContentView = self->_overlayContentView;
  if (overlayContentView)
  {
    -[NTKOlympusTimeContentView setDial:](overlayContentView, "setDial:", self->_currentDial);
    -[NTKOlympusTimeContentView setColorPalette:](self->_overlayContentView, "setColorPalette:", self->_currentColorPalette);
    -[NTKOlympusTimeContentView setStyle:](self->_overlayContentView, "setStyle:", self->_currentStyle);
    if (!a3)
      -[NTKOlympusTimeContentView cleanupAfterEditing](self->_overlayContentView, "cleanupAfterEditing");
  }
  if (!-[NTKOlympusTimeView _hasWindrunnerWedge](self, "_hasWindrunnerWedge"))
  {
    -[NTKOlympusTimeContentView layer](self->_overlayContentView, "layer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMask:", 0);

  }
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  -[NTKOlympusTimeContentView layer](self->_overlayContentView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

  }
  else
  {

    if (a4 - 1 < 2 || a5 - 1 <= 1)
      -[NTKOlympusTimeView applyWindrunnerMaskWithDate:force:](self, "applyWindrunnerMaskWithDate:force:", self->_date, 1);
  }
  -[NTKOlympusTimeContentView applyTransitionFraction:fromStyle:toStyle:](self->_overlayContentView, "applyTransitionFraction:fromStyle:toStyle:", a4, a5, a3);
  -[NTKOlympusTimeContentView applyTransitionFraction:fromStyle:toStyle:](self->_contentView, "applyTransitionFraction:fromStyle:toStyle:", a4, a5, a3);
  v11 = 0.0;
  if (a4)
    v12 = 1.0;
  else
    v12 = 0.0;
  v13 = 1.0 - a3;
  if (a5)
    v13 = v12;
  if (a5 | a4)
    v11 = v13;
  -[NTKOlympusTimeContentView setAlpha:](self->_overlayContentView, "setAlpha:", v11);
}

- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 animateElements:(BOOL)a6
{
  _BOOL8 v6;
  NTKOlympusTimeContentView *contentView;
  id v11;
  id v12;

  v6 = a6;
  contentView = self->_contentView;
  v11 = a5;
  v12 = a4;
  -[NTKOlympusTimeContentView applyTransitionFraction:fromColorPalette:toColorPalette:animateElements:](contentView, "applyTransitionFraction:fromColorPalette:toColorPalette:animateElements:", v12, v11, v6, a3);
  -[NTKOlympusTimeContentView applyTransitionFraction:fromColorPalette:toColorPalette:animateElements:](self->_overlayContentView, "applyTransitionFraction:fromColorPalette:toColorPalette:animateElements:", v12, v11, v6, a3);

}

- (void)applyTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5
{
  -[NTKOlympusTimeContentView applyTransitionFraction:fromDial:toDial:](self->_contentView, "applyTransitionFraction:fromDial:toDial:");
  -[NTKOlympusTimeContentView applyTransitionFraction:fromDial:toDial:](self->_overlayContentView, "applyTransitionFraction:fromDial:toDial:", a4, a5, a3);
}

- (void)animateClockHandsFromDate:(id)a3 toDate:(id)a4 duration:(double)a5
{
  -[NTKOlympusTimeView applyWindrunnerMaskWithDate:](self, "applyWindrunnerMaskWithDate:", a4, a5);
}

- (double)shortestPathBetweenStartAngle:(double)a3 targetAngle:(double)a4
{
  double result;
  double v5;
  double v6;

  result = a4 - a3;
  v5 = -result;
  if (result >= 0.0)
    v5 = result;
  if (v5 > 180.0)
  {
    v6 = 180.0 - (v5 + -180.0);
    if (result < 0.0)
      return v6;
    else
      return -v6;
  }
  return result;
}

- (void)applyWindrunnerMaskWithDate:(id)a3
{
  -[NTKOlympusTimeView applyWindrunnerMaskWithDate:force:](self, "applyWindrunnerMaskWithDate:force:", a3, 0);
}

- (void)applyWindrunnerMaskWithDate:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v4 = a4;
  v14 = a3;
  if (-[NTKOlympusTimeView canUpdateWindrunnerMask](self, "canUpdateWindrunnerMask") || v4)
  {
    v6 = NTKDateHourIn12HourTime(v14);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "component:fromDate:", 64, v14);

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "component:fromDate:", 128, v14);

    self->_maskingPathStartsFromHourHand = -[NTKOlympusTimeView _maskingPathStartsFromHourHandForDate:](self, "_maskingPathStartsFromHourHandForDate:", v14);
    +[NTKOlympusMask angleForHour:minutes:](NTKOlympusMask, "angleForHour:minutes:", v6, v8);
    v12 = v11;
    +[NTKOlympusMask angleForMinute:seconds:](NTKOlympusMask, "angleForMinute:seconds:", v8, v10);
    -[NTKOlympusTimeView applyWindrunnerMaskWithHourAngle:minuteAngle:](self, "applyWindrunnerMaskWithHourAngle:minuteAngle:", v12, v13);
  }

}

- (void)updateMaskingPathStartPointWithNewHourAngle:(double)a3 newMinuteAngle:(double)a4
{
  double v7;
  _BOOL4 v8;
  double v9;

  -[NTKOlympusTimeView _calculateDeviationBetweenHourAngle:minuteAngle:](self, "_calculateDeviationBetweenHourAngle:minuteAngle:", self->_hourHandAngle, self->_minuteHandAngle);
  v8 = v7 >= 180.0;
  -[NTKOlympusTimeView _calculateDeviationBetweenHourAngle:minuteAngle:](self, "_calculateDeviationBetweenHourAngle:minuteAngle:", a3, a4);
  if (((v8 ^ (v9 < 180.0)) & 1) == 0 && (v9 < 100.0 || v9 > 260.0))
    self->_maskingPathStartsFromHourHand ^= 1u;
}

- (void)applyWindrunnerMaskWithHourAngle:(double)a3 minuteAngle:(double)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  void *v14;
  void *v15;
  double minuteHandAngle;
  double hourHandAngle;

  -[NTKOlympusTimeView overlayContentView](self, "overlayContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  if (self->_hourHandAngle != a3 || self->_minuteHandAngle != a4)
    goto LABEL_9;
  if (v9 != self->_maskingSize.width || v11 != self->_maskingSize.height)
    goto LABEL_9;
  -[NTKOlympusTimeView overlayContentView](self, "overlayContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mask");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_9:
    self->_hourHandAngle = a3;
    self->_minuteHandAngle = a4;
    self->_maskingSize.width = v9;
    self->_maskingSize.height = v11;
    minuteHandAngle = self->_minuteHandAngle;
    if (self->_maskingPathStartsFromHourHand)
      hourHandAngle = self->_hourHandAngle;
    else
      hourHandAngle = self->_minuteHandAngle;
    if (!self->_maskingPathStartsFromHourHand)
      minuteHandAngle = self->_hourHandAngle;
    -[NTKOlympusTimeView applyWindrunnerMaskStartAngle:endAngle:](self, "applyWindrunnerMaskStartAngle:endAngle:", hourHandAngle, minuteHandAngle);
  }
}

- (void)applyWindrunnerMaskStartAngle:(double)a3 endAngle:(double)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;

  -[NTKOlympusTimeView overlayContentView](self, "overlayContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  CGRectGetWidth(v19);
  v20.origin.x = v7;
  v20.origin.y = v9;
  v20.size.width = v11;
  v20.size.height = v13;
  CGRectGetHeight(v20);
  MEMORY[0x1BCCA72B8](v7, v9, v11, v13);
  +[NTKOlympusMask clippingPathFromCenterPoint:startAngle:endAngle:radius:](NTKOlympusMask, "clippingPathFromCenterPoint:startAngle:endAngle:radius:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_retainAutorelease(v14);
  objc_msgSend(v15, "setPath:", objc_msgSend(v18, "CGPath"));
  -[NTKOlympusTimeView overlayContentView](self, "overlayContentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMask:", v15);

}

- (double)_calculateDeviationBetweenHourAngle:(double)a3 minuteAngle:(double)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;

  +[NTKOlympusMask normalizeAngle:](NTKOlympusMask, "normalizeAngle:", a3);
  v6 = v5;
  +[NTKOlympusMask normalizeAngle:](NTKOlympusMask, "normalizeAngle:", a4);
  v8 = v7 - v6;
  if (v8 < 0.0)
    v8 = v8 + 360.0;
  v9 = v8;
  return floorf(v9);
}

- (BOOL)_hasWindrunnerWedge
{
  return self->_currentStyle - 1 < 2;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)&self->_date, a3);
  v7 = a3;
  -[NTKOlympusTimeView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOverrideDate:duration:", v7, a4);

  -[NTKOlympusTimeView overlayContentView](self, "overlayContentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOverrideDate:duration:", v7, a4);

}

- (void)setTimeOffset:(double)a3
{
  void *v5;
  id v6;

  -[NTKOlympusTimeView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeOffset:", a3);

  -[NTKOlympusTimeView overlayContentView](self, "overlayContentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeOffset:", a3);

}

- (void)olympusContentViewDidHandleLogoHighlighted:(id)a3
{
  NTKOlympusTimeContentView *overlayContentView;

  overlayContentView = self->_overlayContentView;
  if (overlayContentView == a3)
    overlayContentView = self->_contentView;
  -[NTKOlympusTimeContentView setLogoButtonHighlighted:](overlayContentView, "setLogoButtonHighlighted:", 1);
}

- (void)olympusContentViewDidHandleLogoResetHighlight:(id)a3
{
  NTKOlympusTimeContentView *overlayContentView;

  overlayContentView = self->_overlayContentView;
  if (overlayContentView == a3)
    overlayContentView = self->_contentView;
  -[NTKOlympusTimeContentView setLogoButtonHighlighted:](overlayContentView, "setLogoButtonHighlighted:", 0);
}

- (void)olympusContentView:(id)a3 didHandleLogoTouchUpInsideFromRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  NTKOlympusTimeContentView *overlayContentView;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  overlayContentView = self->_overlayContentView;
  if (overlayContentView == a3)
    overlayContentView = self->_contentView;
  -[NTKOlympusTimeContentView setLogoButtonHighlighted:](overlayContentView, "setLogoButtonHighlighted:", 0);
  -[NTKOlympusTimeView openVictoryAppFromRect:](self, "openVictoryAppFromRect:", x, y, width, height);
}

- (void)openVictoryAppFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NTKOlympusTimeView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "olympusView:didTapAppLogoFromRect:", self, x, y, width, height);

}

- (BOOL)_maskingPathStartsFromHourHandForDate:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  char v8;
  BOOL v9;

  v3 = a3;
  NTKStartOfDayForDate(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v8 = -1;
  do
  {
    v6 = v6 + 3927.27273;
    ++v8;
  }
  while (v6 < v7);
  v9 = v8 & 1;

  return v9;
}

- (BOOL)isFrozen
{
  return self->frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->frozen = a3;
}

- (NTKOlympusViewDelegate)delegate
{
  return (NTKOlympusViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (double)hourHandAngle
{
  return self->_hourHandAngle;
}

- (void)setHourHandAngle:(double)a3
{
  self->_hourHandAngle = a3;
}

- (double)minuteHandAngle
{
  return self->_minuteHandAngle;
}

- (void)setMinuteHandAngle:(double)a3
{
  self->_minuteHandAngle = a3;
}

- (unint64_t)currentStyle
{
  return self->_currentStyle;
}

- (unint64_t)currentDial
{
  return self->_currentDial;
}

- (NTKOlympusColorPalette)currentColorPalette
{
  return self->_currentColorPalette;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NTKOlympusTimeContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (NTKOlympusTimeContentView)overlayContentView
{
  return self->_overlayContentView;
}

- (void)setOverlayContentView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayContentView, a3);
}

- (BOOL)maskingPathStartsFromHourHand
{
  return self->_maskingPathStartsFromHourHand;
}

- (void)setMaskingPathStartsFromHourHand:(BOOL)a3
{
  self->_maskingPathStartsFromHourHand = a3;
}

- (BOOL)useSmallFont
{
  return self->_useSmallFont;
}

- (void)setUseSmallFont:(BOOL)a3
{
  self->_useSmallFont = a3;
}

- (UIImage)circularLogoImage
{
  return self->_circularLogoImage;
}

- (void)setCircularLogoImage:(id)a3
{
  objc_storeStrong((id *)&self->_circularLogoImage, a3);
}

- (CGSize)maskingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maskingSize.width;
  height = self->_maskingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaskingSize:(CGSize)a3
{
  self->_maskingSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularLogoImage, 0);
  objc_storeStrong((id *)&self->_overlayContentView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
