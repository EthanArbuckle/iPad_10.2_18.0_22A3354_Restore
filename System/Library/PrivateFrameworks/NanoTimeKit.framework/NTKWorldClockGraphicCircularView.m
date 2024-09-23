@implementation NTKWorldClockGraphicCircularView

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_101);
}

void __46__NTKWorldClockGraphicCircularView_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.898039222, 0.898039222, 0.898039222, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LegacyDefaultDaytimeBackgroundColor;
  LegacyDefaultDaytimeBackgroundColor = v0;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.100000001, 1.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)LegacyDefaultNighttimeBackgroundColor;
  LegacyDefaultNighttimeBackgroundColor = v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.75);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)LegacyDefaultDaytimeLargeTickColor;
  LegacyDefaultDaytimeLargeTickColor = v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.75);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)LegacyDefaultDaytimeSmallTickColor;
  LegacyDefaultDaytimeSmallTickColor = v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.75);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)LegacyDefaultNighttimeLargeTickColor;
  LegacyDefaultNighttimeLargeTickColor = v8;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.75);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)LegacyDefaultNighttimeSmallTickColor;
  LegacyDefaultNighttimeSmallTickColor = v10;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.949019611, 1.0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)GossamerDefaultDaytimeBackgroundColor;
  GossamerDefaultDaytimeBackgroundColor = v12;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.100000001, 1.0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)GossamerDefaultNighttimeBackgroundColor;
  GossamerDefaultNighttimeBackgroundColor = v14;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)GossamerDefaultDaytimeLargeTickColor;
  GossamerDefaultDaytimeLargeTickColor = v16;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.75);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)GossamerDefaultDaytimeSmallTickColor;
  GossamerDefaultDaytimeSmallTickColor = v18;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)GossamerDefaultNighttimeLargeTickColor;
  GossamerDefaultNighttimeLargeTickColor = v20;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.75);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)GossamerDefaultNighttimeSmallTickColor;
  GossamerDefaultNighttimeSmallTickColor = v22;

}

+ (id)northLabelNumber
{
  return &unk_1E6C9F0A0;
}

+ (id)eastLabelNumber
{
  return &unk_1E6C9F0B8;
}

+ (id)southLabelNumber
{
  return &unk_1E6C9F0D0;
}

+ (id)westLabelNumber
{
  return &unk_1E6C9F0E8;
}

- (void)applyConfiguration:(id)a3 animated:(BOOL)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v22 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "transitInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView setTransitInfo:](self, "setTransitInfo:");
  objc_msgSend(v5, "labelText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v24, "length");
  -[NTKWorldClockGraphicCircularView cityNameLabel](self, "cityNameLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v23, "length");
  objc_msgSend(v7, "setHidden:", v6 == 0);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[NTKWorldClockGraphicCircularView hourLabels](self, "hourLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((v6 != 0) != objc_msgSend(v13, "isHidden"))
          objc_msgSend(v13, "setHidden:", v6 != 0);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "setText:", v24);
  if (v6 != v21)
    -[NTKWorldClockGraphicCircularView setNeedsLayout](self, "setNeedsLayout");
  -[NTKWorldClockGraphicCircularView handsView](self, "handsView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "secondHandView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isHidden");
  v17 = objc_msgSend(v5, "inTritium");
  if (v16 != (_DWORD)v17)
    objc_msgSend(v15, "setHidden:", v17);
  objc_msgSend(v5, "timeZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimeZone:", v18);
  objc_msgSend(v5, "overrideDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0.300000012;
  if (!v22)
    v20 = 0.0;
  objc_msgSend(v14, "setOverrideDate:duration:", v19, v20);
  objc_msgSend(v14, "setHidden:", objc_msgSend(v5, "isPrivacy"));
  -[NTKWorldClockGraphicCircularView _updateUI](self, "_updateUI");

}

- (void)dealloc
{
  objc_super v3;

  -[NTKWorldClockGraphicCircularView _stopClockUpdates](self, "_stopClockUpdates");
  v3.receiver = self;
  v3.super_class = (Class)NTKWorldClockGraphicCircularView;
  -[NTKWorldClockGraphicCircularView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  CGFloat v50;
  double v51;
  void *v52;
  double Width;
  double Height;
  double v55;
  void *v56;
  double MidX;
  double MidY;
  double v59;
  void *v60;
  objc_super v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v61.receiver = self;
  v61.super_class = (Class)NTKWorldClockGraphicCircularView;
  -[NTKWorldClockGraphicCircularView layoutSubviews](&v61, sel_layoutSubviews);
  -[NTKWorldClockGraphicCircularView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NTKWorldClockGraphicCircularView platter](self, "platter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView handsView](self, "handsView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62.origin.x = v4;
  v62.origin.y = v6;
  v62.size.width = v8;
  v62.size.height = v10;
  if (CGRectIsNull(v62))
    goto LABEL_4;
  v63.origin.x = v4;
  v63.origin.y = v6;
  v63.size.width = v8;
  v63.size.height = v10;
  if (CGRectIsEmpty(v63)
    || (v64.origin.x = v4, v64.origin.y = v6, v64.size.width = v8, v64.size.height = v10, CGRectIsInfinite(v64)))
  {
LABEL_4:
    -[NTKWorldClockGraphicCircularView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", 0.0);

    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = v4;
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    objc_msgSend(v11, "setBounds:", *MEMORY[0x1E0C9D648], v15, v17, v18);
    v19 = v18;
    v4 = v16;
    objc_msgSend(v12, "setBounds:", v14, v15, v17, v19);
  }
  else
  {
    v70.origin.x = v4;
    v70.origin.y = v6;
    v70.size.width = v8;
    v70.size.height = v10;
    Width = CGRectGetWidth(v70);
    v71.origin.x = v4;
    v71.origin.y = v6;
    v71.size.width = v8;
    v71.size.height = v10;
    Height = CGRectGetHeight(v71);
    if (Width < Height)
      Height = Width;
    v55 = Height * 0.5;
    -[NTKWorldClockGraphicCircularView layer](self, "layer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setCornerRadius:", v55);

    v72.origin.x = v4;
    v72.origin.y = v6;
    v72.size.width = v8;
    v72.size.height = v10;
    MidX = CGRectGetMidX(v72);
    v73.origin.x = v4;
    v73.origin.y = v6;
    v73.size.width = v8;
    v73.size.height = v10;
    MidY = CGRectGetMidY(v73);
    objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
    objc_msgSend(v11, "setCenter:", MidX, MidY);
    objc_msgSend(v12, "setBounds:", v4, v6, v8, v10);
    objc_msgSend(v12, "setCenter:", MidX, MidY);
  }
  -[NTKWorldClockGraphicCircularView layoutConstants](self, "layoutConstants");
  -[NTKWorldClockGraphicCircularView dialView](self, "dialView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView device](self, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  CLKSizeCenteredInRectForDevice();
  objc_msgSend(v20, "setFrame:");

  v22 = -[NTKWorldClockGraphicCircularView positionLabelNorthSide](self, "positionLabelNorthSide");
  v23 = 16;
  if (v22)
    v23 = 8;
  v24 = *(double *)((char *)&self->_layoutConstants.cityNameFontSize + v23);
  -[NTKWorldClockGraphicCircularView cityNameLabel](self, "cityNameLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "text");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");
  v28 = objc_msgSend(v25, "isHidden");
  v60 = v12;
  if (v27)
  {
    if (v28)
      objc_msgSend(v25, "setHidden:", 0);
    v29 = v11;
    objc_msgSend(v25, "sizeToFit");
    -[UILabel frame](self->_cityNameLabel, "frame");
    -[NTKWorldClockGraphicCircularView device](self, "device");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRectCenteredXInRectForDevice();
    v32 = v31;
    v34 = v33;
    v36 = v35;

    objc_msgSend(v25, "_lastLineBaseline");
    objc_msgSend(v25, "setFrame:", v32, v24 - v37, v34, v36);
  }
  else
  {
    v29 = v11;
    if ((v28 & 1) == 0)
      objc_msgSend(v25, "setHidden:", 1);
  }
  v65.origin.x = v4;
  v65.origin.y = v6;
  v65.size.width = v8;
  v65.size.height = v10;
  v38 = CGRectGetMidX(v65);
  v66.origin.x = v4;
  v66.origin.y = v6;
  v66.size.width = v8;
  v66.size.height = v10;
  v59 = CGRectGetMidY(v66);
  -[NTKWorldClockGraphicCircularView device](self, "device");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView northHourLabel](self, "northHourLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "font");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "ascender");
  objc_msgSend(v41, "capHeight");
  v42 = v10;
  v43 = v8;
  v44 = v6;
  v45 = v4;
  objc_msgSend(v41, "descender");
  -[NTKWorldClockGraphicCircularView northHourLabel](self, "northHourLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRoundForDevice();
  objc_msgSend(v46, "setCenter:", v38, 0.0 - v47);
  -[NTKWorldClockGraphicCircularView eastHourLabel](self, "eastHourLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v67.origin.x = v4;
  v67.origin.y = v44;
  v67.size.width = v43;
  v67.size.height = v42;
  objc_msgSend(v48, "setCenter:", CGRectGetMaxY(v67) - 0.0, v59);
  -[NTKWorldClockGraphicCircularView southHourLabel](self, "southHourLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v68.origin.x = v4;
  v68.origin.y = v44;
  v68.size.width = v43;
  v68.size.height = v42;
  v50 = CGRectGetMaxY(v68) - 0.0;
  CLKRoundForDevice();
  objc_msgSend(v49, "setCenter:", v38, v50 - v51);
  -[NTKWorldClockGraphicCircularView westHourLabel](self, "westHourLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v69.origin.x = v45;
  v69.origin.y = v44;
  v69.size.width = v43;
  v69.size.height = v42;
  objc_msgSend(v52, "setCenter:", CGRectGetMinX(v69) + 0.0, v59);

}

- (UIColor)daytimeBackgroundColor
{
  UIColor **p_daytimeBackgroundColor;
  uint64_t *v3;

  p_daytimeBackgroundColor = &self->_daytimeBackgroundColor;
  if (!self->_daytimeBackgroundColor)
  {
    if (self->_showGossamerUI)
      v3 = &GossamerDefaultDaytimeBackgroundColor;
    else
      v3 = &LegacyDefaultDaytimeBackgroundColor;
    objc_storeStrong((id *)&self->_daytimeBackgroundColor, (id)*v3);
  }
  return *p_daytimeBackgroundColor;
}

- (void)setDaytimeBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_daytimeBackgroundColor, a3);
  if (-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
    -[NTKWorldClockGraphicCircularView _updatePlatterColor](self, "_updatePlatterColor");
}

- (UIColor)daytimeHandsColor
{
  UIColor *daytimeHandsColor;
  UIColor *v4;
  UIColor *v5;

  daytimeHandsColor = self->_daytimeHandsColor;
  if (!daytimeHandsColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_daytimeHandsColor;
    self->_daytimeHandsColor = v4;

    daytimeHandsColor = self->_daytimeHandsColor;
  }
  return daytimeHandsColor;
}

- (void)setDaytimeHandsColor:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_daytimeHandsColor, a3);
  if (-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
  {
    -[CLKUIAnalogHandsView hourHandView](self->_handsView, "hourHandView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColor:", v7);

    -[CLKUIAnalogHandsView minuteHandView](self->_handsView, "minuteHandView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColor:", v7);

  }
}

- (UIColor)daytimeSecondHandColor
{
  UIColor *daytimeSecondHandColor;
  UIColor *v4;
  UIColor *v5;

  daytimeSecondHandColor = self->_daytimeSecondHandColor;
  if (!daytimeSecondHandColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_daytimeSecondHandColor;
    self->_daytimeSecondHandColor = v4;

    daytimeSecondHandColor = self->_daytimeSecondHandColor;
  }
  return daytimeSecondHandColor;
}

- (void)setDaytimeSecondHandColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_daytimeSecondHandColor, a3);
  if (-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
  {
    -[CLKUIAnalogHandsView secondHandView](self->_handsView, "secondHandView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColor:", v6);

  }
}

- (UIColor)nighttimeBackgroundColor
{
  UIColor **p_nighttimeBackgroundColor;
  uint64_t *v3;

  p_nighttimeBackgroundColor = &self->_nighttimeBackgroundColor;
  if (!self->_nighttimeBackgroundColor)
  {
    if (self->_showGossamerUI)
      v3 = &GossamerDefaultNighttimeBackgroundColor;
    else
      v3 = &LegacyDefaultNighttimeBackgroundColor;
    objc_storeStrong((id *)&self->_nighttimeBackgroundColor, (id)*v3);
  }
  return *p_nighttimeBackgroundColor;
}

- (void)setNighttimeBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_nighttimeBackgroundColor, a3);
  if (!-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
    -[NTKWorldClockGraphicCircularView _updatePlatterColor](self, "_updatePlatterColor");
}

- (UIColor)nighttimeHandsColor
{
  UIColor *nighttimeHandsColor;
  UIColor *v4;
  UIColor *v5;

  nighttimeHandsColor = self->_nighttimeHandsColor;
  if (!nighttimeHandsColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_nighttimeHandsColor;
    self->_nighttimeHandsColor = v4;

    nighttimeHandsColor = self->_nighttimeHandsColor;
  }
  return nighttimeHandsColor;
}

- (void)setNighttimeHandsColor:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_nighttimeHandsColor, a3);
  if (!-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
  {
    -[CLKUIAnalogHandsView hourHandView](self->_handsView, "hourHandView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColor:", v7);

    -[CLKUIAnalogHandsView minuteHandView](self->_handsView, "minuteHandView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColor:", v7);

  }
}

- (UIColor)nighttimeSecondHandColor
{
  UIColor *nighttimeSecondHandColor;
  UIColor *v4;
  UIColor *v5;

  nighttimeSecondHandColor = self->_nighttimeSecondHandColor;
  if (!nighttimeSecondHandColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_nighttimeSecondHandColor;
    self->_nighttimeSecondHandColor = v4;

    nighttimeSecondHandColor = self->_nighttimeSecondHandColor;
  }
  return nighttimeSecondHandColor;
}

- (void)setNighttimeSecondHandColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_nighttimeSecondHandColor, a3);
  if (!-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
  {
    -[CLKUIAnalogHandsView secondHandView](self->_handsView, "secondHandView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColor:", v6);

  }
}

- (UIColor)daytimeHandsLargeTickColor
{
  UIColor **p_daytimeHandsLargeTickColor;
  uint64_t *v3;

  p_daytimeHandsLargeTickColor = &self->_daytimeHandsLargeTickColor;
  if (!self->_daytimeHandsLargeTickColor)
  {
    if (self->_showGossamerUI)
      v3 = &GossamerDefaultDaytimeLargeTickColor;
    else
      v3 = &LegacyDefaultDaytimeLargeTickColor;
    objc_storeStrong((id *)&self->_daytimeHandsLargeTickColor, (id)*v3);
  }
  return *p_daytimeHandsLargeTickColor;
}

- (void)setDaytimeHandsLargeTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_daytimeHandsLargeTickColor, a3);
  if (-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
  {
    -[NTKWorldClockGraphicCircularView _updateHourLabelColors](self, "_updateHourLabelColors");
    -[NTKWorldClockGraphicCircularView _updateTickColor](self, "_updateTickColor");
  }
}

- (UIColor)daytimeHandsSmallTickColor
{
  UIColor **p_daytimeHandsSmallTickColor;
  uint64_t *v3;

  p_daytimeHandsSmallTickColor = &self->_daytimeHandsSmallTickColor;
  if (!self->_daytimeHandsSmallTickColor)
  {
    if (self->_showGossamerUI)
      v3 = &GossamerDefaultDaytimeSmallTickColor;
    else
      v3 = &LegacyDefaultDaytimeSmallTickColor;
    objc_storeStrong((id *)&self->_daytimeHandsSmallTickColor, (id)*v3);
  }
  return *p_daytimeHandsSmallTickColor;
}

- (void)setDaytimeHandsSmallTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_daytimeHandsSmallTickColor, a3);
  if (-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
    -[NTKWorldClockGraphicCircularView _updateTickColor](self, "_updateTickColor");
}

- (UIColor)nighttimeHandsLargeTickColor
{
  UIColor **p_nighttimeHandsLargeTickColor;
  uint64_t *v3;

  p_nighttimeHandsLargeTickColor = &self->_nighttimeHandsLargeTickColor;
  if (!self->_nighttimeHandsLargeTickColor)
  {
    if (self->_showGossamerUI)
      v3 = &GossamerDefaultNighttimeLargeTickColor;
    else
      v3 = &LegacyDefaultNighttimeLargeTickColor;
    objc_storeStrong((id *)&self->_nighttimeHandsLargeTickColor, (id)*v3);
  }
  return *p_nighttimeHandsLargeTickColor;
}

- (void)setNighttimeHandsLargeTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_nighttimeHandsLargeTickColor, a3);
  if (!-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
  {
    -[NTKWorldClockGraphicCircularView _updateHourLabelColors](self, "_updateHourLabelColors");
    -[NTKWorldClockGraphicCircularView _updateTickColor](self, "_updateTickColor");
  }
}

- (UIColor)nighttimeHandsSmallTickColor
{
  UIColor **p_nighttimeHandsSmallTickColor;
  uint64_t *v3;

  p_nighttimeHandsSmallTickColor = &self->_nighttimeHandsSmallTickColor;
  if (!self->_nighttimeHandsSmallTickColor)
  {
    if (self->_showGossamerUI)
      v3 = &GossamerDefaultNighttimeSmallTickColor;
    else
      v3 = &LegacyDefaultNighttimeSmallTickColor;
    objc_storeStrong((id *)&self->_nighttimeHandsSmallTickColor, (id)*v3);
  }
  return *p_nighttimeHandsSmallTickColor;
}

- (void)setNighttimeHandsSmallTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_nighttimeHandsSmallTickColor, a3);
  if (!-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
    -[NTKWorldClockGraphicCircularView _updateTickColor](self, "_updateTickColor");
}

- (void)setTintedFraction:(double)a3
{
  double v3;

  v3 = fmin(fmax(a3, 0.0), 1.0);
  if (self->_tintedFraction != v3)
  {
    self->_tintedFraction = v3;
    -[NTKWorldClockGraphicCircularView _updatePlatterColor](self, "_updatePlatterColor");
    -[NTKWorldClockGraphicCircularView _updateCityAbbreviationColor](self, "_updateCityAbbreviationColor");
    -[NTKWorldClockGraphicCircularView _updateHourLabelColors](self, "_updateHourLabelColors");
    -[NTKWorldClockGraphicCircularView _updateTickColor](self, "_updateTickColor");
    -[NTKWorldClockGraphicCircularView _updateHandsColor](self, "_updateHandsColor");
  }
}

- (void)setTintedPlatterColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_tintedPlatterColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tintedPlatterColor, a3);
    -[NTKWorldClockGraphicCircularView _updatePlatterColor](self, "_updatePlatterColor");
  }

}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NTKWorldClockGraphicCircularView initWithDevice:smallTickCount:](self, "initWithDevice:smallTickCount:", a3, 2);
}

- (NTKWorldClockGraphicCircularView)initWithDevice:(id)a3 smallTickCount:(unint64_t)a4
{
  id v7;
  NTKWorldClockGraphicCircularView *v8;
  NTKWorldClockGraphicCircularView *v9;
  void *v10;
  CGSize v11;
  __int128 v12;
  __int128 v13;
  UIView *v14;
  UIView *platter;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NTKRichComplicationDialView *v20;
  NTKRichComplicationDialView *dialView;
  UILabel *v22;
  double v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  UILabel *cityNameLabel;
  void *v28;
  void *v29;
  id *v30;
  id v31;
  void (**v32)(void *, void *);
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  id v54;
  UILabel *v55;
  NTKRichComplicationDialView *v56;
  void *v57;
  UIView *v58;
  _QWORD aBlock[4];
  id v60;
  id *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  CGSize v66;
  CGSize v67;
  objc_super v68;
  _QWORD v69[6];

  v69[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v68.receiver = self;
  v68.super_class = (Class)NTKWorldClockGraphicCircularView;
  v8 = -[NTKWorldClockGraphicCircularView initWithFrame:](&v68, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_showGossamerUI = NTKShowGossamerUI(v7);
    v66 = (CGSize)0;
    v67 = (CGSize)0;
    v64 = 0u;
    v65 = 0u;
    v63 = 0u;
    v10 = (void *)objc_opt_class();
    if (v10)
    {
      objc_msgSend(v10, "_layoutConstantsForDevice:", v7);
    }
    else
    {
      v66 = (CGSize)0;
      v67 = (CGSize)0;
      v64 = 0u;
      v65 = 0u;
      v63 = 0u;
    }
    *(_OWORD *)&v9->_layoutConstants.cityNameFontSize = v63;
    v11 = v67;
    v13 = v64;
    v12 = v65;
    v9->_layoutConstants.majorTickSize = v66;
    v9->_layoutConstants.minorTickSize = v11;
    *(_OWORD *)&v9->_layoutConstants.cityNameBaselineOffsetSouthSide = v13;
    *(_OWORD *)&v9->_layoutConstants.hourInset = v12;
    -[NTKWorldClockGraphicCircularView setClipsToBounds:](v9, "setClipsToBounds:", 1);
    v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NTKWorldClockGraphicCircularView addSubview:](v9, "addSubview:", v14);
    platter = v9->_platter;
    v9->_platter = v14;
    v58 = v14;

    objc_msgSend((id)objc_opt_class(), "_createHandsViewForDevice:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKWorldClockGraphicCircularView daytimeHandsColor](v9, "daytimeHandsColor");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "minuteHandView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)v17;
    objc_msgSend(v18, "setColor:", v17);

    objc_msgSend(v16, "hourHandView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setColor:", v17);

    objc_storeStrong((id *)&v9->_handsView, v16);
    -[NTKWorldClockGraphicCircularView addSubview:](v9, "addSubview:", v9->_handsView);
    v20 = -[NTKRichComplicationDialView initWithLargeTickCount:smallTickCountPerLargeTick:largeTickSize:smallTickSize:dialRange:startAngle:]([NTKRichComplicationDialView alloc], "initWithLargeTickCount:smallTickCountPerLargeTick:largeTickSize:smallTickSize:dialRange:startAngle:", 12, a4, v9->_layoutConstants.majorTickSize.width, v9->_layoutConstants.majorTickSize.height, v9->_layoutConstants.minorTickSize.width, v9->_layoutConstants.minorTickSize.height, 6.28318531, 0.0);
    dialView = v9->_dialView;
    v9->_dialView = v20;
    v56 = v20;

    -[NTKWorldClockGraphicCircularView insertSubview:belowSubview:](v9, "insertSubview:belowSubview:", v9->_dialView, v9->_handsView);
    v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v23 = *MEMORY[0x1E0DC1448];
    v24 = (_QWORD *)MEMORY[0x1E0C940A8];
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], v9->_layoutConstants.cityNameFontSize, *MEMORY[0x1E0DC1448]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "CLKFontWithAlternativePunctuation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v22, "setFont:", v26);

    cityNameLabel = v9->_cityNameLabel;
    v9->_cityNameLabel = v22;
    v55 = v22;

    -[NTKWorldClockGraphicCircularView insertSubview:belowSubview:](v9, "insertSubview:belowSubview:", v9->_cityNameLabel, v9->_handsView);
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *v24, v9->_layoutConstants.hourFontSize, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "CLKFontWithAlternativePunctuation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__NTKWorldClockGraphicCircularView_initWithDevice_smallTickCount___block_invoke;
    aBlock[3] = &unk_1E6BD52D0;
    v60 = v29;
    v30 = v9;
    v61 = v30;
    v62 = v16;
    v54 = v16;
    v31 = v29;
    v32 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend((id)objc_opt_class(), "northLabelNumber");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2](v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v30[68];
    v30[68] = (id)v34;

    objc_msgSend(v30[68], "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAnchorPoint:", 0.5, 0.0);

    objc_msgSend((id)objc_opt_class(), "eastLabelNumber");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2](v32, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v30[69];
    v30[69] = (id)v38;

    objc_msgSend(v30[69], "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAnchorPoint:", 1.0, 0.5);

    objc_msgSend((id)objc_opt_class(), "southLabelNumber");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2](v32, v41);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v30[71];
    v30[71] = (id)v42;

    objc_msgSend(v30[71], "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setAnchorPoint:", 0.5, 1.0);

    objc_msgSend((id)objc_opt_class(), "westLabelNumber");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2](v32, v45);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = v30[70];
    v30[70] = (id)v46;

    objc_msgSend(v30[70], "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setAnchorPoint:", 0.0, 0.5);

    v69[0] = v30[68];
    v69[1] = v30[69];
    v69[2] = v30[71];
    v69[3] = v30[70];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 4);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v30[64];
    v30[64] = (id)v49;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.25);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v30[66];
    v30[66] = (id)v51;

    objc_msgSend(v30, "_updateUI");
  }

  return v9;
}

id __66__NTKWorldClockGraphicCircularView_initWithDevice_smallTickCount___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v4, "setFont:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setText:", v3);
  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(v4, "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "insertSubview:belowSubview:", v4, *(_QWORD *)(a1 + 48));

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKWorldClockGraphicCircularView;
  -[NTKWorldClockGraphicCircularView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[NTKWorldClockGraphicCircularView setNeedsLayout](self, "setNeedsLayout");
}

- (void)pauseLiveFullColorImageView
{
  id v3;

  -[NTKWorldClockGraphicCircularView handsView](self, "handsView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrozen:", 1);
  -[NTKWorldClockGraphicCircularView _stopClockUpdates](self, "_stopClockUpdates");

}

- (void)resumeLiveFullColorImageView
{
  id v3;

  -[NTKWorldClockGraphicCircularView handsView](self, "handsView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrozen:", 0);
  -[NTKWorldClockGraphicCircularView _startClockUpdates](self, "_startClockUpdates");
  -[NTKWorldClockGraphicCircularView _updateUI](self, "_updateUI");

}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  NTKWorldClockGraphicCircularViewConfiguration *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("NTKWorldClockGraphicCircularViewOverrideDateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v20, "tritium_isTritiumInactiveFullColorImageProvider");
      v8 = v6;
      v9 = v8;
LABEL_7:
      v11 = v8;
      goto LABEL_9;
    }
  }

  v7 = objc_msgSend(v20, "tritium_isTritiumInactiveFullColorImageProvider");
  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v8 = v10;
      v9 = v8;
      v7 = 1;
      goto LABEL_7;
    }
  }
  +[NTKDate faceDate](NTKDate, "faceDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
LABEL_9:
  +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "coordinate");
    v16 = v15;
    objc_msgSend(v14, "coordinate");
  }
  else
  {
    v16 = -180.0;
  }
  objc_msgSend(off_1E6BCA6B8, "transitInfoForDate:location:", v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NTKWorldClockGraphicCircularViewConfiguration initWithTimeZone:labelText:transitInfo:inTritium:overrideDate:isPrivacy:]([NTKWorldClockGraphicCircularViewConfiguration alloc], "initWithTimeZone:labelText:transitInfo:inTritium:overrideDate:isPrivacy:", v18, 0, v17, v7, v11, 0);
  -[NTKWorldClockGraphicCircularView applyConfiguration:animated:](self, "applyConfiguration:animated:", v19, NTKIsDaemonOrFaceSnapshotService() ^ 1);

}

- (void)setFilterProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_filterProvider, obj);
    -[NTKWorldClockGraphicCircularView handsView](self, "handsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilterProvider:", obj);

  }
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[NTKWorldClockGraphicCircularView setMonochromeFraction:](self, "setMonochromeFraction:", a3);
  -[NTKWorldClockGraphicCircularView _updatePlatterColor](self, "_updatePlatterColor");
  -[NTKWorldClockGraphicCircularView _updateCityAbbreviationColor](self, "_updateCityAbbreviationColor");
  -[NTKWorldClockGraphicCircularView _updateHourLabelColors](self, "_updateHourLabelColors");
  -[NTKWorldClockGraphicCircularView _updateTickColor](self, "_updateTickColor");
  -[NTKWorldClockGraphicCircularView _updateHandsColor](self, "_updateHandsColor");
}

- (void)updateMonochromeColor
{
  -[NTKWorldClockGraphicCircularView setMonochromeFraction:](self, "setMonochromeFraction:", 1.0);
  -[NTKWorldClockGraphicCircularView _updatePlatterColor](self, "_updatePlatterColor");
  -[NTKWorldClockGraphicCircularView _updateCityAbbreviationColor](self, "_updateCityAbbreviationColor");
  -[NTKWorldClockGraphicCircularView _updateHourLabelColors](self, "_updateHourLabelColors");
  -[NTKWorldClockGraphicCircularView _updateTickColor](self, "_updateTickColor");
  -[NTKWorldClockGraphicCircularView _updateHandsColor](self, "_updateHandsColor");
}

+ (id)_createHandsViewForDevice:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[NTKWorldClockRichComplicationHandsBaseView initForDevice:]([NTKWorldClockRichComplicationHandsView alloc], "initForDevice:", v3);

  return v4;
}

+ ($513C300AF4A6862D8B434F9A964F3546)_layoutConstantsForDevice:(SEL)a3
{
  $513C300AF4A6862D8B434F9A964F3546 *result;

  _LayoutConstantsCircular(a4, retstr);
  return result;
}

+ (BOOL)_shouldUseDaytimeColoringForTransitInfo:(id)a3 atDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  unint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v25;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "rise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    objc_msgSend(v5, "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v16 = objc_msgSend(v5, "constantSun") == 2;
LABEL_14:
      v20 = v16;
      goto LABEL_17;
    }
  }
  objc_msgSend(v5, "rise");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v5, "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v5, "rise");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v6, "compare:", v12);

      objc_msgSend(v5, "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v6, "compare:", v14);

      v16 = v13 < 2 && v15 == -1;
      goto LABEL_14;
    }
  }
  objc_msgSend(v5, "rise");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v5, "rise");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v6, "compare:", v18);

    v20 = v19 < 2;
    goto LABEL_17;
  }
  objc_msgSend(v5, "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v5, "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v6, "compare:", v22);

    v16 = v23 == -1;
    goto LABEL_14;
  }
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    +[NTKWorldClockGraphicCircularView _shouldUseDaytimeColoringForTransitInfo:atDate:].cold.1(v25);

  v20 = 1;
LABEL_17:

  return v20;
}

- (void)_startClockUpdates
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, id *);
  void *v8;
  id v9;
  id location;

  -[NTKWorldClockGraphicCircularView clockTimerToken](self, "clockTimerToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __54__NTKWorldClockGraphicCircularView__startClockUpdates__block_invoke;
    v8 = &unk_1E6BCED08;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 0, &v5, &__block_literal_global_73_1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKWorldClockGraphicCircularView setClockTimerToken:](self, "setClockTimerToken:", v3, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __54__NTKWorldClockGraphicCircularView__startClockUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateUI");

}

const __CFString *__54__NTKWorldClockGraphicCircularView__startClockUpdates__block_invoke_71()
{
  return CFSTR("World Clock Rich Circular Complication");
}

- (void)_stopClockUpdates
{
  void *v3;
  id v4;

  -[NTKWorldClockGraphicCircularView clockTimerToken](self, "clockTimerToken");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopUpdatesForToken:", v4);

    -[NTKWorldClockGraphicCircularView setClockTimerToken:](self, "setClockTimerToken:", 0);
  }

}

- (void)_updateDayTimeColoring
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = -[NTKWorldClockGraphicCircularView hasPerformedColoringFirstPass](self, "hasPerformedColoringFirstPass");
  -[NTKWorldClockGraphicCircularView handsView](self, "handsView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "overrideDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[NTKDate faceDate](NTKDate, "faceDate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  -[NTKWorldClockGraphicCircularView transitInfo](self, "transitInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend((id)objc_opt_class(), "_shouldUseDaytimeColoringForTransitInfo:atDate:", v8, v7);
  if (!v3 || (_DWORD)v9 != -[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
  {
    -[NTKWorldClockGraphicCircularView setUseDayTimeColoring:](self, "setUseDayTimeColoring:", v9);
    -[NTKWorldClockGraphicCircularView _updatePlatterColor](self, "_updatePlatterColor");
    -[NTKWorldClockGraphicCircularView _updateCityAbbreviationColor](self, "_updateCityAbbreviationColor");
    -[NTKWorldClockGraphicCircularView _updateHourLabelColors](self, "_updateHourLabelColors");
    -[NTKWorldClockGraphicCircularView _updateTickColor](self, "_updateTickColor");
    -[NTKWorldClockGraphicCircularView _updateHandsColor](self, "_updateHandsColor");
    -[NTKWorldClockGraphicCircularView setColoringFirstPassPerformed:](self, "setColoringFirstPassPerformed:", 1);
  }

}

- (BOOL)_updateLabelAndDial
{
  int64_t v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL4 v7;
  BOOL v8;

  v3 = -[NTKWorldClockRichComplicationHandsBaseView displayedHour](self->_handsView, "displayedHour");
  -[NTKWorldClockGraphicCircularView cityNameLabel](self, "cityNameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
    goto LABEL_8;
  v6 = -[NTKWorldClockRichComplicationHandsBaseView isHidden](self->_handsView, "isHidden");
  v7 = (unint64_t)(v3 - 3) < 6 || (unint64_t)(v3 - 15) < 6;
  if ((v6 & 1) != 0)
    v7 = 1;
  if (self->_positionLabelNorthSide != v7)
  {
    self->_positionLabelNorthSide = v7;
    v8 = 1;
  }
  else
  {
LABEL_8:
    v8 = 0;
  }

  return v8;
}

- (void)_updateUI
{
  -[NTKWorldClockGraphicCircularView _updateDayTimeColoring](self, "_updateDayTimeColoring");
  if (-[NTKWorldClockGraphicCircularView _updateLabelAndDial](self, "_updateLabelAndDial"))
    -[NTKWorldClockGraphicCircularView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateCityAbbreviationColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NTKWorldClockGraphicCircularView cityNameLabel](self, "cityNameLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView filterProvider](self, "filterProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorForView:accented:", v7, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView tintedFraction](self, "tintedFraction");
  NTKInterpolateBetweenColors(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

}

- (void)_updateHandsColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  _BOOL4 v18;
  double v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  double v23;

  -[NTKWorldClockGraphicCircularView handsView](self, "handsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView filterProvider](self, "filterProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
    -[NTKWorldClockGraphicCircularView daytimeHandsColor](self, "daytimeHandsColor");
  else
    -[NTKWorldClockGraphicCircularView nighttimeHandsColor](self, "nighttimeHandsColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorForView:accented:", v3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView monochromeFraction](self, "monochromeFraction");
  NTKInterpolateBetweenColors(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)objc_opt_class(), "showsSecondHand"))
  {
    objc_msgSend(v4, "colorForView:accented:", v3, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKWorldClockGraphicCircularView tintedFraction](self, "tintedFraction");
    NTKInterpolateBetweenColors(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secondHandView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v9);

    objc_msgSend(v4, "colorForView:accented:", v3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hourHandView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColor:", v11);

    objc_msgSend(v3, "minuteHandView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setColor:", v11);

  }
  else
  {
    objc_msgSend(v4, "colorForView:accented:", v3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKWorldClockGraphicCircularView tintedFraction](self, "tintedFraction");
    NTKInterpolateBetweenColors(v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hourHandView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setColor:", v11);

    objc_msgSend(v3, "minuteHandView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setColor:", v11);

    objc_msgSend(v3, "setPegDotColor:", v8);
  }

  -[NTKWorldClockGraphicCircularView platter](self, "platter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "backgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring");
  v20 = 1;
  if (v18)
  {
    if (v17)
    {
      v23 = 0.0;
      objc_msgSend(v17, "getRed:green:blue:alpha:", 0, 0, 0, &v23);
      v19 = v23;
      if (v23 >= 0.7)
      {
        CLKContrastRatioForColors();
        v20 = v19 > 1.7;
      }
    }
  }
  objc_msgSend(v3, "hourHandView", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setShadowsHidden:", v20);

  objc_msgSend(v3, "minuteHandView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setShadowsHidden:", v20);

}

- (void)_updateHourLabelColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NTKWorldClockGraphicCircularView dialView](self, "dialView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
    -[NTKWorldClockGraphicCircularView daytimeHandsLargeTickColor](self, "daytimeHandsLargeTickColor");
  else
    -[NTKWorldClockGraphicCircularView nighttimeHandsLargeTickColor](self, "nighttimeHandsLargeTickColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorForView:accented:", v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView tintedFraction](self, "tintedFraction");
  NTKInterpolateBetweenColors(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NTKWorldClockGraphicCircularView hourLabels](self, "hourLabels", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setTextColor:", v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_updatePlatterColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring"))
  {
    -[NTKWorldClockGraphicCircularView daytimeBackgroundColor](self, "daytimeBackgroundColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKWorldClockGraphicCircularView tintedPlatterColor](self, "tintedPlatterColor");
  }
  else
  {
    -[NTKWorldClockGraphicCircularView nighttimeBackgroundColor](self, "nighttimeBackgroundColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView tintedFraction](self, "tintedFraction");
  NTKInterpolateBetweenColors(v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView platter](self, "platter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)_updateTickColor
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[NTKWorldClockGraphicCircularView dialView](self, "dialView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[NTKWorldClockGraphicCircularView useDayTimeColoring](self, "useDayTimeColoring");
  -[NTKWorldClockGraphicCircularView filterProvider](self, "filterProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockGraphicCircularView tintedFraction](self, "tintedFraction");
  objc_msgSend(v4, "colorForView:accented:", v17, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[NTKWorldClockGraphicCircularView daytimeHandsLargeTickColor](self, "daytimeHandsLargeTickColor");
  else
    -[NTKWorldClockGraphicCircularView nighttimeHandsLargeTickColor](self, "nighttimeHandsLargeTickColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[NTKWorldClockGraphicCircularView daytimeHandsSmallTickColor](self, "daytimeHandsSmallTickColor");
  else
    -[NTKWorldClockGraphicCircularView nighttimeHandsSmallTickColor](self, "nighttimeHandsSmallTickColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.75);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v11 = objc_retainAutorelease(v7);
  v12 = objc_msgSend(v11, "CGColor");
  objc_msgSend(v17, "largeTickLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  v14 = objc_retainAutorelease(v10);
  v15 = objc_msgSend(v14, "CGColor");
  objc_msgSend(v17, "smallTickLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (BOOL)useDayTimeColoring
{
  return self->_useDayTimeColoring;
}

- (void)setUseDayTimeColoring:(BOOL)a3
{
  self->_useDayTimeColoring = a3;
}

- (NSArray)hourLabels
{
  return self->_hourLabels;
}

- (double)tintedFraction
{
  return self->_tintedFraction;
}

- (UIColor)tintedPlatterColor
{
  return self->_tintedPlatterColor;
}

- (UILabel)cityNameLabel
{
  return self->_cityNameLabel;
}

- (UILabel)northHourLabel
{
  return self->_northHourLabel;
}

- (UILabel)eastHourLabel
{
  return self->_eastHourLabel;
}

- (UILabel)westHourLabel
{
  return self->_westHourLabel;
}

- (UILabel)southHourLabel
{
  return self->_southHourLabel;
}

- (NTKWorldClockRichComplicationHandsBaseView)handsView
{
  return self->_handsView;
}

- (NTKRichComplicationDialView)dialView
{
  return self->_dialView;
}

- (UIView)platter
{
  return self->_platter;
}

- (CLKDevice)device
{
  return self->_device;
}

- ($513C300AF4A6862D8B434F9A964F3546)layoutConstants
{
  CGSize v3;
  __int128 v4;

  v3 = *(CGSize *)&self[8].var5;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[8].var3;
  retstr->var6 = v3;
  retstr->var7 = *(CGSize *)&self[8].var6.height;
  v4 = *(_OWORD *)&self[8].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[7].var7.height;
  *(_OWORD *)&retstr->var2 = v4;
  return self;
}

- (CLKClockTimerToken)clockTimerToken
{
  return self->_clockTimerToken;
}

- (void)setClockTimerToken:(id)a3
{
  objc_storeStrong((id *)&self->_clockTimerToken, a3);
}

- (BOOL)positionLabelNorthSide
{
  return self->_positionLabelNorthSide;
}

- (void)setPositionLabelNorthSide:(BOOL)a3
{
  self->_positionLabelNorthSide = a3;
}

- (CLKUIAlmanacTransitInfo)transitInfo
{
  return self->_transitInfo;
}

- (void)setTransitInfo:(id)a3
{
  objc_storeStrong((id *)&self->_transitInfo, a3);
}

- (double)monochromeFraction
{
  return self->_monochromeFraction;
}

- (void)setMonochromeFraction:(double)a3
{
  self->_monochromeFraction = a3;
}

- (BOOL)hasPerformedColoringFirstPass
{
  return self->_coloringFirstPassPerformed;
}

- (void)setColoringFirstPassPerformed:(BOOL)a3
{
  self->_coloringFirstPassPerformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitInfo, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_platter, 0);
  objc_storeStrong((id *)&self->_dialView, 0);
  objc_storeStrong((id *)&self->_handsView, 0);
  objc_storeStrong((id *)&self->_southHourLabel, 0);
  objc_storeStrong((id *)&self->_westHourLabel, 0);
  objc_storeStrong((id *)&self->_eastHourLabel, 0);
  objc_storeStrong((id *)&self->_northHourLabel, 0);
  objc_storeStrong((id *)&self->_cityNameLabel, 0);
  objc_storeStrong((id *)&self->_tintedPlatterColor, 0);
  objc_storeStrong((id *)&self->_hourLabels, 0);
  objc_storeStrong((id *)&self->_nighttimeHandsSmallTickColor, 0);
  objc_storeStrong((id *)&self->_nighttimeHandsLargeTickColor, 0);
  objc_storeStrong((id *)&self->_daytimeHandsSmallTickColor, 0);
  objc_storeStrong((id *)&self->_daytimeHandsLargeTickColor, 0);
  objc_storeStrong((id *)&self->_nighttimeSecondHandColor, 0);
  objc_storeStrong((id *)&self->_nighttimeHandsColor, 0);
  objc_storeStrong((id *)&self->_nighttimeBackgroundColor, 0);
  objc_storeStrong((id *)&self->_daytimeSecondHandColor, 0);
  objc_storeStrong((id *)&self->_daytimeHandsColor, 0);
  objc_storeStrong((id *)&self->_daytimeBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
}

+ (void)_shouldUseDaytimeColoringForTransitInfo:(os_log_t)log atDate:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Unhandled sunrise/sunset case (logic error)", v1, 2u);
}

@end
