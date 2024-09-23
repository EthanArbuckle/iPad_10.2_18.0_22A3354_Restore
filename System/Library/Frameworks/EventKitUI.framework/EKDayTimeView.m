@implementation EKDayTimeView

+ (double)verticalPadding
{
  return 18.0;
}

- (void)layoutFrames
{
  uint64_t v2;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  int *v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double hoursToPad;
  double v17;
  double v18;
  double v19;
  double v20;
  int64_t v21;
  int64_t v22;
  EKDayTimeContentView *v23;
  void *v24;
  void *v25;
  EKUIVisualEffectView *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  BOOL v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;

  v2 = 416;
  if (self->_contentViews)
  {
    if (self->_hourHeight >= 0.0)
    {
      -[EKDayTimeView frame](self, "frame");
      if (v4 > 0.0)
      {
        -[EKDayTimeView frame](self, "frame");
        v6 = v5;
        v7 = 0;
        v8 = *MEMORY[0x1E0C9D648];
        v9 = 0.0;
        v10 = &OBJC_IVAR___EKUIInviteesViewNotRespondedInviteesSection__cachedInviteeCellReuseIdentifier;
        v11 = 0x1E0CB3000;
        v12 = 25;
        do
        {
          -[EKDayTimeView hourHeight](self, "hourHeight");
          v14 = 1024.0 - v13;
          if (v12 == 25)
          {
            v15 = v14 + 0.5;
            hoursToPad = self->_hoursToPad;
            -[EKDayTimeView hourHeight](self, "hourHeight");
            v14 = v15 - (hoursToPad * v17 + 18.0);
          }
          v18 = v6 - v9;
          if (v14 >= v6 - v9)
            v19 = v6 - v9;
          else
            v19 = v14;
          if (v19 <= 0.0)
            break;
          -[EKDayTimeView hourHeight](self, "hourHeight");
          *(float *)&v20 = v19 / v20;
          v21 = vcvtms_s32_f32(*(float *)&v20);
          if (v12 >= v21)
            v22 = v21;
          else
            v22 = v12;
          v50 = v22;
          if (v7 >= objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v2), "count"))
          {
            v23 = objc_alloc_init(EKDayTimeContentView);
            -[EKDayTimeContentView setWantsDeepColorDrawing:](v23, "setWantsDeepColorDrawing:", 0);
            -[EKDayTimeContentView setOwner:](v23, "setOwner:", self);
            -[EKDayTimeContentView setOpaque:](v23, "setOpaque:", -[EKDayTimeView isOpaque](self, "isOpaque"));
            if ((-[EKDayTimeView isOpaque](self, "isOpaque") & 1) != 0)
              objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
            else
              objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKDayTimeContentView setBackgroundColor:](v23, "setBackgroundColor:", v27);

            -[EKDayTimeContentView setNeedsDisplayOnBoundsChange:](v23, "setNeedsDisplayOnBoundsChange:", 1);
            v26 = objc_alloc_init(EKUIVisualEffectView);
            -[EKUIVisualEffectView setTintColorDelegate:](v26, "setTintColorDelegate:", self);
            -[EKUIVisualEffectView contentView](v26, "contentView");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addSubview:", v23);

            -[EKDayTimeView addSubview:](self, "addSubview:", v26);
            objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v2), "addObject:", v23);
            v29 = v2;
            v30 = v10;
            v31 = *(Class *)((char *)&self->super.super.super.isa + v10[706]);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            v10 = v30;
            v2 = v29;
            objc_msgSend(v32, "setObject:forKey:", v26, v25);
          }
          else
          {
            objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v2), "objectAtIndex:", v7);
            v23 = (EKDayTimeContentView *)objc_claimAutoreleasedReturnValue();
            v24 = *(Class *)((char *)&self->super.super.super.isa + v10[706]);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKey:", v25);
            v26 = (EKUIVisualEffectView *)objc_claimAutoreleasedReturnValue();
          }

          -[EKDayTimeView frame](self, "frame");
          v34 = v33;
          v35 = v12 <= v21;
          v11 = 0x1E0CB3000uLL;
          if (!v35)
          {
            v36 = (double)v50 + 0.5;
            if (v12 == 25)
            {
              v37 = v36 + self->_hoursToPad;
              -[EKDayTimeView hourHeight](self, "hourHeight");
              v39 = v37 * v38 + 18.0;
            }
            else
            {
              v40 = v36 + 0.5;
              -[EKDayTimeView hourHeight](self, "hourHeight");
              v39 = v40 * v41;
            }
            CalRoundToScreenScale(v39);
            v18 = v42;
          }
          -[EKUIVisualEffectView setFrame:](v26, "setFrame:", v8, v9, v34, v18);
          -[EKDayTimeContentView setFrame:](v23, "setFrame:", 0.0, 0.0, v34, v18);
          -[EKDayTimeContentView setHourRange:](v23, "setHourRange:", 25 - v12, v50);
          v12 += ~v50;
          v9 = v9 + v18;
          ++v7;

        }
        while (v12 > 0);
        while (v7 < objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v2), "count"))
        {
          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v2), "lastObject");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setOwner:", 0);
          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v2), "removeLastObject");
          v44 = v10[706];
          v45 = *(Class *)((char *)&self->super.super.super.isa + v44);
          objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("%p"), v43);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKey:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v47, "removeFromSuperview");
          v48 = *(Class *)((char *)&self->super.super.super.isa + v44);
          objc_msgSend(v43, "description");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "removeObjectForKey:", v49);

        }
        -[EKDayTimeView bringSubviewToFront:](self, "bringSubviewToFront:", self->_timeMarker);
        -[EKDayTimeView bringSubviewToFront:](self, "bringSubviewToFront:", self->_timeMarkerExtension);
      }
    }
  }
}

- (double)hourHeight
{
  return self->_hourHeight;
}

- (void)setNeedsDisplay
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_contentViews;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setNeedsDisplay", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)viewTintColorDidChangeForView:(id)a3 toColor:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[EKDayTimeView visualEffect](self, "visualEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[EKDayTimeView setTimeColor:](self, "setTimeColor:", v6);
    -[EKDayTimeView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[EKDayTimeView updateHourHeight](self, "updateHourHeight");
    -[EKDayTimeView _invalidateTimeWidth](self, "_invalidateTimeWidth");
    -[EKDayTimeView _flushTimeStringImageCache](self, "_flushTimeStringImageCache");
    -[EKDayTimeView setNeedsDisplay](self, "setNeedsDisplay");
    -[EKDayTimeView setNeedsLayout](self, "setNeedsLayout");
    -[EKDayTimeView layoutFrames](self, "layoutFrames");
  }
}

+ (double)defaultHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4
{
  double result;

  objc_msgSend((id)objc_opt_class(), "defaultHeightForSizeClass:orientation:withHourScale:", a3, a4, 1.0);
  return result;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (double)timeWidthForOrientation:(int64_t)a3 inViewHierarchy:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v6 = a4;
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v6))
  {
    v7 = 44.0;
    v8 = 0.0;
    if ((((unint64_t)(a3 - 3) < 2) & EKUIIsExtended(v6)) != 0)
      v9 = 44.0;
    else
      v9 = 0.0;
  }
  else
  {
    v8 = 6.0;
    v9 = 0.0;
    if ((unint64_t)(a3 - 1) >= 2)
    {
      v7 = 47.0;
      if (MGGetBoolAnswer())
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "userInterfaceIdiom"))
        {

        }
        else
        {
          v11 = objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp");

          if (v11)
          {
            v9 = 20.0;
            if ((unint64_t)(a3 - 3) <= 1)
            {
              if (EKUICurrentWindowSizeParadigmForViewHierarchy(v6) == 0x8000000)
                v9 = 52.0;
              else
                v9 = 44.0;
            }
          }
        }
      }
    }
    else
    {
      v7 = 51.0;
    }
  }
  objc_msgSend(a1, "_timeTextWidthForSizeClass:orientation:", EKUIWidthSizeClassForViewHierarchy(v6), a3);
  v13 = v8 + v12;
  if (v13 < v7)
    v13 = v7;
  CalRoundToScreenScale(v9 + v13);
  v15 = v14;

  return v15;
}

+ (double)_timeTextWidthForSizeClass:(int64_t)a3 orientation:(int64_t)a4
{
  double result;

  objc_msgSend(a1, "_widthForOrientation:sizeClass:excludeCurrentTime:", a4, a3, 0);
  if (result == 0.0)
  {
    objc_msgSend(a1, "_calculateWidthForSizeClass:orientation:excludeCurrentTime:", a3, a4, 0);
    objc_msgSend(a1, "_widthForOrientation:sizeClass:excludeCurrentTime:", a4, a3, 0);
  }
  return result;
}

+ (double)_widthForOrientation:(int64_t)a3 sizeClass:(int64_t)a4 excludeCurrentTime:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3 - 1;
  v9 = !a5;
  v10 = (unint64_t)(a3 - 1) > 1 || !a5;
  if (v10 || a4 != 2)
  {
    if (a4 == 2)
      v10 = 1;
    if (v10)
    {
      if (v8 < 2)
        v9 = 1;
      if (v9 || a4 != 2)
      {
        if (a4 == 2)
          v9 = 1;
        if (v9)
        {
          v12 = (unint64_t)(a3 - 1) > 1 || a5;
          if ((unint64_t)(a3 - 1) > 1 || a5 || a4 != 2)
          {
            if (a4 == 2)
              v12 = 1;
            if (v12)
            {
              v13 = v8 < 2 || a5;
              if (v13 || a4 != 2)
              {
                if (a4 == 2)
                  v13 = 1;
                if (v13)
                {
                  v14 = (void *)kEKUILogHandle;
                  v11 = 0;
                  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
                  {
                    v15 = v14;
                    v16 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v16);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v19 = 138413058;
                    v20 = v17;
                    v21 = 1024;
                    v22 = v5;
                    v23 = 2048;
                    v24 = a3;
                    v25 = 2048;
                    v26 = a4;
                    _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_ERROR, "[%@] Unhandled combination of excludeCurrentTime:%d, orientation:%ld, sizeClass:%ld when trying to get width, returning 0", (uint8_t *)&v19, 0x26u);

                  }
                }
                else
                {
                  v11 = __HourWidthLandscapeCompact;
                }
              }
              else
              {
                v11 = __HourWidthLandscapeRegular;
              }
            }
            else
            {
              v11 = __HourWidthPortraitCompact;
            }
          }
          else
          {
            v11 = __HourWidthPortraitRegular;
          }
        }
        else
        {
          v11 = __HourWidthExcludingCurrentTimeLandscapeCompact;
        }
      }
      else
      {
        v11 = __HourWidthExcludingCurrentTimeLandscapeRegular;
      }
    }
    else
    {
      v11 = __HourWidthExcludingCurrentTimePortraitCompact;
    }
  }
  else
  {
    v11 = __HourWidthExcludingCurrentTimePortraitRegular;
  }
  return *(double *)&v11;
}

+ (double)timeInsetForSizeClass:(int64_t)a3 orientation:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  uint64_t v10;

  EKUIMultiwindowAssert(a3 != 0, CFSTR("Size class not specified."), a3, a4, v4, v5, v6, v7, v10);
  if (a3 != 2)
    return 6.0;
  CalRoundToScreenScale(5.5);
  return result;
}

- (void)updateHourHeight
{
  double v3;

  -[EKDayTimeView scaledHourHeight](self, "scaledHourHeight");
  self->_hourHeight = v3;
}

- (double)scaledHourHeight
{
  double v3;

  +[EKDayTimeView hourHeightForSizeClass:orientation:](EKDayTimeView, "hourHeightForSizeClass:orientation:", -[EKDayTimeView _sizeClass](self, "_sizeClass"), self->_orientation);
  return v3 * self->_hourHeightScale;
}

+ (double)defaultHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4 withHourScale:(double)a5
{
  double v6;
  double result;

  +[EKDayTimeView hourHeightForSizeClass:orientation:](EKDayTimeView, "hourHeightForSizeClass:orientation:", a3, a4);
  CalRoundToScreenScale(v6 * 24.0 * a5 + 1.0 + 36.0);
  return result;
}

- (int64_t)_sizeClass
{
  void *v3;

  -[EKDayTimeView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return EKUIWidthSizeClassForViewHierarchy(self);
  else
    return self->_targetSizeClass;
}

- (void)setFrame:(CGRect)a3
{
  double width;
  double y;
  double x;
  double v7;
  objc_super v8;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = CalCeilToScreenScale(a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)EKDayTimeView;
  -[EKDayTimeView setFrame:](&v8, sel_setFrame_, x, y, width, v7);
  -[EKDayTimeView layoutFrames](self, "layoutFrames");
  -[EKDayTimeView _invalidateTimeWidth](self, "_invalidateTimeWidth");
}

- (void)_invalidateTimeWidth
{
  self->_timeWidth = 0.0;
}

+ (double)hourHeightForSizeClass:(int64_t)a3 orientation:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double result;
  uint64_t v19;

  objc_msgSend(a1, "_registerForInvalidation");
  EKUIMultiwindowAssert(a3 != 0, CFSTR("Unspecified size class"), v6, v7, v8, v9, v10, v11, v19);
  v12 = 44.0;
  if ((unint64_t)(a4 - 1) < 2)
    v12 = 50.0;
  if (a3 == 2)
    v13 = 65.0;
  else
    v13 = v12;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88], v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fontDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pointSize");
  v17 = v16;

  CalRoundToScreenScale(v13 * (v17 / 17.0));
  return result;
}

+ (void)_registerForInvalidation
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__EKDayTimeView__registerForInvalidation__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_registerForInvalidation_onceToken_0 != -1)
    dispatch_once(&_registerForInvalidation_onceToken_0, block);
}

void __41__EKDayTimeView__registerForInvalidation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__invalidateCachedValues, *MEMORY[0x1E0DC48E8], 0);

}

- (EKDayTimeView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4
{
  EKDayTimeView *v5;
  EKDayTimeView *v6;
  double v7;
  uint64_t v8;
  UIColor *timeMarkerExtensionColor;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *contentViews;
  NSMutableDictionary *v14;
  NSMutableDictionary *visualEffectViews;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)EKDayTimeView;
  v5 = -[EKDayTimeView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_highlightedHour = -1.0;
    v5->_hourHeight = -1.0;
    objc_msgSend((id)objc_opt_class(), "defaultHourScale");
    v6->_hourHeightScale = v7;
    v6->_targetSizeClass = a4;
    objc_msgSend(MEMORY[0x1E0DC3658], "cuik_todayTimelineColor");
    v8 = objc_claimAutoreleasedReturnValue();
    timeMarkerExtensionColor = v6->_timeMarkerExtensionColor;
    v6->_timeMarkerExtensionColor = (UIColor *)v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayTimeView setBackgroundColor:](v6, "setBackgroundColor:", v10);

    CalendarAppTintColor();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayTimeView setTintColor:](v6, "setTintColor:", v11);

    v6->_hoursToRender = (_NSRange)xmmword_1AFA138D0;
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contentViews = v6->_contentViews;
    v6->_contentViews = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    visualEffectViews = v6->_visualEffectViews;
    v6->_visualEffectViews = v14;

    -[EKDayTimeView layoutFrames](v6, "layoutFrames");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel__localeChanged, *MEMORY[0x1E0D0CA70], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v6, sel__fontSizeChanged, *MEMORY[0x1E0DC48E8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v6, sel__sizeClassChanged, *MEMORY[0x1E0D0CBC0], 0);

  }
  return v6;
}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)EKDayTimeView;
  -[EKDayTimeView setOpaque:](&v16, sel_setOpaque_);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_contentViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "setOpaque:", v3, (_QWORD)v12);
        if (v3)
          objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
        else
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setBackgroundColor:", v11);

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

}

+ (double)defaultHourScale
{
  return 1.0;
}

- (void)setShowsTimeMarker:(BOOL)a3
{
  EKCurrentTimeMarkerView *timeMarker;
  EKCurrentTimeMarkerView *v6;
  EKCurrentTimeMarkerView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  EKCurrentTimeMarkerView *v12;
  double v13;
  double v14;
  double v15;
  EKCurrentTimeMarkerView *v16;
  EKCurrentTimeMarkerView *v17;
  void *v18;
  uint64_t v19;
  EKCurrentTimeMarkerView *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  EKCurrentTimeMarkerView *v26;
  _QWORD v27[4];
  EKCurrentTimeMarkerView *v28;
  EKDayTimeView *v29;
  _QWORD v30[5];

  if (self->_showsTimeMarker != a3)
  {
    timeMarker = self->_timeMarker;
    if (a3)
    {
      if (timeMarker)
        -[EKCurrentTimeMarkerView removeFromSuperview](timeMarker, "removeFromSuperview");
      v6 = -[EKCurrentTimeMarkerView initWithFrame:sizeClass:]([EKCurrentTimeMarkerView alloc], "initWithFrame:sizeClass:", -[EKDayTimeView _sizeClass](self, "_sizeClass"), 0.0, 0.0, 10.0, 10.0);
      v7 = self->_timeMarker;
      self->_timeMarker = v6;

      -[EKCurrentTimeMarkerView setAutoresizingMask:](self->_timeMarker, "setAutoresizingMask:", 2);
      -[EKCurrentTimeMarkerView setShowsThumb:](self->_timeMarker, "setShowsThumb:", self->_showsTimeMarkerExtension);
      -[EKCurrentTimeMarkerView setShowsLine:](self->_timeMarker, "setShowsLine:", 0);
      -[EKDayTimeView bounds](self, "bounds");
      v9 = v8;
      -[EKDayTimeView timeWidth](self, "timeWidth");
      v11 = v10;
      v12 = self->_timeMarker;
      -[EKDayTimeView hourHeight](self, "hourHeight");
      v14 = v13;
      -[EKDayTimeView topPadding](self, "topPadding");
      +[EKDayTimeView timeMarkerFrameForTotalWidth:timeWidth:timeMarker:hourHeight:topPadding:](EKDayTimeView, "timeMarkerFrameForTotalWidth:timeWidth:timeMarker:hourHeight:topPadding:", v12, v9, v11, v14, v15);
      -[EKCurrentTimeMarkerView setFrame:](self->_timeMarker, "setFrame:");
      -[EKDayTimeView addSubview:](self, "addSubview:", self->_timeMarker);
      -[EKDayTimeView setNeedsLayout](self, "setNeedsLayout");
      -[EKCurrentTimeMarkerView setAlpha:](self->_timeMarker, "setAlpha:", 0.0);
      -[UIView setAlpha:](self->_timeMarkerExtension, "setAlpha:", 0.0);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __36__EKDayTimeView_setShowsTimeMarker___block_invoke;
      v30[3] = &unk_1E6018688;
      v30[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v30, 0.2);
    }
    else
    {
      -[EKCurrentTimeMarkerView setShowsThumb:](timeMarker, "setShowsThumb:", 0);
      -[EKCurrentTimeMarkerView setShowsLine:](self->_timeMarker, "setShowsLine:", 0);
      -[EKCurrentTimeMarkerView setAlpha:](self->_timeMarker, "setAlpha:", 1.0);
      -[UIView setAlpha:](self->_timeMarkerExtension, "setAlpha:", 1.0);
      v16 = self->_timeMarker;
      v17 = self->_timeMarker;
      self->_timeMarker = 0;

      v18 = (void *)MEMORY[0x1E0DC3F10];
      v19 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __36__EKDayTimeView_setShowsTimeMarker___block_invoke_2;
      v27[3] = &unk_1E6018EC0;
      v28 = v16;
      v29 = self;
      v22 = v19;
      v23 = 3221225472;
      v24 = __36__EKDayTimeView_setShowsTimeMarker___block_invoke_3;
      v25 = &unk_1E6018638;
      v26 = v28;
      v20 = v28;
      objc_msgSend(v18, "animateWithDuration:animations:completion:", v27, &v22, 0.2);

    }
    self->_showsTimeMarker = a3;
    -[EKDayTimeView delegate](self, "delegate", v22, v23, v24, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      -[EKDayTimeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKDayTimeView;
  -[EKDayTimeView layoutSubviews](&v3, sel_layoutSubviews);
  -[EKDayTimeView updateMarkerPosition](self, "updateMarkerPosition");
}

- (void)updateMarkerPosition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  EKCurrentTimeMarkerView *timeMarker;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MidY;
  void *v21;
  void *v22;
  CGRect v23;

  if (self->_timeMarker && -[EKDayTimeView showsTimeMarker](self, "showsTimeMarker"))
  {
    -[EKCurrentTimeMarkerView updateTime](self->_timeMarker, "updateTime");
    v3 = (void *)objc_opt_class();
    -[EKDayTimeView bounds](self, "bounds");
    v5 = v4;
    -[EKDayTimeView timeWidth](self, "timeWidth");
    v7 = v6;
    timeMarker = self->_timeMarker;
    -[EKDayTimeView hourHeight](self, "hourHeight");
    v10 = v9;
    -[EKDayTimeView topPadding](self, "topPadding");
    objc_msgSend(v3, "timeMarkerFrameForTotalWidth:timeWidth:timeMarker:hourHeight:topPadding:", timeMarker, v5, v7, v10, v11);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[EKCurrentTimeMarkerView setFrame:](self->_timeMarker, "setFrame:");
    v23.origin.x = v13;
    v23.origin.y = v15;
    v23.size.width = v17;
    v23.size.height = v19;
    MidY = CGRectGetMidY(v23);
    if (self->_showsTimeMarkerExtension)
    {
      v21 = (void *)objc_opt_class();
      -[EKDayTimeView timeWidth](self, "timeWidth");
      objc_msgSend(v21, "_timeLineExtensionFrameForTimeWidth:timeMarker:timeLabelXPosition:yPosition:", self->_timeMarker);
      -[UIView setFrame:](self->_timeMarkerExtension, "setFrame:");
    }
    -[EKDayTimeView delegate](self, "delegate", MidY);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      -[EKDayTimeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)showsTimeMarker
{
  return self->_showsTimeMarker;
}

- (double)topPadding
{
  double v3;

  +[EKDayTimeView verticalPadding](EKDayTimeView, "verticalPadding");
  return v3 + self->_hoursToPad * self->_hourHeight;
}

+ (void)_calculateWidthForSizeClass:(int64_t)a3 orientation:(int64_t)a4 excludeCurrentTime:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  uint64_t v47;
  void *v48;
  void *v49;
  unsigned int v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[2];

  v8 = a5;
  v56[1] = *MEMORY[0x1E0C80C00];
  EKUIMultiwindowAssert(a3 != 0, CFSTR("Unspecified size class"), a3, a4, a5, v5, v6, v7, v47);
  objc_msgSend(a1, "_hourFontForOrientation:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKShow24Hours();
  v13 = *MEMORY[0x1E0DC1138];
  v55 = *MEMORY[0x1E0DC1138];
  v56[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKStringForHour();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeWithAttributes:", v14);
  v17 = v16;

  if ((v8 & 1) != 0)
  {
    objc_msgSend(a1, "timeInsetForSizeClass:orientation:", a3, a4);
    v19 = v17 + v18;
  }
  else
  {
    v50 = v8;
    v49 = v12;
    if (a3 == 2)
    {
      if ((unint64_t)(a4 - 1) > 1)
        v20 = 31.0;
      else
        v20 = 37.0;
      v30 = v17 + v20;
      v29 = 2;
    }
    else
    {
      v21 = *(double *)&__AllDayWidth;
      if (*(double *)&__AllDayWidth <= 0.0)
      {
        +[EKDayAllDayView allDayLabelBoldFont](EKDayAllDayView, "allDayLabelBoldFont", *(double *)&__AllDayWidth);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v13;
        v54 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        EventKitUIBundle();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("all-day"), &stru_1E601DFA8, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sizeWithAttributes:", v23);
        __AllDayWidth = v26;

        v21 = *(double *)&__AllDayWidth;
      }
      if (v17 >= v21)
        v21 = v17;
      v27 = v21 + 3.0;
      v28 = v21 + 4.5;
      v29 = 1;
      if ((unint64_t)(a4 - 1) <= 1)
        v30 = v28;
      else
        v30 = v27;
    }
    +[EKCurrentTimeMarkerView timeMarkerFontForSizeClass:](EKCurrentTimeMarkerView, "timeMarkerFontForSizeClass:", v29, v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKTodayComponents();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setHour:", 22);
    objc_msgSend(v32, "setMinute:", 45);
    CUIKCalendar();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dateFromComponents:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = *MEMORY[0x1E0D0BF28];
    objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringWithFormat:timeZone:", v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = v13;
    v52 = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sizeWithAttributes:", v38);
    v40 = v39;

    if (v30 >= v40 + 10.0 + 2.0)
      v19 = v30;
    else
      v19 = v40 + 10.0 + 2.0;
    CUIKTodayComponents();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setHour:", 10);
    CUIKCalendar();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "dateFromComponents:", v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (void *)MEMORY[0x1E0D0CD50];
    objc_msgSend(a1, "_dynamicFontSizeForOrientation:", 1);
    objc_msgSend(v44, "stylizedTimelineHourStringForHourDate:baseFontSize:", v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "boundingRectWithSize:options:context:", 0, 0, 1.79769313e308, 1.79769313e308);
    if (v19 < v46 + 8.0 + 1.0)
      v19 = v46 + 8.0 + 1.0;

    v8 = v50;
    v14 = v48;
    v12 = v49;
  }
  objc_msgSend(a1, "_setWidth:forOrientation:sizeClass:excludeCurrentTime:", a4, a3, v8, v19);

}

- (void)drawRect:(CGRect)a3 forContentView:(id)a4 withHourRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _BOOL4 v14;
  EKDayTimeView *v15;
  double v16;
  double v17;
  double v18;
  double hourHeight;
  double v20;
  int v21;
  double v22;
  int v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  int *v36;
  int v37;
  uint64_t v38;
  _NSRange *p_hoursToRender;
  uint64_t v40;
  id *v41;
  int v42;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  id v65;
  _BOOL4 v66;
  double v67;
  int IsLeftToRight;
  double v69;
  double v70;
  double v71;
  CGFloat MaxY;
  CGFloat v73;
  double v74;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double v80;
  uint64_t v81;
  void *v82;
  double v83;
  int v84;
  double v85;
  int v86;
  unsigned int v87;
  CGFloat v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  _BOOL4 IsRegularInViewHierarchy;
  double v103;
  double v104;
  double v105;
  double v106;
  double v108;
  double v109;
  double v110;
  double v111;
  id v112;
  void *v113;
  CGContext *CurrentContext;
  CGContext *v115;
  CGFloat v116;
  NSUInteger v117;
  uint64_t v118;
  uint64_t v119;
  CGFloat v120;
  CGFloat v121;
  void *v122;
  uint64_t v123;
  int v124;
  int v125;
  EKDayTimeView *v126;
  int v128;
  id *v129;
  int v130;
  uint64_t v131;
  double v132;
  double v133;
  double v134;
  double v135;
  CGFloat rect;
  CGFloat v137;
  double v138;
  double v139;
  CGFloat v140;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  _QWORD v144[4];
  id v145;
  uint64_t v146;
  void *v147;
  _QWORD v148[2];
  _QWORD v149[4];
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;

  length = a5.length;
  location = a5.location;
  v149[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "bounds");
  v120 = v10;
  v121 = v9;
  v138 = v11;
  rect = v12;
  v125 = CUIKShow24Hours();
  -[EKDayTimeView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceStyle") == 2;

  v15 = self;
  if (self->_cachedHoursAreDark != v14)
  {
    self->_cachedHoursAreDark = v14;
    -[EKDayTimeView _flushTimeStringImageCache](self, "_flushTimeStringImageCache");
  }
  if (location)
    v16 = self->_hourHeight * 0.5;
  else
    v16 = self->_hoursToPad * self->_hourHeight + 18.0;
  CalRoundToScreenScale(v16);
  v18 = v17;
  hourHeight = self->_hourHeight;
  v20 = ceil((CGRectGetMaxY(a3) + (double)location * hourHeight - v17) / hourHeight);
  if (v20 > (double)(length + location))
    v20 = (double)(length + location);
  v21 = (int)v20;
  v134 = v18;
  v135 = hourHeight;
  v22 = floor((a3.origin.y - v18) / hourHeight);
  if (v22 <= (double)location)
    v22 = (double)location;
  v23 = (int)v22;
  +[EKDayTimeView timeInsetForSizeClass:orientation:](EKDayTimeView, "timeInsetForSizeClass:orientation:", EKUIWidthSizeClassForViewHierarchy(v15), v15->_orientation);
  v133 = v24;
  objc_msgSend((id)objc_opt_class(), "_timeVerticalInsetForOrientation:inViewHierarchy:", v15->_orientation, v15);
  v132 = v25;
  -[EKDayTimeView delegate](v15, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v8;
  objc_msgSend(v26, "currentTimeRectInView:", v8);
  v28 = v27;
  v137 = v29;
  v31 = v30;
  v33 = v32;

  v34 = *MEMORY[0x1E0C9D820];
  v35 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v36 = &OBJC_IVAR___EKUIInviteesViewNotRespondedInviteesSection__cachedInviteeCellReuseIdentifier;
  v126 = v15;
  v117 = location;
  if (v23 <= v21)
  {
    v37 = location;
    v38 = 0;
    p_hoursToRender = &v15->_hoursToRender;
    v40 = v23;
    v119 = *MEMORY[0x1E0DC1138];
    v131 = v21 - (uint64_t)v23;
    v118 = *MEMORY[0x1E0DC1140];
    v130 = v23 - v37;
    v41 = (id *)(&v15->super.super.super.isa + v23);
    v42 = ~v21 + v23;
    v128 = v42;
    v129 = v41;
    v141 = v31;
    v142 = v28;
    v140 = v33;
    v123 = v23;
    v124 = v23;
    do
    {
      if (p_hoursToRender->location <= v40 + v38 && v40 + v38 - p_hoursToRender->location < p_hoursToRender->length)
      {
        v44 = v129[v38 + 62];
        -[EKDayTimeView timeWidth](v15, "timeWidth");
        v46 = v45;
        if (v44)
        {
          objc_msgSend(v44, "size");
          v48 = v47;
          v50 = v49;
        }
        else
        {
          v51 = (void *)objc_opt_new();
          objc_msgSend(v51, "setHour:", v40 + v38);
          objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianGMTCalendar");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "dateFromComponents:", v51);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v54 = v125;
          if (v40 + v38 != 12)
            v54 = 1;
          if (v54 == 1)
          {
            v55 = (void *)MEMORY[0x1E0D0CD50];
            objc_msgSend((id)objc_opt_class(), "_dynamicFontSizeForOrientation:", v15->_orientation);
            objc_msgSend(v55, "stylizedTimelineHourStringForHourDate:baseFontSize:", v53);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            EventKitUIBundle();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("Noon_timeline_indicator"), CFSTR("Noon"), 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend((id)objc_opt_class(), "_noonFontForOrientation:", v15->_orientation);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v148[0] = v119;
            v148[1] = v118;
            v149[0] = v59;
            objc_msgSend(MEMORY[0x1E0DC3658], "cuik_timelineHourColor");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v149[1] = v60;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v149, v148, 2);
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v58, v61);
          }
          objc_msgSend(v56, "size", v117);
          v48 = v62;
          v50 = v63;
          v64 = (void *)MEMORY[0x1E0DC3870];
          v144[0] = MEMORY[0x1E0C809B0];
          v144[1] = 3221225472;
          v144[2] = __55__EKDayTimeView_drawRect_forContentView_withHourRange___block_invoke;
          v144[3] = &unk_1E601C1A0;
          v145 = v56;
          v65 = v56;
          objc_msgSend(v64, "cuik_drawImageWithSize:drawBlock:", v144, v48, v50);
          v44 = (id)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v41 + 62, v44);

          v15 = v126;
          v40 = v123;
          v23 = v124;
          v36 = &OBJC_IVAR___EKUIInviteesViewNotRespondedInviteesSection__cachedInviteeCellReuseIdentifier;
        }
        v66 = *(double *)((char *)&v15->super.super.super.isa + v36[701]) == (double)(v23 + (int)v38);
        if (v35 < 0.001)
          v66 = 1;
        if (v66)
          v35 = v50;
        v139 = v35;
        if (v66)
          v67 = v48;
        else
          v67 = v34;
        IsLeftToRight = CalInterfaceIsLeftToRight();
        v69 = v46 - v133 - v48;
        if (!IsLeftToRight)
          v69 = v133;
        CalRoundToScreenScale(v69);
        v71 = v70;
        v150.size.height = 1.0;
        v150.origin.x = v46;
        v150.origin.y = v134 + v135 * (double)(v130 + (int)v38) - v138;
        v150.size.width = rect;
        MaxY = CGRectGetMaxY(v150);
        CalRoundToScreenScale(v132 + MaxY + v50 * -0.5);
        v74 = v73;
        if (v131 != v38 && v38
          || (v165.origin.x = v71,
              v165.origin.y = v73,
              v165.size.width = v48,
              v165.size.height = v50,
              CGRectIntersectsRect(a3, v165)))
        {
          v151.origin.x = v71;
          v151.origin.y = v74;
          v151.size.width = v48;
          v151.size.height = v50;
          v152 = CGRectInset(v151, 0.0, 3.5);
          x = v152.origin.x;
          y = v152.origin.y;
          width = v152.size.width;
          height = v152.size.height;
          MinY = CGRectGetMinY(v152);
          v153.size.width = v141;
          v153.origin.x = v142;
          v153.origin.y = v137;
          v153.size.height = v140;
          if (MinY > CGRectGetMaxY(v153) + 0.0)
            goto LABEL_38;
          v154.origin.x = x;
          v154.origin.y = y;
          v154.size.width = width;
          v154.size.height = height;
          v80 = CGRectGetMaxY(v154);
          v155.size.width = v141;
          v155.origin.x = v142;
          v155.origin.y = v137;
          v155.size.height = v140;
          if (v80 < CGRectGetMinY(v155))
LABEL_38:
            objc_msgSend(v44, "drawAtPoint:", v71, v74, v117);
        }

        v31 = v141;
        v28 = v142;
        v34 = v67;
        v35 = v139;
        v33 = v140;
        v42 = v128;
      }
      ++v38;
      ++v41;
    }
    while (v42 + (_DWORD)v38);
  }
  v81 = v36[701];
  if (*(double *)((char *)&v15->super.super.super.isa + v81) >= 0.0)
  {
    objc_msgSend((id)objc_opt_class(), "_dynamicFontSizeForOrientation:", v15->_orientation);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = *(double *)((char *)&v15->super.super.super.isa + v81);
    v84 = (int)v83;
    v85 = (v83 - (float)(int)v83) * 60.0;
    v86 = (int)(v85 / 15.0);
    *(float *)&v85 = v85;
    v87 = (int)(float)(roundf(*(float *)&v85) / 5.0);
    if (v87 > 0xB || ((1 << v87) & 0x882) == 0)
    {
      if (v86 <= 0)
      {
LABEL_73:

        goto LABEL_74;
      }
      v89 = v34;
      CUIKLocalizedStringForInteger();
      v90 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v89 = v34;
      CUIKLocalizedStringForIntegerWithMinimumTwoDigits();
      v90 = objc_claimAutoreleasedReturnValue();
    }
    v91 = (void *)v90;
    objc_msgSend(CFSTR(":"), "stringByAppendingString:", v90, v117);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    v146 = *MEMORY[0x1E0DC1138];
    v147 = v82;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "sizeWithAttributes:", v93);
    v95 = v94;

    v15 = v126;
    -[EKDayTimeView contentScaleFactor](v126, "contentScaleFactor");
    if (v96 == 1.0)
      v97 = 1.0;
    else
      v97 = 0.0;
    if (CalInterfaceIsLeftToRight())
    {
      -[EKDayTimeView timeWidth](v126, "timeWidth");
      v99 = v98 - v133 - v95 + v97;
    }
    else
    {
      v99 = v133 - v97;
    }
    v100 = v135 * 0.25 + -4.0;
    if (v35 < v100)
      v100 = v35;
    if (v87 != 1)
      v100 = -0.0;
    v101 = v134 - v138 + -7.0 + v135 * (double)(v84 - (int)v117) + v135 * 0.25 * (double)v86 + v100;
    IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v126);
    v103 = -1.5;
    if (IsRegularInViewHierarchy)
      v103 = 1.0;
    v104 = v101 + v103;
    if (v86 != 3)
      v104 = v101;
    v105 = 0.5;
    if (IsRegularInViewHierarchy)
      v105 = 2.0;
    v106 = v101 + v105;
    if (v86 == 1 || v87 == 1)
      v108 = v106;
    else
      v108 = v104;
    v156.origin.x = v99;
    v156.origin.y = v108;
    v156.size.width = v89;
    v143 = v89;
    v156.size.height = v35;
    v109 = v99;
    v110 = CGRectGetMinY(v156);
    v157.origin.x = v28;
    v157.origin.y = v137;
    v157.size.width = v31;
    v157.size.height = v33;
    if (v110 > CGRectGetMaxY(v157) + 0.0)
      goto LABEL_71;
    v158.origin.x = v109;
    v158.origin.y = v108;
    v158.size.width = v143;
    v158.size.height = v35;
    v111 = CGRectGetMaxY(v158);
    v159.origin.x = v28;
    v159.origin.y = v137;
    v159.size.width = v31;
    v159.size.height = v33;
    if (v111 < CGRectGetMinY(v159))
    {
LABEL_71:
      objc_msgSend(MEMORY[0x1E0DC3658], "cuik_timelineHourColor");
      v112 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v112, "CGColor");
      UISetColor();

      objc_msgSend(v92, "_legacy_drawAtPoint:withFont:", v82, CalRoundPointToScreenScale(v109, v108));
    }

    goto LABEL_73;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor", v117);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)v15 + 432) & 1) != 0)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetShouldAntialias(CurrentContext, 0);
    objc_msgSend(objc_retainAutorelease(v113), "CGColor");
    UISetColor();
    v160.size.height = v120;
    v160.origin.x = v121;
    v160.origin.y = v138;
    v160.size.width = rect;
    v161.size.height = CGRectGetHeight(v160);
    v161.origin.x = 0.0;
    v161.origin.y = 0.0;
    v161.size.width = 1.0;
    UIRectFill(v161);
  }
  if ((*((_BYTE *)v15 + 432) & 2) != 0)
  {
    v115 = UIGraphicsGetCurrentContext();
    CGContextSaveGState(v115);
    CGContextSetShouldAntialias(v115, 0);
    objc_msgSend(objc_retainAutorelease(v113), "CGColor");
    UISetColor();
    v162.origin.x = v121;
    v162.origin.y = v138;
    v162.size.width = rect;
    v162.size.height = v120;
    v116 = CGRectGetWidth(v162) + -1.0;
    v163.origin.x = v121;
    v163.origin.y = v138;
    v163.size.width = rect;
    v163.size.height = v120;
    v164.size.height = CGRectGetHeight(v163);
    v164.origin.y = 0.0;
    v164.size.width = 1.0;
    v164.origin.x = v116;
    UIRectFill(v164);
  }

}

- (EKDayTimeViewDelegate)delegate
{
  return (EKDayTimeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIColor)timeColor
{
  UIColor *timeColor;
  UIColor *v4;
  UIColor *v5;

  timeColor = self->_timeColor;
  if (!timeColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_timeColor;
    self->_timeColor = v4;

    timeColor = self->_timeColor;
  }
  return timeColor;
}

+ (double)_timeVerticalInsetForOrientation:(int64_t)a3 inViewHierarchy:(id)a4
{
  _BOOL4 IsRegularInViewHierarchy;
  double result;
  double v7;

  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(a4);
  result = -3.5;
  v7 = -3.0;
  if ((unint64_t)(a3 - 1) >= 2)
    v7 = -3.5;
  if (!IsRegularInViewHierarchy)
    return v7;
  return result;
}

+ (id)_hourFontForOrientation:(int64_t)a3
{
  double v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_dynamicFontSizeForOrientation:", a3);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v3 * 1.36363636);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "cuik_createFontFromFont:withFontGrade:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (double)_dynamicFontSizeForOrientation:(int64_t)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  v6 = v5;

  CalRoundToScreenScale(v6);
  return fmin(v7, 24.0);
}

+ (void)_setWidth:(double)a3 forOrientation:(int64_t)a4 sizeClass:(int64_t)a5 excludeCurrentTime:(BOOL)a6
{
  _BOOL4 v6;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v6 = a6;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a4 - 1;
  v10 = !a6;
  v11 = (unint64_t)(a4 - 1) > 1 || !a6;
  if (v11 || a5 != 2)
  {
    if (a5 == 2)
      v11 = 1;
    if (v11)
    {
      if (v9 < 2)
        v10 = 1;
      if (v10 || a5 != 2)
      {
        if (a5 == 2)
          v10 = 1;
        if (v10)
        {
          v12 = (unint64_t)(a4 - 1) > 1 || a6;
          if ((unint64_t)(a4 - 1) > 1 || a6 || a5 != 2)
          {
            if (a5 == 2)
              v12 = 1;
            if (v12)
            {
              v13 = v9 < 2 || a6;
              if (v13 || a5 != 2)
              {
                if (a5 == 2)
                  v13 = 1;
                if (v13)
                {
                  v14 = (void *)kEKUILogHandle;
                  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
                  {
                    v15 = v14;
                    v16 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v16);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v18 = 138413058;
                    v19 = v17;
                    v20 = 1024;
                    v21 = v6;
                    v22 = 2048;
                    v23 = a4;
                    v24 = 2048;
                    v25 = a5;
                    _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_ERROR, "[%@] Unhandled combination of excludeCurrentTime:%d, orientation:%ld, sizeClass:%ld when trying to setWidth", (uint8_t *)&v18, 0x26u);

                  }
                }
                else
                {
                  __HourWidthLandscapeCompact = *(_QWORD *)&a3;
                }
              }
              else
              {
                __HourWidthLandscapeRegular = *(_QWORD *)&a3;
              }
            }
            else
            {
              __HourWidthPortraitCompact = *(_QWORD *)&a3;
            }
          }
          else
          {
            __HourWidthPortraitRegular = *(_QWORD *)&a3;
          }
        }
        else
        {
          __HourWidthExcludingCurrentTimeLandscapeCompact = *(_QWORD *)&a3;
        }
      }
      else
      {
        __HourWidthExcludingCurrentTimeLandscapeRegular = *(_QWORD *)&a3;
      }
    }
    else
    {
      __HourWidthExcludingCurrentTimePortraitCompact = *(_QWORD *)&a3;
    }
  }
  else
  {
    __HourWidthExcludingCurrentTimePortraitRegular = *(_QWORD *)&a3;
  }
}

uint64_t __36__EKDayTimeView_setShowsTimeMarker___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 1.0);
}

+ (void)_invalidateCachedValues
{
  __AllDayWidth = 0xBFF0000000000000;
}

+ (void)_invalidateWidth
{
  id v2;

  __HourWidthPortraitRegular = 0;
  __HourWidthPortraitCompact = 0;
  __HourWidthLandscapeRegular = 0;
  __HourWidthLandscapeCompact = 0;
  __HourWidthExcludingCurrentTimePortraitRegular = 0;
  __HourWidthExcludingCurrentTimePortraitCompact = 0;
  __HourWidthExcludingCurrentTimeLandscapeRegular = 0;
  __HourWidthExcludingCurrentTimeLandscapeCompact = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("EKDayTimeViewHourWidthChangedNotification"), 0);

}

+ (id)_noonFontForOrientation:(int64_t)a3
{
  objc_msgSend(a1, "_dynamicFontSizeForOrientation:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:");
}

+ (double)hourWidthForSizeClass:(int64_t)a3 orientation:(int64_t)a4
{
  double result;

  objc_msgSend(a1, "_widthForOrientation:sizeClass:excludeCurrentTime:", a4, a3, 1);
  if (result == 0.0)
  {
    objc_msgSend(a1, "_calculateWidthForSizeClass:orientation:excludeCurrentTime:", a3, a4, 1);
    objc_msgSend(a1, "_widthForOrientation:sizeClass:excludeCurrentTime:", a4, a3, 1);
  }
  return result;
}

- (double)defaultHeight
{
  double result;
  double hoursToPad;

  +[EKDayTimeView defaultHeightForSizeClass:orientation:withHourScale:](EKDayTimeView, "defaultHeightForSizeClass:orientation:withHourScale:", -[EKDayTimeView _sizeClass](self, "_sizeClass"), self->_orientation, self->_hourHeightScale);
  hoursToPad = self->_hoursToPad;
  if (hoursToPad > 0.0)
    return result + hoursToPad * self->_hourHeight * 2.0;
  return result;
}

+ (id)unscaledAllDayLabelFont
{
  return +[EKDayAllDayView unscaledAllDayFont](EKDayAllDayView, "unscaledAllDayFont");
}

+ (id)allDayLabelFont
{
  return +[EKDayAllDayView allDayLabelFont](EKDayAllDayView, "allDayLabelFont");
}

+ (id)allDayLabelBoldFont
{
  return +[EKDayAllDayView allDayLabelBoldFont](EKDayAllDayView, "allDayLabelBoldFont");
}

+ (double)heightOfHourTextForHour:(int64_t)a3 orientation:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_hourFontForOrientation:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKStringForHour();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC1138];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeWithAttributes:", v6);
  v8 = v7;

  return v8;
}

- (EKDayTimeView)initWithFrame:(CGRect)a3
{
  return -[EKDayTimeView initWithFrame:sizeClass:](self, "initWithFrame:sizeClass:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_contentViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setOwner:", 0);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)EKDayTimeView;
  -[EKDayTimeView dealloc](&v8, sel_dealloc);
}

- (void)_localeChanged
{
  -[EKDayTimeView _flushTimeStringImageCache](self, "_flushTimeStringImageCache");
  +[EKDayTimeView _invalidateWidth](EKDayTimeView, "_invalidateWidth");
  -[EKDayTimeView _invalidateTimeWidth](self, "_invalidateTimeWidth");
  -[EKDayTimeView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_fontSizeChanged
{
  -[EKDayTimeView _flushTimeStringImageCache](self, "_flushTimeStringImageCache");
  +[EKDayTimeView _invalidateWidth](EKDayTimeView, "_invalidateWidth");
  -[EKDayTimeView _invalidateTimeWidth](self, "_invalidateTimeWidth");
  -[EKDayTimeView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_sizeClassChanged
{
  -[EKDayTimeView _flushTimeStringImageCache](self, "_flushTimeStringImageCache");
  +[EKDayTimeView _invalidateWidth](EKDayTimeView, "_invalidateWidth");
  -[EKDayTimeView _invalidateTimeWidth](self, "_invalidateTimeWidth");
  -[EKDayTimeView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_flushTimeStringImageCache
{
  uint64_t v2;
  UIImage **cachedHours;
  UIImage *v4;

  v2 = 0;
  cachedHours = self->_cachedHours;
  do
  {
    v4 = cachedHours[v2];
    cachedHours[v2] = 0;

    ++v2;
  }
  while (v2 != 25);
}

- (double)timeWidth
{
  double result;

  result = self->_timeWidth;
  if (result == 0.0)
  {
    +[EKDayTimeView timeWidthForOrientation:inViewHierarchy:](EKDayTimeView, "timeWidthForOrientation:inViewHierarchy:", self->_orientation, self);
    self->_timeWidth = result;
  }
  return result;
}

- (void)setHoursToRender:(_NSRange)a3
{
  if (self->_hoursToRender.location != a3.location || self->_hoursToRender.length != a3.length)
  {
    self->_hoursToRender = a3;
    -[EKDayTimeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setHourHeightScale:(double)a3
{
  self->_hourHeightScale = a3;
  -[EKDayTimeView updateHourHeight](self, "updateHourHeight");
  -[EKDayTimeView layoutFrames](self, "layoutFrames");
  -[EKDayTimeView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setShowsLeftBorder:(BOOL)a3
{
  char v3;
  _BOOL4 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v3 = *((_BYTE *)self + 432);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    *((_BYTE *)self + 432) = v3 & 0xFE | a3;
    -[EKDayTimeView frame](self, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[EKDayTimeView timeWidth](self, "timeWidth");
    if (v4)
      v13 = v12 + 1.0;
    else
      v13 = v12;
    -[EKDayTimeView setFrame:](self, "setFrame:", v7, v9, v13, v11);
    -[EKDayTimeView superview](self, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

    -[EKDayTimeView setNeedsLayout](self, "setNeedsLayout");
    -[EKDayTimeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)showsLeftBorder
{
  return *((_BYTE *)self + 432) & 1;
}

- (void)setShowsRightBorder:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 432);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 2;
    else
      v4 = 0;
    *((_BYTE *)self + 432) = v3 & 0xFD | v4;
    -[EKDayTimeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)showsRightBorder
{
  return (*((unsigned __int8 *)self + 432) >> 1) & 1;
}

- (void)setHighlightedHour:(double)a3
{
  double v5;
  double v6;
  double hoursToPad;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double highlightedHour;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_highlightedHour != a3)
  {
    -[EKDayTimeView scaledHourHeight](self, "scaledHourHeight");
    v6 = v5;
    hoursToPad = self->_hoursToPad;
    v8 = 18.0;
    if (hoursToPad > 0.0)
      v8 = hoursToPad * self->_hourHeight + 18.0;
    -[EKDayTimeView bounds](self, "bounds");
    v10 = v9;
    -[EKDayTimeView bounds](self, "bounds");
    v12 = v11;
    -[EKDayTimeView bounds](self, "bounds");
    v14 = v13;
    highlightedHour = self->_highlightedHour;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = self->_contentViews;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = v8 - (v10 + 5.0);
      v20 = v19 + v6 * (double)(int)a3;
      v21 = v19 + v6 * (double)(int)highlightedHour;
      v22 = v6 + 10.0;
      v23 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v16);
          v25 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v25, "convertRect:fromView:", self, v12, v21, v14, v22, (_QWORD)v26);
          objc_msgSend(v25, "setNeedsDisplayInRect:");
          objc_msgSend(v25, "convertRect:fromView:", self, v12, v20, v14, v22);
          objc_msgSend(v25, "setNeedsDisplayInRect:");
        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
    }

    self->_highlightedHour = a3;
  }
}

- (double)highlightedHour
{
  return self->_highlightedHour;
}

- (void)setTimeColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_timeColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_timeColor, a3);
    -[EKDayTimeView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (EKCurrentTimeMarkerView)timeMarker
{
  return self->_timeMarker;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[EKDayTimeView timeWidth](self, "timeWidth", a3.width, a3.height);
  v5 = v4;
  -[EKDayTimeView defaultHeight](self, "defaultHeight");
  v7 = v6;
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

uint64_t __55__EKDayTimeView_drawRect_forContentView_withHourRange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", 0.0, 0.0);
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKDayTimeView;
  -[EKDayTimeView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[EKCurrentTimeMarkerView setSemanticContentAttribute:](self->_timeMarker, "setSemanticContentAttribute:", a3);
}

- (void)setVisualEffect:(id)a3
{
  UIVisualEffect *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (UIVisualEffect *)a3;
  if (self->_visualEffect != v5)
  {
    objc_storeStrong((id *)&self->_visualEffect, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSMutableDictionary allValues](self->_visualEffectViews, "allValues", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setEffect:", v5);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

uint64_t __36__EKDayTimeView_setShowsTimeMarker___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 472), "setAlpha:", 0.0);
}

uint64_t __36__EKDayTimeView_setShowsTimeMarker___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)setShowsTimeMarkerExtension:(BOOL)a3
{
  UIView *v4;
  UIView *timeMarkerExtension;
  UIView *v6;

  if (self->_showsTimeMarkerExtension != a3)
  {
    self->_showsTimeMarkerExtension = a3;
    if (a3)
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      timeMarkerExtension = self->_timeMarkerExtension;
      self->_timeMarkerExtension = v4;

      -[UIView setBackgroundColor:](self->_timeMarkerExtension, "setBackgroundColor:", self->_timeMarkerExtensionColor);
      -[EKDayTimeView addSubview:](self, "addSubview:", self->_timeMarkerExtension);
    }
    else
    {
      -[UIView removeFromSuperview](self->_timeMarkerExtension, "removeFromSuperview");
      v6 = self->_timeMarkerExtension;
      self->_timeMarkerExtension = 0;

    }
    -[EKDayTimeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTimeMarkerExtensionColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_timeMarkerExtensionColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeMarkerExtensionColor, a3);
    -[UIView setBackgroundColor:](self->_timeMarkerExtension, "setBackgroundColor:", v5);
  }

}

+ (double)positionOfSecond:(int64_t)a3 hourHeight:(double)a4 topPadding:(double)a5 clampToBounds:(BOOL)a6
{
  int64_t v6;
  double result;

  v6 = a3 & ~(a3 >> 63);
  if ((unint64_t)v6 >= 0x15180)
    v6 = 86400;
  if (!a6)
    v6 = a3;
  CalRoundToScreenScale(a5 + a4 * 24.0 * ((double)v6 / 86400.0));
  return result;
}

+ (CGRect)timeMarkerFrameForTotalWidth:(double)a3 timeWidth:(double)a4 timeMarker:(id)a5 hourHeight:(double)a6 topPadding:(double)a7
{
  id v12;
  int IsLeftToRight;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  v12 = a5;
  IsLeftToRight = CalInterfaceIsLeftToRight();
  v14 = objc_msgSend(v12, "showsThumb");
  v15 = 0.0;
  if (IsLeftToRight)
  {
    if (v14)
    {
      objc_msgSend(v12, "markerWidth");
      v17 = a4 - v16;
      objc_msgSend(v12, "markerInset");
      v15 = v17 - v18;
      a3 = a3 - v15;
    }
  }
  else if (v14)
  {
    objc_msgSend(v12, "markerWidth");
    v20 = a3 - a4 + v19;
    objc_msgSend(v12, "markerInset");
    a3 = v20 + v21;
  }
  CUIKNowComponents();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "positionOfSecond:hourHeight:topPadding:clampToBounds:", (int)((double)objc_msgSend(v22, "second")+ (double)(3600 * objc_msgSend(v22, "hour") + 60 * objc_msgSend(v22, "minute"))), 1, a6, a7);
  v24 = v23;
  objc_msgSend(v12, "bounds");
  v26 = v24 + v25 * -0.5;
  objc_msgSend(v12, "bounds");
  v28 = v27;

  v29 = v15;
  v30 = v26;
  v31 = a3;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

+ (CGRect)_timeLineExtensionFrameForTimeWidth:(double)a3 timeMarker:(id)a4 timeLabelXPosition:(double)a5 yPosition:(double)a6
{
  id v8;
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
  CGRect result;

  v8 = a4;
  v9 = 0.0;
  if (CalInterfaceIsLeftToRight())
  {
    objc_msgSend(v8, "markerWidth");
    v9 = v10 + a5;
  }
  objc_msgSend(v8, "extensionLineHeight");
  v12 = v11;
  v13 = a6 + v11 * -0.5;
  objc_msgSend(v8, "markerInset");
  v15 = v14;

  v16 = v9;
  v17 = v13;
  v18 = v15;
  v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)showsTimeMarkerExtension
{
  return self->_showsTimeMarkerExtension;
}

- (UIColor)timeMarkerExtensionColor
{
  return self->_timeMarkerExtensionColor;
}

- (double)hoursToPad
{
  return self->_hoursToPad;
}

- (void)setHoursToPad:(double)a3
{
  self->_hoursToPad = a3;
}

- (_NSRange)hoursToRender
{
  _NSRange *p_hoursToRender;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_hoursToRender = &self->_hoursToRender;
  location = self->_hoursToRender.location;
  length = p_hoursToRender->length;
  result.length = length;
  result.location = location;
  return result;
}

- (double)hourHeightScale
{
  return self->_hourHeightScale;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_visualEffect, 0);
  objc_storeStrong((id *)&self->_timeMarkerExtensionColor, 0);
  objc_storeStrong((id *)&self->_timeColor, 0);
  for (i = 24; i != -1; --i)
    objc_storeStrong((id *)&self->_cachedHours[i], 0);
  objc_storeStrong((id *)&self->_timeMarkerExtension, 0);
  objc_storeStrong((id *)&self->_timeMarker, 0);
  objc_storeStrong((id *)&self->_visualEffectViews, 0);
  objc_storeStrong((id *)&self->_contentViews, 0);
}

@end
