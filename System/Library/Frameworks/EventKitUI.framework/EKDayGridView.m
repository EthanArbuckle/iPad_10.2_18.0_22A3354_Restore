@implementation EKDayGridView

- (void)didMoveToWindow
{
  -[EKDayGridView updateHourHeight](self, "updateHourHeight");
  if (self->_needsLayoutInWindow)
  {
    -[EKDayGridView setNeedsLayout](self, "setNeedsLayout");
    self->_needsLayoutInWindow = 0;
  }
}

- (BOOL)showsTimeLine
{
  return self->_showsTimeLine;
}

- (double)widthForOccurrences
{
  double result;

  result = self->_cachedWidthForOffMainThreadWork;
  if ((*((_BYTE *)self + 432) & 2) != 0 && self->_rightBorderInsetsOccurrences)
    return result + -1.0;
  return result;
}

- (void)updateMarkerPosition
{
  EKCurrentTimeMarkerView *timeMarker;
  double v4;
  double v5;
  EKCurrentTimeMarkerView *v6;
  double v7;
  double v8;
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
  double v20;
  double v21;
  double v22;
  double v23;
  int IsLeftToRight;
  uint64_t v25;
  int64_t v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;

  timeMarker = self->_timeMarker;
  if (timeMarker)
  {
    -[EKCurrentTimeMarkerView updateTime](timeMarker, "updateTime");
    -[EKDayGridView bounds](self, "bounds");
    v5 = v4;
    v6 = self->_timeMarker;
    -[EKDayGridView hourHeight](self, "hourHeight");
    v8 = v7;
    -[EKDayGridView topPadding](self, "topPadding");
    v9 = 0.0;
    +[EKDayTimeView timeMarkerFrameForTotalWidth:timeWidth:timeMarker:hourHeight:topPadding:](EKDayTimeView, "timeMarkerFrameForTotalWidth:timeWidth:timeMarker:hourHeight:topPadding:", v6, v5, 0.0, v8, v10);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[EKCurrentTimeMarkerView setFrame:](self->_timeMarker, "setFrame:");
    if (-[EKDayGridView timeMarkerTodayDay](self, "timeMarkerTodayDay") < 1)
    {
      -[EKCurrentTimeMarkerView setTodayStart:](self->_timeMarker, "setTodayStart:", 0.0);
    }
    else
    {
      v19 = (double)(-[EKDayGridView timeMarkerTodayDay](self, "timeMarkerTodayDay") - 1);
      -[EKDayGridView _dayWidth](self, "_dayWidth");
      -[EKCurrentTimeMarkerView setTodayStart:](self->_timeMarker, "setTodayStart:", v20 * v19);
      -[EKDayGridView _dayWidth](self, "_dayWidth");
      v9 = v21;
    }
    -[EKCurrentTimeMarkerView setTodayWidth:](self->_timeMarker, "setTodayWidth:", v9);
    -[EKCurrentTimeMarkerView setNeedsDisplay](self->_timeMarker, "setNeedsDisplay");
    CalRoundToScreenScale(8.0);
    v23 = v22 * 0.5;
    IsLeftToRight = CalInterfaceIsLeftToRight();
    v25 = -[EKDayGridView timeMarkerTodayDay](self, "timeMarkerTodayDay");
    if (IsLeftToRight)
    {
      if (v25 >= 1)
      {
        v26 = -[EKDayGridView timeMarkerTodayDay](self, "timeMarkerTodayDay") - 1;
LABEL_11:
        v27 = (double)v26;
        -[EKDayGridView _dayWidth](self, "_dayWidth");
        v29 = -(v23 - v27 * v28);
LABEL_13:
        v34.origin.x = v12;
        v34.origin.y = v14;
        v34.size.width = v16;
        v34.size.height = v18;
        v30 = CGRectGetMidY(v34) - v23;
        CalRoundToScreenScale(8.0);
        v32 = v31;
        CalRoundToScreenScale(8.0);
        -[UIImageView setFrame:](self->_timeDot, "setFrame:", v29, v30, v32, v33);
        return;
      }
    }
    else if (v25 >= 1)
    {
      v26 = -[EKDayGridView timeMarkerTodayDay](self, "timeMarkerTodayDay");
      goto LABEL_11;
    }
    v29 = 0.0;
    goto LABEL_13;
  }
}

- (double)timeWidth
{
  return self->_timeWidth;
}

- (double)positionOfSecond:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double result;

  -[EKDayGridView hourHeight](self, "hourHeight");
  v6 = v5;
  -[EKDayGridView topPadding](self, "topPadding");
  +[EKDayTimeView positionOfSecond:hourHeight:topPadding:clampToBounds:](EKDayTimeView, "positionOfSecond:hourHeight:topPadding:clampToBounds:", a3, 0, v6, v7);
  return result;
}

- (double)hourHeight
{
  return self->_hourHeight;
}

- (int)secondAtPosition:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[EKDayGridView topPadding](self, "topPadding");
  if (v5 >= a3)
    return 0;
  v6 = a3 - v5;
  -[EKDayGridView hourHeight](self, "hourHeight");
  return llround(v6 / (v7 * 24.0) * 86400.0);
}

- (double)topPadding
{
  double v3;

  +[EKDayTimeView verticalPadding](EKDayTimeView, "verticalPadding");
  return v3 + self->_hoursToPadTop * self->_hourHeight;
}

- (UIView)occurrenceContainerView
{
  return self->_occurrenceContainerView;
}

- (void)setShowsTimeMarker:(BOOL)a3
{
  if (self->_showsTimeMarker != a3)
  {
    self->_showsTimeMarker = a3;
    -[EKDayGridView _updateTimeMarker](self, "_updateTimeMarker");
  }
}

- (void)setOrientation:(int64_t)a3
{
  double v4;
  double v5;
  double v6;

  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    +[EKDayTimeView timeInsetForSizeClass:orientation:](EKDayTimeView, "timeInsetForSizeClass:orientation:", -[EKDayGridView _sizeClass](self, "_sizeClass"), a3);
    self->_timeInset = v4;
    -[EKDayGridView updateHourHeight](self, "updateHourHeight");
    -[EKDayGridView frame](self, "frame");
    v6 = v5;
    -[EKDayGridView frame](self, "frame");
    -[EKDayGridView setFrame:](self, "setFrame:", 0.0, 0.0, v6);
    -[EKDayGridView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (EKCurrentTimeMarkerView)timeMarker
{
  return self->_timeMarker;
}

- (BOOL)showsTimeMarker
{
  return self->_showsTimeMarker;
}

- (void)setAnimatesTimeMarker:(BOOL)a3
{
  self->_animatesTimeMarker = a3;
}

- (void)updateHourHeight
{
  double v3;

  +[EKDayTimeView hourHeightForSizeClass:orientation:](EKDayTimeView, "hourHeightForSizeClass:orientation:", -[EKDayGridView _sizeClass](self, "_sizeClass"), self->_orientation);
  self->_hourHeight = v3 * self->_gridHeightScale;
}

- (int64_t)_sizeClass
{
  void *v3;

  -[EKDayGridView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return EKUIWidthSizeClassForViewHierarchy(self);
  else
    return self->_sizeClass;
}

- (void)setFrame:(CGRect)a3
{
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKDayGridView;
  -[EKDayGridView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[EKDayGridView bounds](self, "bounds");
  self->_cachedWidthForOffMainThreadWork = v4;
}

- (void)setShowsTimeLine:(BOOL)a3
{
  if (self->_showsTimeLine != a3)
  {
    self->_showsTimeLine = a3;
    -[EKDayGridView _updateTimeMarker](self, "_updateTimeMarker");
  }
}

- (void)_updateTimeMarker
{
  EKCurrentTimeMarkerView *timeMarker;
  EKCurrentTimeMarkerView *v4;
  EKCurrentTimeMarkerView *v5;
  double v6;
  double v7;
  EKCurrentTimeMarkerView *v8;
  double v9;
  double v10;
  double v11;
  void (**v12)(_QWORD);
  EKCurrentTimeMarkerView *v13;
  EKCurrentTimeMarkerView *v14;
  EKCurrentTimeMarkerView *v15;
  uint64_t v16;
  EKCurrentTimeMarkerView *v17;
  void (**v18)(_QWORD);
  EKCurrentTimeMarkerView *v19;
  void (**v20)(void *, uint64_t);
  _BOOL4 v21;
  UIImageView *timeDot;
  UIImageView *v23;
  UIImageView *v24;
  uint64_t v25;
  UIImageView *v26;
  void (**v27)(_QWORD);
  UIImageView *v28;
  void (**v29)(void *, uint64_t);
  void *v30;
  UIImageView *v31;
  UIImageView *v32;
  void (**v33)(_QWORD);
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  UIImageView *v38;
  _QWORD v39[4];
  UIImageView *v40;
  _QWORD v41[5];
  _QWORD v42[4];
  EKCurrentTimeMarkerView *v43;
  _QWORD v44[4];
  EKCurrentTimeMarkerView *v45;
  _QWORD aBlock[5];

  if (self->_showsTimeLine || self->_showsTimeMarker)
  {
    timeMarker = self->_timeMarker;
    if (timeMarker)
    {
      -[EKCurrentTimeMarkerView setShowsThumb:](timeMarker, "setShowsThumb:", self->_showsTimeMarker);
      -[EKCurrentTimeMarkerView setShowsLine:](self->_timeMarker, "setShowsLine:", self->_showsTimeLine);
      -[EKDayGridView updateMarkerPosition](self, "updateMarkerPosition");
    }
    else
    {
      v4 = -[EKCurrentTimeMarkerView initWithFrame:sizeClass:]([EKCurrentTimeMarkerView alloc], "initWithFrame:sizeClass:", self->_sizeClass, 0.0, 0.0, 10.0, 10.0);
      v5 = self->_timeMarker;
      self->_timeMarker = v4;

      -[EKDayGridView bounds](self, "bounds");
      v7 = v6;
      v8 = self->_timeMarker;
      -[EKDayGridView hourHeight](self, "hourHeight");
      v10 = v9;
      -[EKDayGridView topPadding](self, "topPadding");
      +[EKDayTimeView timeMarkerFrameForTotalWidth:timeWidth:timeMarker:hourHeight:topPadding:](EKDayTimeView, "timeMarkerFrameForTotalWidth:timeWidth:timeMarker:hourHeight:topPadding:", v8, v7, 0.0, v10, v11);
      -[EKCurrentTimeMarkerView setFrame:](self->_timeMarker, "setFrame:");
      -[EKCurrentTimeMarkerView setAutoresizingMask:](self->_timeMarker, "setAutoresizingMask:", 2);
      -[EKCurrentTimeMarkerView setShowsThumb:](self->_timeMarker, "setShowsThumb:", self->_showsTimeMarker);
      -[EKCurrentTimeMarkerView setShowsLine:](self->_timeMarker, "setShowsLine:", self->_showsTimeLine);
      -[EKDayGridView updateMarkerPosition](self, "updateMarkerPosition");
      -[EKCurrentTimeMarkerView setAlpha:](self->_timeMarker, "setAlpha:", 0.0);
      -[EKDayGridView addSubview:](self, "addSubview:", self->_timeMarker);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __34__EKDayGridView__updateTimeMarker__block_invoke;
      aBlock[3] = &unk_1E6018688;
      aBlock[4] = self;
      v12 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (-[EKDayGridView animatesTimeMarker](self, "animatesTimeMarker"))
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v12, 0.2);
      else
        v12[2](v12);

    }
  }
  else
  {
    v13 = self->_timeMarker;
    if (v13)
    {
      v14 = v13;
      v15 = self->_timeMarker;
      self->_timeMarker = 0;

      v16 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __34__EKDayGridView__updateTimeMarker__block_invoke_2;
      v44[3] = &unk_1E6018688;
      v17 = v14;
      v45 = v17;
      v18 = (void (**)(_QWORD))_Block_copy(v44);
      v42[0] = v16;
      v42[1] = 3221225472;
      v42[2] = __34__EKDayGridView__updateTimeMarker__block_invoke_3;
      v42[3] = &unk_1E6018638;
      v19 = v17;
      v43 = v19;
      v20 = (void (**)(void *, uint64_t))_Block_copy(v42);
      if (-[EKDayGridView animatesTimeMarker](self, "animatesTimeMarker"))
      {
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v18, v20, 0.2);
      }
      else
      {
        v18[2](v18);
        v20[2](v20, 1);
      }

    }
  }
  v21 = -[EKDayGridView _showsTimeDot](self, "_showsTimeDot");
  timeDot = self->_timeDot;
  if (v21)
  {
    if (timeDot)
    {
      -[EKDayGridView updateMarkerPosition](self, "updateMarkerPosition");
    }
    else
    {
      -[EKDayGridView _timeDotImage](self, "_timeDotImage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v30);
      v32 = self->_timeDot;
      self->_timeDot = v31;

      -[EKDayGridView updateMarkerPosition](self, "updateMarkerPosition");
      -[UIImageView setAlpha:](self->_timeDot, "setAlpha:", 0.0);
      -[EKDayGridView addSubview:](self, "addSubview:", self->_timeDot);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __34__EKDayGridView__updateTimeMarker__block_invoke_4;
      v41[3] = &unk_1E6018688;
      v41[4] = self;
      v33 = (void (**)(_QWORD))_Block_copy(v41);
      if (-[EKDayGridView animatesTimeMarker](self, "animatesTimeMarker"))
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v33, 0.2);
      else
        v33[2](v33);

    }
  }
  else if (timeDot)
  {
    v23 = timeDot;
    v24 = self->_timeDot;
    self->_timeDot = 0;

    v25 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __34__EKDayGridView__updateTimeMarker__block_invoke_5;
    v39[3] = &unk_1E6018688;
    v26 = v23;
    v40 = v26;
    v27 = (void (**)(_QWORD))_Block_copy(v39);
    v34 = v25;
    v35 = 3221225472;
    v36 = __34__EKDayGridView__updateTimeMarker__block_invoke_6;
    v37 = &unk_1E6018638;
    v28 = v26;
    v38 = v28;
    v29 = (void (**)(void *, uint64_t))_Block_copy(&v34);
    if (-[EKDayGridView animatesTimeMarker](self, "animatesTimeMarker", v34, v35, v36, v37))
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v27, v29, 0.2);
    }
    else
    {
      v27[2](v27);
      v29[2](v29, 1);
    }

  }
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKDayGridView;
  -[EKDayGridView tintColorDidChange](&v4, sel_tintColorDidChange);
  objc_msgSend((id)__cachedTimeDotImages, "removeAllObjects");
  -[EKDayGridView _timeDotImage](self, "_timeDotImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_timeDot, "setImage:", v3);

}

- (BOOL)animatesTimeMarker
{
  return self->_animatesTimeMarker;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  EKUIVisualEffectView *v13;
  EKUIVisualEffectView *v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableDictionary *gridParentViews;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  NSMutableDictionary *v50;
  void *v51;
  void *v52;
  void *v53;
  long double hourHeight;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  NSMutableArray *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  uint64_t k;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  NSMutableArray *obj;
  double v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;
  CGRect v98;
  CGRect v99;

  v97 = *MEMORY[0x1E0C80C00];
  -[EKDayGridView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKCurrentTimeMarkerView setNeedsDisplay](self->_timeMarker, "setNeedsDisplay");
    v81 = EKUISeparatorLineThickness();
    -[EKDayGridView bounds](self, "bounds");
    v5 = v4;
    -[EKDayGridView topPadding](self, "topPadding");
    v7 = v5 - v6;
    -[EKDayGridView bottomPadding](self, "bottomPadding");
    v9 = v7 - v8 + 1.0;
    *(float *)&v8 = v9 * 0.0009765625;
    v10 = vcvtps_s32_f32(*(float *)&v8);
    if (-[NSMutableArray count](self->_gridPatternViews, "count") < v10)
    {
      v11 = -[NSMutableArray count](self->_gridPatternViews, "count");
      v12 = v10 - v11;
      if ((uint64_t)v10 > v11)
      {
        do
        {
          v13 = [EKUIVisualEffectView alloc];
          -[EKDayGridView bounds](self, "bounds");
          v14 = -[EKUIVisualEffectView initWithFrame:](v13, "initWithFrame:");
          -[EKUIVisualEffectView setTintColorDelegate:](v14, "setTintColorDelegate:", self);
          -[UIView addSubview:](self->_gridContainerView, "addSubview:", v14);
          -[UIView sendSubviewToBack:](self->_gridContainerView, "sendSubviewToBack:", v14);
          -[EKDayGridView gridVisualEffect](self, "gridVisualEffect");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKUIVisualEffectView setEffect:](v14, "setEffect:", v15);

          v16 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
          objc_msgSend(v16, "setAutoresizingMask:", 18);
          -[EKUIVisualEffectView contentView](v14, "contentView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addSubview:", v16);

          -[NSMutableArray addObject:](self->_gridPatternViews, "addObject:", v16);
          gridParentViews = self->_gridParentViews;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](gridParentViews, "setObject:forKey:", v14, v19);

          --v12;
        }
        while (v12);
      }
    }
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v20 = self->_gridPatternViews;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v91 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          v26 = (void *)MEMORY[0x1E0DC3658];
          -[EKDayGridView _generateGridImage](self, "_generateGridImage");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "colorWithPatternImage:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setBackgroundColor:", v28);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
      }
      while (v22);
    }

    -[EKDayGridView bounds](self, "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    -[EKDayGridView topPadding](self, "topPadding");
    v36 = v35;
    -[EKDayGridView bounds](self, "bounds");
    v38 = v37;
    -[EKDayGridView bottomPadding](self, "bottomPadding");
    v40 = v39;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = self->_gridPatternViews;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
    if (v41)
    {
      v42 = v41;
      v43 = 0;
      v44 = v38 - v40 + 1.0;
      if (v9 <= 1024.0)
        v45 = v9;
      else
        v45 = 1024.0;
      v46 = v36 + v32;
      v47 = *(_QWORD *)v87;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v87 != v47)
            objc_enumerationMutation(obj);
          v49 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
          v50 = self->_gridParentViews;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](v50, "objectForKey:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            objc_msgSend(v52, "removeFromSuperview");
            v43 = 1;
          }
          else
          {
            objc_msgSend(v52, "superview");
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v53)
            {
              -[UIView addSubview:](self->_gridContainerView, "addSubview:", v52);
              -[UIView sendSubviewToBack:](self->_gridContainerView, "sendSubviewToBack:", v52);
            }
            objc_msgSend(v52, "setFrame:", v30, v46, v34, v45);
            objc_msgSend(v49, "setFrame:", 0.0, 0.0, v34, v45);
            v43 = v46 + 1024.0 >= v44;
            hourHeight = self->_hourHeight;
            v46 = hourHeight + v46 + v45 - fmod(1024.0, hourHeight);
            -[EKDayGridView bounds](self, "bounds");
            v56 = v55 - v46;
            -[EKDayGridView bottomPadding](self, "bottomPadding");
            v58 = v81 + v56 - v57;
            if (v58 <= 1024.0)
              v45 = v58;
            else
              v45 = 1024.0;
          }

        }
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
      }
      while (v42);
    }

    -[EKDayGridView bounds](self, "bounds");
    v63 = v59;
    v64 = v60;
    v65 = v61;
    v66 = v62;
    if (self->_leftBorderView)
      -[UIView setFrame:](self->_leftBorderView, "setFrame:", 0.0, 0.0, v81, CGRectGetHeight(*(CGRect *)&v59));
    -[EKDayGridView _dayWidth](self, "_dayWidth");
    v68 = v67;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v69 = self->_middleBorderViews;
    v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
    if (v70)
    {
      v71 = v70;
      v72 = *(_QWORD *)v83;
      v73 = v68;
      do
      {
        for (k = 0; k != v71; ++k)
        {
          if (*(_QWORD *)v83 != v72)
            objc_enumerationMutation(v69);
          v75 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
          CalRoundToScreenScale(v73);
          v77 = v76;
          v98.origin.x = v63;
          v98.origin.y = v64;
          v98.size.width = v65;
          v98.size.height = v66;
          objc_msgSend(v75, "setFrame:", v77, 0.0, v81, CGRectGetHeight(v98) + 1.0);
          v73 = v68 + v73;
        }
        v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
      }
      while (v71);
    }

    if ((*((_BYTE *)self + 432) & 2) != 0)
    {
      -[EKDayGridView widthForOccurrences](self, "widthForOccurrences");
      v79 = v78 + (double)(char)(self->_rightBorderInsetsOccurrences - 1);
      -[EKDayGridView bounds](self, "bounds");
      -[UIView setFrame:](self->_rightBorderView, "setFrame:", v79, 0.0, v81, CGRectGetHeight(v99));
    }
  }
  else
  {
    self->_needsLayoutInWindow = 1;
  }
}

- (double)bottomPadding
{
  double v3;

  +[EKDayTimeView verticalPadding](EKDayTimeView, "verticalPadding");
  return v3 + self->_hoursToPadBottom * self->_hourHeight;
}

- (id)_generateGridImage
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double hourHeight;
  uint64_t selected;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CGFloat v20;
  void *v21;
  CGFloat MaxY;
  double v23;
  double v24;
  int v25;
  int v26;
  void *v27;
  BOOL v28;
  double v29;
  double v30;
  double v31;
  int v32;
  int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  BOOL v41;
  int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v49;
  void *v50;
  CGFloat rect;
  CGSize v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  -[EKDayGridView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[EKDayGridView lineColor](self, "lineColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayGridView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceLevel");

  v10 = (void *)MEMORY[0x1E0CB3940];
  hourHeight = self->_hourHeight;
  selected = self->_selected;
  v13 = -[EKDayGridView isOpaque](self, "isOpaque");
  objc_msgSend(v7, "styleString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayGridView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("grid:%d:%f:%d:%@:%zd:%zd"), selected, *(_QWORD *)&hourHeight, v13, v14, objc_msgSend(v15, "userInterfaceStyle"), v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[EKDayGridView cachedBackgroundImageForKey:](EKDayGridView, "cachedBackgroundImageForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
    goto LABEL_31;
  }
  v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  rect = *MEMORY[0x1E0C9D538];
  v52.height = 1024.0;
  v52.width = 2.0;
  UIGraphicsBeginImageContextWithOptions(v52, 0, 0.0);
  if (self->_selected)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.898039216, 0.945098039, 0.988235294, 1.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "set");

LABEL_7:
    v53.size.height = 1024.0;
    v53.size.width = 2.0;
    v53.origin.x = rect;
    v53.origin.y = v20;
    UIRectFill(v53);
    goto LABEL_8;
  }
  if (-[EKDayGridView isOpaque](self, "isOpaque"))
  {
    -[UIColor set](self->_backgroundColor, "set");
    goto LABEL_7;
  }
LABEL_8:
  v49 = v16;
  v50 = v7;
  objc_msgSend(objc_retainAutorelease(v7), "CGColor");
  v54.size.height = 1024.0;
  v54.size.width = 2.0;
  v54.origin.x = v4;
  v54.origin.y = v6;
  MaxY = CGRectGetMaxY(v54);
  v23 = self->_hourHeight;
  v24 = ceil(MaxY / v23);
  if (v24 > 24.0)
    v24 = 24.0;
  v25 = (int)v24;
  v26 = (int)fmax(floor(v6 / v23), 0.0);
  -[EKDayGridView traitCollection](self, "traitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = EKUIUsesLargeTextLayout(v27);
  v29 = 1.0;
  if (!v28)
    v29 = EKUISeparatorLineThickness();
  CalRoundToScreenScale(v29);
  v31 = v30;

  v32 = v25 - v26;
  if (v25 >= v26)
  {
    v33 = 0;
    do
    {
      v34 = CalRoundRectToScreenScale(0.0, self->_hourHeight * (double)(v26 + v33) - v6, 2.0, v31);
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v41 = v32 == v33 || v33 == 0;
      v42 = v41;
      if (!v41)
        goto LABEL_23;
      v55.size.width = 2.0;
      v55.origin.x = rect;
      v55.origin.y = v20;
      v55.size.height = 1024.0;
      v60.origin.x = v34;
      v60.origin.y = v36;
      v60.size.width = v38;
      v60.size.height = v40;
      if (CGRectIntersectsRect(v55, v60))
      {
LABEL_23:
        UISetColor();
        v56.origin.x = v34;
        v56.origin.y = v36;
        v56.size.width = v38;
        v56.size.height = v40;
        UIRectFill(v56);
      }
      v43 = self->_hourHeight;
      if (v26 + v33 == 24)
      {
        v59.origin.y = v36 + v43;
        v59.origin.x = v34;
        v59.size.width = v38;
        v59.size.height = v40;
        UIRectFill(v59);
      }
      else
      {
        v44 = v36 + v31 + floor(v43 * 0.5);
        v45 = v34 + 1.0;
        v46 = v38 + -1.0;
        if (!v42)
          goto LABEL_27;
        v57.size.width = 2.0;
        v57.origin.x = rect;
        v57.origin.y = v20;
        v57.size.height = 1024.0;
        v61.origin.x = v45;
        v61.origin.y = v44;
        v61.size.width = v46;
        v61.size.height = v40;
        if (CGRectIntersectsRect(v57, v61))
        {
LABEL_27:
          v58.origin.x = v45;
          v58.origin.y = v44;
          v58.size.width = v46;
          v58.size.height = v40;
          CGRectGetMaxX(v58);
        }
      }
      ++v33;
    }
    while (v32 + 1 != v33);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  v16 = v49;
  +[EKDayGridView cacheBackgroundImage:forKey:](EKDayGridView, "cacheBackgroundImage:forKey:", v19, v49);
  v7 = v50;
LABEL_31:

  return v19;
}

- (UIColor)lineColor
{
  UIColor *lineColor;

  lineColor = self->_lineColor;
  if (lineColor)
    return lineColor;
  if (UIAccessibilityDarkerSystemColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)cachedBackgroundImageForKey:(id)a3
{
  return (id)objc_msgSend((id)__DayViewGridBackgroundCache, "objectForKey:", a3);
}

- (UIVisualEffect)gridVisualEffect
{
  return self->_gridVisualEffect;
}

- (double)_dayWidth
{
  double result;
  double v4;

  result = self->_fixedDayWidth;
  if (result <= 0.0)
  {
    -[EKDayGridView bounds](self, "bounds");
    return floor(v4 / (double)self->_daysToDisplay);
  }
  return result;
}

+ (void)cacheBackgroundImage:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (!__DayViewGridBackgroundCache)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)__DayViewGridBackgroundCache;
    __DayViewGridBackgroundCache = (uint64_t)v6;

  }
  if (v8)
    objc_msgSend((id)__DayViewGridBackgroundCache, "setObject:forKey:", v8, v5);
  else
    objc_msgSend((id)__DayViewGridBackgroundCache, "removeObjectForKey:", v5);

}

- (EKDayGridView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 backgroundColor:(id)a5 opaque:(BOOL)a6 numberOfDaysToDisplay:(unint64_t)a7
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  id v16;
  EKDayGridView *v17;
  EKDayGridView *v18;
  double v19;
  double v20;
  uint64_t v21;
  UIView *gridContainerView;
  uint64_t v23;
  NSMutableArray *middleBorderViews;
  unint64_t v25;
  id v26;
  void *v27;
  NSMutableArray *v28;
  NSMutableArray *gridPatternViews;
  uint64_t v30;
  NSMutableDictionary *gridParentViews;
  uint64_t v32;
  UIView *occurrenceContainerView;
  double v34;
  id v36;
  objc_super v37;

  v8 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a5;
  v37.receiver = self;
  v37.super_class = (Class)EKDayGridView;
  v17 = -[EKDayGridView initWithFrame:](&v37, sel_initWithFrame_, x, y, width, height);
  v18 = v17;
  if (v17)
  {
    v36 = v16;
    -[EKDayGridView setOpaque:](v17, "setOpaque:", v8);
    v18->_selected = -1;
    -[EKDayGridView setShowsLeftBorder:](v18, "setShowsLeftBorder:", 0);
    -[EKDayGridView setSelected:](v18, "setSelected:", 0);
    v18->_rightBorderInsetsOccurrences = 1;
    objc_storeStrong((id *)&v18->_backgroundColor, a5);
    v18->_daysToDisplay = a7;
    v18->_animatesTimeMarker = 1;
    v18->_orientation = 1;
    +[EKDayTimeView timeInsetForSizeClass:orientation:](EKDayTimeView, "timeInsetForSizeClass:orientation:", a4, 1);
    v18->_timeInset = -v19;
    +[EKDayTimeView hourHeightForSizeClass:orientation:](EKDayTimeView, "hourHeightForSizeClass:orientation:", a4, v18->_orientation);
    v18->_hourHeight = v20;
    v18->_gridHeightScale = 1.0;
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    gridContainerView = v18->_gridContainerView;
    v18->_gridContainerView = (UIView *)v21;

    -[UIView setAutoresizingMask:](v18->_gridContainerView, "setAutoresizingMask:", 18);
    -[EKDayGridView addSubview:](v18, "addSubview:", v18->_gridContainerView);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v18->_daysToDisplay);
    middleBorderViews = v18->_middleBorderViews;
    v18->_middleBorderViews = (NSMutableArray *)v23;

    if (v18->_daysToDisplay != 1)
    {
      v25 = 0;
      do
      {
        v26 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
        objc_msgSend(v26, "setAutoresizingMask:", 5);
        objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setBackgroundColor:", v27);

        -[UIView addSubview:](v18->_gridContainerView, "addSubview:", v26);
        -[NSMutableArray addObject:](v18->_middleBorderViews, "addObject:", v26);

        ++v25;
      }
      while (v25 < v18->_daysToDisplay - 1);
    }
    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    gridPatternViews = v18->_gridPatternViews;
    v18->_gridPatternViews = v28;

    v18->_highlightedDayIndex = -1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = objc_claimAutoreleasedReturnValue();
    gridParentViews = v18->_gridParentViews;
    v18->_gridParentViews = (NSMutableDictionary *)v30;

    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    occurrenceContainerView = v18->_occurrenceContainerView;
    v18->_occurrenceContainerView = (UIView *)v32;

    -[UIView setAutoresizingMask:](v18->_occurrenceContainerView, "setAutoresizingMask:", 18);
    -[EKDayGridView addSubview:](v18, "addSubview:", v18->_occurrenceContainerView);
    -[EKDayGridView bounds](v18, "bounds");
    v18->_cachedWidthForOffMainThreadWork = v34;
    v18->_sizeClass = a4;
    v16 = v36;
  }

  return v18;
}

- (void)setShowsLeftBorder:(BOOL)a3
{
  char v3;
  UIView *leftBorderView;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  void *v10;

  v3 = *((_BYTE *)self + 432);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 432) = v3 & 0xFE | a3;
    leftBorderView = self->_leftBorderView;
    if (a3)
    {
      if (!leftBorderView)
      {
        v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v8 = self->_leftBorderView;
        self->_leftBorderView = v7;

        -[UIView setAutoresizingMask:](self->_leftBorderView, "setAutoresizingMask:", 5);
        v9 = self->_leftBorderView;
        objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

        -[UIView addSubview:](self->_gridContainerView, "addSubview:", self->_leftBorderView);
      }
    }
    else
    {
      -[UIView removeFromSuperview](leftBorderView, "removeFromSuperview");
      v6 = self->_leftBorderView;
      self->_leftBorderView = 0;

    }
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[EKDayGridView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

uint64_t __34__EKDayGridView__updateTimeMarker__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setAlpha:", 1.0);
}

- (EKDayGridView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  EKDayGridView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EKDayGridView initWithFrame:sizeClass:backgroundColor:opaque:numberOfDaysToDisplay:](self, "initWithFrame:sizeClass:backgroundColor:opaque:numberOfDaysToDisplay:", 1, v8, 1, 1, x, y, width, height);

  return v9;
}

- (void)setUseMultiDayStyle:(BOOL)a3
{
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_useMultiDayStyle = a3;
  if (a3)
    EKUIVerticalGridLineColor();
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_middleBorderViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setBackgroundColor:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setBounds:(CGRect)a3
{
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKDayGridView;
  -[EKDayGridView setBounds:](&v5, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[EKDayGridView bounds](self, "bounds");
  self->_cachedWidthForOffMainThreadWork = v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double fixedDayWidth;
  double v6;
  double hourHeight;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  fixedDayWidth = self->_fixedDayWidth;
  if (fixedDayWidth > 0.0)
  {
    CalRoundToScreenScale(fixedDayWidth * (double)self->_daysToDisplay);
    width = v6;
  }
  hourHeight = self->_hourHeight;
  -[EKDayGridView topPadding](self, "topPadding");
  v9 = v8 + hourHeight * 24.0;
  -[EKDayGridView bottomPadding](self, "bottomPadding");
  CalRoundToScreenScale(v9 + v10);
  v12 = v11;
  v13 = width;
  result.height = v12;
  result.width = v13;
  return result;
}

- (double)timeInset
{
  return self->_timeInset;
}

- (void)setGridHeightScale:(double)a3
{
  self->_gridHeightScale = a3;
  -[EKDayGridView updateHourHeight](self, "updateHourHeight");
  -[EKDayGridView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_timeDotImage
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (!__cachedTimeDotImages)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)__cachedTimeDotImages;
    __cachedTimeDotImages = v3;

  }
  -[EKDayGridView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = CFSTR("dark");
  if (v6 == 1)
    v7 = CFSTR("light");
  v8 = v7;

  objc_msgSend((id)__cachedTimeDotImages, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    CalRoundToScreenScale(8.0);
    v15 = 0;
    v16 = (double *)&v15;
    v17 = 0x4010000000;
    v19 = 0;
    v20 = 0;
    v18 = "";
    v21 = v10;
    v22 = v10;
    v11 = objc_alloc(MEMORY[0x1E0DC3828]);
    v12 = (void *)objc_msgSend(v11, "initWithBounds:", v16[4], v16[5], v16[6], v16[7]);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __30__EKDayGridView__timeDotImage__block_invoke;
    v14[3] = &unk_1E601C120;
    v14[4] = &v15;
    objc_msgSend(v12, "imageWithActions:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__cachedTimeDotImages, "setObject:forKey:", v9, v8);

    _Block_object_dispose(&v15, 8);
  }

  return v9;
}

void __30__EKDayGridView__timeDotImage__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  CGContext *v7;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a2;
  objc_msgSend(v3, "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFill");

  CGContextFillEllipseInRect((CGContextRef)objc_msgSend(v4, "CGContext"), *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectInset(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), 1.0, 1.0);
  CalendarAppTintColor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFill");

  v7 = (CGContext *)objc_msgSend(v4, "CGContext");
  CGContextFillEllipseInRect(v7, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
}

- (BOOL)_showsTimeDot
{
  return !self->_hideTimeDot && (self->_showsTimeLine || self->_showsTimeMarker) && self->_timeMarkerTodayDay > 0;
}

uint64_t __34__EKDayGridView__updateTimeMarker__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __34__EKDayGridView__updateTimeMarker__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __34__EKDayGridView__updateTimeMarker__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setAlpha:", 1.0);
}

uint64_t __34__EKDayGridView__updateTimeMarker__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __34__EKDayGridView__updateTimeMarker__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)hideNowDot:(BOOL)a3
{
  if (self->_hideTimeDot != a3)
  {
    self->_hideTimeDot = a3;
    -[EKDayGridView _updateTimeMarker](self, "_updateTimeMarker");
  }
}

- (void)setTimeMarkerTodayDay:(int64_t)a3
{
  if (self->_timeMarkerTodayDay != a3)
  {
    self->_timeMarkerTodayDay = a3;
    -[EKDayGridView _updateTimeMarker](self, "_updateTimeMarker");
  }
}

- (BOOL)showsLeftBorder
{
  return *((_BYTE *)self + 432) & 1;
}

- (void)setShowsRightBorder:(BOOL)a3
{
  char v3;
  char v5;
  UIView *rightBorderView;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  void *v11;

  v3 = *((_BYTE *)self + 432);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 2;
    else
      v5 = 0;
    *((_BYTE *)self + 432) = v3 & 0xFD | v5;
    rightBorderView = self->_rightBorderView;
    if (a3)
    {
      if (!rightBorderView)
      {
        v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v9 = self->_rightBorderView;
        self->_rightBorderView = v8;

        v10 = self->_rightBorderView;
        objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

        -[UIView addSubview:](self->_gridContainerView, "addSubview:", self->_rightBorderView);
      }
    }
    else
    {
      -[UIView removeFromSuperview](rightBorderView, "removeFromSuperview");
      v7 = self->_rightBorderView;
      self->_rightBorderView = 0;

    }
  }
}

- (BOOL)showsRightBorder
{
  return (*((unsigned __int8 *)self + 432) >> 1) & 1;
}

- (CGRect)rectForStartSeconds:(int64_t)a3 endSeconds:(int64_t)a4
{
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v6 = MEMORY[0x1E0C9D648];
  v7 = a4 - a3 - 1679;
  if ((double)a3 / 86400.0 >= 0.0)
    v8 = (double)a3 / 86400.0;
  else
    v8 = 0.0;
  if ((double)a4 / 86400.0 <= 1.0)
    v9 = (double)a4 / 86400.0;
  else
    v9 = 1.0;
  -[EKDayGridView hourHeight](self, "hourHeight");
  v11 = v10;
  v12 = v10 * 24.0;
  -[EKDayGridView topPadding](self, "topPadding");
  v14 = v13;
  CalRoundToScreenScale(v8 * v12);
  v16 = v14 + v15;
  CalRoundToScreenScale(v9 * v12);
  v18 = v14 + v17 - v16;
  CalRoundToScreenScale(v11 * 0.75);
  if (v18 < v19)
  {
    CalRoundToScreenScale(v11 * 0.51);
    if (v18 > v20)
    {
      CalRoundToScreenScale(v11 * 0.75);
      v18 = v21;
    }
  }
  v22 = *(double *)(v6 + 16);
  if (v7 <= 0xF2)
  {
    v18 = v18 - EKUISeparatorLineThickness();
    if ((a4 + 100) % 3600 <= 199)
      v18 = v18 - EKUISeparatorLineThickness();
  }
  v23 = 0.0;
  v24 = v16;
  v25 = v22;
  v26 = v18;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (BOOL)isSelected
{
  return self->_selected != 0;
}

- (void)setHighlightedDayIndex:(int64_t)a3
{
  if (self->_highlightedDayIndex != a3)
  {
    self->_highlightedDayIndex = a3;
    -[EKDayGridView _layoutHighlight](self, "_layoutHighlight");
  }
}

- (void)setFixedDayWidth:(double)a3
{
  if (self->_fixedDayWidth != a3)
  {
    self->_fixedDayWidth = a3;
    -[EKDayGridView setNeedsLayout](self, "setNeedsLayout");
    -[EKDayGridView _updateTimeMarker](self, "_updateTimeMarker");
  }
}

- (double)fixedDayWidth
{
  return self->_fixedDayWidth;
}

- (void)setLineColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_lineColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_lineColor, a3);
    -[EKDayGridView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setGridVisualEffect:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_gridVisualEffect, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_gridParentViews, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setEffect:", v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_layoutHighlight
{
  int64_t highlightedDayIndex;
  UIView *highlightedDayBackground;
  BOOL v5;
  uint64_t v6;
  double v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  id v11;
  UIView *v12;
  UIView *v13;
  void *v14;
  int64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[5];
  _QWORD v22[5];

  highlightedDayIndex = self->_highlightedDayIndex;
  highlightedDayBackground = self->_highlightedDayBackground;
  if (highlightedDayIndex < 0)
  {
    -[UIView setHidden:](highlightedDayBackground, "setHidden:", 1);
  }
  else
  {
    v5 = -[UIView isHidden](highlightedDayBackground, "isHidden");
    v6 = MEMORY[0x1E0C809B0];
    if (!v5)
    {
      -[UIView alpha](self->_highlightedDayBackground, "alpha");
      if (v7 >= 0.999)
      {
        v8 = self->_fadingHighlightedDayBackground;
        objc_storeStrong((id *)&self->_fadingHighlightedDayBackground, self->_highlightedDayBackground);
        v9 = self->_highlightedDayBackground;
        self->_highlightedDayBackground = v8;
        v10 = v8;

        v22[0] = v6;
        v22[1] = 3221225472;
        v22[2] = __33__EKDayGridView__layoutHighlight__block_invoke;
        v22[3] = &unk_1E6018688;
        v22[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 196608, v22, 0, 0.2, 0.0);

      }
    }
    if (!self->_highlightedDayBackground)
    {
      v11 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v12 = (UIView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v13 = self->_highlightedDayBackground;
      self->_highlightedDayBackground = v12;

      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_highlightedDayBackground, "setBackgroundColor:", v14);

      -[UIView addSubview:](self->_gridContainerView, "addSubview:", self->_highlightedDayBackground);
      -[UIView sendSubviewToBack:](self->_gridContainerView, "sendSubviewToBack:", self->_highlightedDayBackground);
    }
    v15 = self->_highlightedDayIndex - 1;
    -[EKDayGridView _dayWidth](self, "_dayWidth");
    v17 = v16;
    CalRoundToScreenScale(v16 * (double)v15);
    v19 = v18;
    v20 = CalCeilToScreenScale(v17);
    -[EKDayGridView frame](self, "frame");
    -[UIView setFrame:](self->_highlightedDayBackground, "setFrame:", v19, 0.0, v20);
    -[UIView setAlpha:](self->_highlightedDayBackground, "setAlpha:", 0.0);
    -[UIView setHidden:](self->_highlightedDayBackground, "setHidden:", 0);
    v21[0] = v6;
    v21[1] = 3221225472;
    v21[2] = __33__EKDayGridView__layoutHighlight__block_invoke_2;
    v21[3] = &unk_1E6018688;
    v21[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 196608, v21, 0, 0.1, 0.0);
  }
}

uint64_t __33__EKDayGridView__layoutHighlight__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "setAlpha:", 0.0);
}

uint64_t __33__EKDayGridView__layoutHighlight__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setAlpha:", 1.0);
}

- (BOOL)useMultiDayStyle
{
  return self->_useMultiDayStyle;
}

- (BOOL)rightBorderInsetsOccurrences
{
  return self->_rightBorderInsetsOccurrences;
}

- (void)setRightBorderInsetsOccurrences:(BOOL)a3
{
  self->_rightBorderInsetsOccurrences = a3;
}

- (int64_t)timeMarkerTodayDay
{
  return self->_timeMarkerTodayDay;
}

- (double)eventHorizontalInset
{
  return self->_eventHorizontalInset;
}

- (void)setEventHorizontalInset:(double)a3
{
  self->_eventHorizontalInset = a3;
}

- (double)hoursToPadTop
{
  return self->_hoursToPadTop;
}

- (void)setHoursToPadTop:(double)a3
{
  self->_hoursToPadTop = a3;
}

- (double)hoursToPadBottom
{
  return self->_hoursToPadBottom;
}

- (void)setHoursToPadBottom:(double)a3
{
  self->_hoursToPadBottom = a3;
}

- (int64_t)highlightedDayIndex
{
  return self->_highlightedDayIndex;
}

- (void)setOccurrenceContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_occurrenceContainerView, a3);
}

- (double)gridHeightScale
{
  return self->_gridHeightScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceContainerView, 0);
  objc_storeStrong((id *)&self->_gridVisualEffect, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_gridParentViews, 0);
  objc_storeStrong((id *)&self->_gridContainerView, 0);
  objc_storeStrong((id *)&self->_fadingHighlightedDayBackground, 0);
  objc_storeStrong((id *)&self->_highlightedDayBackground, 0);
  objc_storeStrong((id *)&self->_timeDot, 0);
  objc_storeStrong((id *)&self->_timeMarker, 0);
  objc_storeStrong((id *)&self->_gridPatternViews, 0);
  objc_storeStrong((id *)&self->_rightBorderView, 0);
  objc_storeStrong((id *)&self->_middleBorderViews, 0);
  objc_storeStrong((id *)&self->_leftBorderView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
