@implementation EKDayView

- (void)willMoveToWindow:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;

  v8 = a3;
  -[EKDayView window](self, "window");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = (void *)v4;
  if (!v8 || v4)
  {
    if (v8)
      goto LABEL_8;
    -[EKDayView _invalidateMarkerTimer](self, "_invalidateMarkerTimer");
  }
  else
  {
    v7 = -[EKDayView showsTimeLine](self, "showsTimeLine");
    v5 = v8;
    if (!v7)
      goto LABEL_8;
    -[EKDayView _startMarkerTimer](self, "_startMarkerTimer");
  }
  v5 = v8;
LABEL_8:
  if (self->_layoutWhenJoiningViewHierarchy)
  {
    EKUIPushFallbackSizingContextWithViewHierarchy(v5);
    -[EKDayView layoutSubviews](self, "layoutSubviews");
    EKUIPopFallbackSizingContextWithViewHierarchy(v8);
    v5 = v8;
    self->_layoutWhenJoiningViewHierarchy = 0;
  }
  if (v5)
    -[EKDayView shouldAnnotateAppEntitiesChanged](self, "shouldAnnotateAppEntitiesChanged");

}

- (BOOL)showsTimeLine
{
  void *v2;
  char v3;

  -[EKDayViewContent grid](self->_dayContent, "grid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsTimeLine");

  return v3;
}

- (void)_startMarkerTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSTimer *v9;
  NSTimer *timeMarkerTimer;
  void *v11;
  id v12;

  if (!self->_timeMarkerTimer)
  {
    CUIKCalendar();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    CUIKCalendar();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "components:fromDate:", 126, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "dateFromComponents:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setMinute:", 1);
    objc_msgSend(v12, "dateByAddingComponents:toDate:options:", v7, v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v8, self, sel_updateMarkerPosition, 0, 1, 60.0);
    timeMarkerTimer = self->_timeMarkerTimer;
    self->_timeMarkerTimer = v9;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTimer:forMode:", self->_timeMarkerTimer, *MEMORY[0x1E0C99748]);

  }
}

- (BOOL)_viewContentShouldDrawSynchronously
{
  EKDayViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  char v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_msgSend(v6, "dayViewShouldDrawSynchronously:", self);

  return v7;
}

- (void)setTodayScrollSecondBuffer:(double)a3
{
  self->_todayScrollSecondBuffer = a3;
}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EKDayView;
  -[EKDayView setOpaque:](&v6, sel_setOpaque_);
  -[UIScrollView setOpaque:](self->_scroller, "setOpaque:", v3);
  -[EKDayTimeView setOpaque:](self->_timeView, "setOpaque:", v3);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKDayView;
  v4 = a3;
  -[EKDayView setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[UIScrollView setBackgroundColor:](self->_scroller, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
  -[EKDayTimeView setBackgroundColor:](self->_timeView, "setBackgroundColor:", v4);

}

- (void)_createAllDayViewWithSizeClass:(int64_t)a3 rightClickDelegate:(id)a4
{
  id v6;
  EKDayAllDayView *v7;
  EKDayAllDayView *v8;
  EKDayAllDayView *allDayView;
  EKDayAllDayView *v10;
  EKUIRightClickEmptySpaceInteraction *v11;
  id v12;

  v6 = a4;
  if (!self->_allDayView)
  {
    v12 = v6;
    v7 = [EKDayAllDayView alloc];
    -[EKDayView bounds](self, "bounds");
    v8 = -[EKDayAllDayView initWithFrame:sizeClass:](v7, "initWithFrame:sizeClass:", a3);
    allDayView = self->_allDayView;
    self->_allDayView = v8;

    -[EKDayAllDayView setDelegate:](self->_allDayView, "setDelegate:", self);
    -[EKDayAllDayView setAllowsOccurrenceSelection:](self->_allDayView, "setAllowsOccurrenceSelection:", self->_allowsOccurrenceSelection);
    -[EKDayAllDayView setOrientation:](self->_allDayView, "setOrientation:", self->_orientation);
    -[EKDayAllDayView setShowsBorderLines:](self->_allDayView, "setShowsBorderLines:", 1);
    -[EKDayView addSubview:](self, "addSubview:", self->_allDayView);
    v6 = v12;
    if (v12)
    {
      v10 = self->_allDayView;
      v11 = -[EKUIRightClickEmptySpaceInteraction initWithDelegate:]([EKUIRightClickEmptySpaceInteraction alloc], "initWithDelegate:", v12);
      -[EKDayAllDayView addInteraction:](v10, "addInteraction:", v11);

      v6 = v12;
    }
  }

}

- (void)setOrientation:(int64_t)a3
{
  double v5;

  -[EKDayView bounds](self, "bounds");
  if (v5 > 0.0 && v5 < EKUIWidthForWindowSizeParadigm(4))
    a3 = 4;
  self->_orientation = a3;
  -[EKDayViewContent setOrientation:](self->_dayContent, "setOrientation:", a3);
  -[EKDayTimeView setOrientation:](self->_timeView, "setOrientation:", a3);
  -[EKDayAllDayView setOrientation:](self->_allDayView, "setOrientation:", a3);
  -[EKDayView setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)currentTimeRectInView:(id)a3 requireThumb:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  v4 = a4;
  v6 = a3;
  v7 = *MEMORY[0x1E0C9D628];
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (-[EKDayView showsTimeMarker](self, "showsTimeMarker"))
  {
    -[EKDayViewContent grid](self->_dayContent, "grid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeMarker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (!v4 || objc_msgSend(v12, "showsThumb")))
    {
      objc_msgSend(v12, "currentTimeFrame");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      objc_msgSend(v12, "superview");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "convertRect:fromView:", v21, v14, v16, v18, v20);
      v7 = v22;
      v8 = v23;
      v9 = v24;
      v10 = v25;

    }
  }

  v26 = v7;
  v27 = v8;
  v28 = v9;
  v29 = v10;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (BOOL)showsTimeMarker
{
  void *v2;
  char v3;

  -[EKDayViewContent grid](self->_dayContent, "grid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsTimeMarker");

  return v3;
}

- (void)allDayViewDidLayoutSubviews:(id)a3
{
  EKDayViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "dayView:didCreateOccurrenceViews:", self, 0);

  }
}

uint64_t __37__EKDayView_loadData_withCompletion___block_invoke_3(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  uint64_t result;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "clearTemporaryViews");
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[452])
  {
    objc_msgSend(v2, "scrollEventsIntoViewAnimated:", 1);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 452) = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EKDayView_loadData_withCompletion___block_invoke_4;
  block[3] = &unk_1E6018688;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(a1 + 32), "contentDidChangeCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentDidChangeCallback");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "occurrenceViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, objc_msgSend(v5, "count"));

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  if (!*(_BYTE *)(a1 + 49))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setNeedsLayout");
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  EKDayAllDayView *allDayView;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  int IsLeftToRight;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  EKDayAllDayView *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  int outlineStyle;
  UIView *bottomLine;
  double MaxY;
  double v60;
  double v61;
  double v62;
  EKDayViewContent *dayContent;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  objc_super v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v78.receiver = self;
  v78.super_class = (Class)EKDayView;
  -[EKDayView layoutSubviews](&v78, sel_layoutSubviews);
  -[UIScrollView contentInset](self->_scroller, "contentInset");
  v4 = v3;
  allDayView = self->_allDayView;
  if (allDayView)
  {
    -[EKDayAllDayView frame](allDayView, "frame");
    v7 = v6;
    -[EKDayView bounds](self, "bounds");
    v9 = v8;
    -[EKDayAllDayView naturalHeight](self->_allDayView, "naturalHeight");
    -[EKDayAllDayView setFrame:](self->_allDayView, "setFrame:", v7, v4, v9, v10);
    -[EKDayAllDayView sizeToFit](self->_allDayView, "sizeToFit");
    -[EKDayAllDayView naturalHeight](self->_allDayView, "naturalHeight");
    v4 = v11;
  }
  -[EKDayView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[EKDayView scrollBarOffset](self, "scrollBarOffset");
  v19 = v18;
  -[EKDayTimeView updateHourHeight](self->_timeView, "updateHourHeight");
  -[EKDayViewContent grid](self->_dayContent, "grid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateHourHeight");

  +[EKDayTimeView defaultHeightForSizeClass:orientation:withHourScale:](EKDayTimeView, "defaultHeightForSizeClass:orientation:withHourScale:", -[EKDayView _sizeClass](self, "_sizeClass"), self->_orientation, self->_hourScale);
  v77 = v21;
  +[EKDayTimeView timeWidthForOrientation:inViewHierarchy:](EKDayTimeView, "timeWidthForOrientation:inViewHierarchy:", self->_orientation, self);
  v23 = v22;
  -[EKDayView window](self, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
    self->_layoutWhenJoiningViewHierarchy = 1;
  v25 = v17 - v4;
  v26 = v19 + v15;
  v27 = v23;
  v28 = v23;
  if (-[EKDayView sizeTimeViewUsingOnlyHourText](self, "sizeTimeViewUsingOnlyHourText"))
  {
    +[EKDayTimeView hourWidthForSizeClass:orientation:](EKDayTimeView, "hourWidthForSizeClass:orientation:", -[EKDayView _sizeClass](self, "_sizeClass"), self->_orientation);
    v30 = v29;
    if (CalInterfaceIsLeftToRight())
    {
      -[EKDayView additionalLeftPadding](self, "additionalLeftPadding");
      v32 = v30 + v31;
      v33 = v32;
    }
    else
    {
      +[EKDayTimeView timeInsetForSizeClass:orientation:](EKDayTimeView, "timeInsetForSizeClass:orientation:", -[EKDayView _sizeClass](self, "_sizeClass"), self->_orientation);
      v35 = v34;
      -[EKDayView layoutMargins](self, "layoutMargins");
      v33 = v30 + v35 + v36;
      -[EKDayView layoutMargins](self, "layoutMargins");
      v32 = v33 - v37;
    }
    v27 = CalFloorToScreenScale(v32);
    CalRoundToScreenScale(v33);
    v28 = v38;
  }
  v75 = v27;
  v76 = v23;
  v79.origin.x = v13;
  v79.origin.y = v4;
  v79.size.width = v26;
  v79.size.height = v25;
  CGRectGetWidth(v79);
  -[EKDayView scrollBarOffset](self, "scrollBarOffset");
  -[EKDayView _verticalOffset](self, "_verticalOffset");
  v39 = v26;
  v40 = v4;
  v41 = v13;
  v43 = v42;
  IsLeftToRight = CalInterfaceIsLeftToRight();
  v45 = 0.0;
  if (IsLeftToRight)
    v45 = v28;
  -[EKDayViewContent setFrame:](self->_dayContent, "setFrame:", v45);
  -[UIScrollView contentOffset](self->_scroller, "contentOffset");
  v47 = v46;
  v49 = v48;
  v80.origin.x = v41;
  v80.origin.y = v40;
  v80.size.width = v39;
  v80.size.height = v25;
  -[UIScrollView setContentSize:](self->_scroller, "setContentSize:", CGRectGetWidth(v80), v77 + v43 * -2.0);
  -[UIScrollView setContentOffset:](self->_scroller, "setContentOffset:", v47, v49);
  v50 = self->_allDayView;
  +[EKDayTimeView timeInsetForSizeClass:orientation:](EKDayTimeView, "timeInsetForSizeClass:orientation:", -[EKDayView _sizeClass](self, "_sizeClass"), self->_orientation);
  -[EKDayAllDayView setOccurrenceInset:labelInset:](v50, "setOccurrenceInset:labelInset:", v75, v75 - v51);
  -[UIScrollView frame](self->_scroller, "frame");
  v86.origin.x = v41;
  v86.origin.y = v40;
  v86.size.width = v39;
  v86.size.height = v25;
  if (!CGRectEqualToRect(v81, v86))
    -[UIScrollView setFrame:](self->_scroller, "setFrame:", v41, v40, v39, v25);
  if (CalInterfaceIsLeftToRight())
  {
    v52 = v76;
    v53 = v28 - v76;
  }
  else
  {
    -[EKDayViewContent frame](self->_dayContent, "frame");
    v55 = v54;
    -[EKDayViewContent frame](self->_dayContent, "frame");
    v53 = v55 + v56;
    v52 = v76;
  }
  -[EKDayTimeView setFrame:](self->_timeView, "setFrame:", v53, -v43, v52, v77);
  outlineStyle = self->_outlineStyle;
  if (outlineStyle == 2)
  {
    bottomLine = self->_bottomLine;
    v83.origin.x = v41;
    v83.origin.y = v40;
    v83.size.width = v39;
    v83.size.height = v25;
    MaxY = CGRectGetMaxY(v83);
    -[EKDayView scrollBarOffset](self, "scrollBarOffset");
    v61 = v39 - v28 - v62;
    goto LABEL_21;
  }
  if (outlineStyle == 1)
  {
    bottomLine = self->_bottomLine;
    v82.origin.x = v41;
    v82.origin.y = v40;
    v82.size.width = v39;
    v82.size.height = v25;
    MaxY = CGRectGetMaxY(v82);
    -[EKDayView scrollBarOffset](self, "scrollBarOffset");
    v61 = v39 - v60;
    v28 = 0.0;
LABEL_21:
    -[UIView setFrame:](bottomLine, "setFrame:", v28, MaxY, v61, 1.0);
  }
  dayContent = self->_dayContent;
  -[UIScrollView bounds](self->_scroller, "bounds");
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v71 = v70;
  -[EKDayViewContent frame](self->_dayContent, "frame");
  v73 = -v72;
  v84.origin.x = v65;
  v84.origin.y = v67;
  v84.size.width = v69;
  v84.size.height = v71;
  v85 = CGRectOffset(v84, 0.0, v73);
  -[EKDayViewContent rectBecameVisible:](dayContent, "rectBecameVisible:", v85.origin.x, v85.origin.y, v85.size.width, v85.size.height);
  -[EKDayViewContent grid](self->_dayContent, "grid");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "updateMarkerPosition");

}

- (int)_secondAtPosition:(double)a3
{
  void *v5;
  double v6;
  int v7;
  int v8;

  -[EKDayViewContent grid](self->_dayContent, "grid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView _verticalOffset](self, "_verticalOffset");
  v7 = objc_msgSend(v5, "secondAtPosition:", v6 + a3);

  if (v7 >= (int)(self->_dayEnd - self->_dayStart))
    v8 = (int)(self->_dayEnd - self->_dayStart);
  else
    v8 = v7;
  if (v7 >= 0)
    return v8;
  else
    return (int)(self->_dayEnd - self->_dayStart);
}

- (double)_verticalOffset
{
  _BOOL4 v2;
  double result;
  double v4;

  v2 = -[EKDayView alignsMidnightToTop](self, "alignsMidnightToTop");
  result = 0.0;
  if (v2)
  {
    +[EKDayTimeView verticalPadding](EKDayTimeView, "verticalPadding", 0.0);
    return v4 + 1.0;
  }
  return result;
}

- (BOOL)alignsMidnightToTop
{
  return self->_alignsMidnightToTop;
}

- (double)scrollBarOffset
{
  double result;

  result = 0.0;
  if (!self->_scrollbarShowsInside)
    return 10.0;
  return result;
}

- (int64_t)_sizeClass
{
  void *v3;

  -[EKDayView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return EKUIWidthSizeClassForViewHierarchy(self);
  else
    return self->_targetSizeClass;
}

- (BOOL)sizeTimeViewUsingOnlyHourText
{
  return self->_sizeTimeViewUsingOnlyHourText;
}

- (int)firstVisibleSecond
{
  double v3;

  -[UIScrollView contentOffset](self->_scroller, "contentOffset");
  return -[EKDayView _secondAtPosition:](self, "_secondAtPosition:", v3);
}

- (void)setFirstVisibleSecond:(int)a3
{
  uint64_t v3;
  CGSize *p_scrolledToFirstVisibleSecondForSize;
  double v6;
  double width;
  double height;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIScrollView *scroller;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;

  v3 = *(_QWORD *)&a3;
  p_scrolledToFirstVisibleSecondForSize = &self->_scrolledToFirstVisibleSecondForSize;
  -[UIScrollView bounds](self->_scroller, "bounds");
  width = p_scrolledToFirstVisibleSecondForSize->width;
  height = p_scrolledToFirstVisibleSecondForSize->height;
  v10 = p_scrolledToFirstVisibleSecondForSize->width == v9 && height == v6;
  if (!v10 || -[EKDayView firstVisibleSecond](self, "firstVisibleSecond", width, height) != (_DWORD)v3)
  {
    -[UIScrollView contentSize](self->_scroller, "contentSize", width, height);
    v12 = v11;
    -[UIScrollView bounds](self->_scroller, "bounds");
    v14 = v13;
    if ((_DWORD)v3)
    {
      if ((_DWORD)v3 == 86399)
      {
        v15 = v12 - v13;
      }
      else
      {
        -[EKDayView _positionOfSecond:](self, "_positionOfSecond:", v3);
        v15 = v16;
      }
    }
    else
    {
      v15 = 0.0;
    }
    scroller = self->_scroller;
    -[UIScrollView contentInset](scroller, "contentInset");
    if (v15 >= v12 + v18 - v14)
      v19 = v12 + v18 - v14;
    else
      v19 = v15;
    -[UIScrollView setContentOffset:](scroller, "setContentOffset:", 0.0, v19);
    -[UIScrollView bounds](self->_scroller, "bounds");
    p_scrolledToFirstVisibleSecondForSize->width = v20;
    p_scrolledToFirstVisibleSecondForSize->height = v21;
    -[EKDayView firstVisibleSecondChanged](self, "firstVisibleSecondChanged");
  }
}

- (void)firstVisibleSecondChanged
{
  EKDayViewDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  if (!self->_settingDate)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = objc_loadWeakRetained((id *)p_delegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v8, "dayView:firstVisibleSecondChanged:", self, -[EKDayView firstVisibleSecond](self, "firstVisibleSecond"));

      }
    }
  }
}

- (id)allDayViewRequestsCurrentDisplayDate:(id)a3
{
  void *v3;
  double dayStart;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D0C420];
  dayStart = self->_dayStart;
  -[NSCalendar timeZone](self->_calendar, "timeZone", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarDateWithAbsoluteTime:timeZone:", v5, dayStart);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDateComponents)displayDate
{
  return self->_displayDate;
}

- (BOOL)isNowVisible
{
  BOOL result;

  result = -[EKDayView _isTimeMarkerFullyUnobstructed](self, "_isTimeMarkerFullyUnobstructed");
  self->_isNowVisible = result;
  return result;
}

- (void)willMoveToSuperview:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5 && (objc_msgSend(v5, "window"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    if (-[EKDayView showsTimeLine](self, "showsTimeLine"))
      -[EKDayView _startMarkerTimer](self, "_startMarkerTimer");
  }
  else
  {
    -[EKDayView _invalidateMarkerTimer](self, "_invalidateMarkerTimer");
  }

}

- (void)setTimeZone:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToTimeZone:", v4);

  if ((v5 & 1) == 0)
  {
    -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v6);
    -[EKDayView _adjustForDateOrCalendarChange](self, "_adjustForDateOrCalendarChange");
    -[EKDayViewContent setTimeZone:](self->_dayContent, "setTimeZone:", v6);
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void)setCalendar:(id)a3
{
  NSCalendar *v4;
  NSCalendar *calendar;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_calendar) & 1) == 0)
  {
    v4 = (NSCalendar *)objc_msgSend(v6, "copy");
    calendar = self->_calendar;
    self->_calendar = v4;

    -[EKDayView _adjustForDateOrCalendarChange](self, "_adjustForDateOrCalendarChange");
    -[EKDayViewContent setCalendar:](self->_dayContent, "setCalendar:", v6);
  }

}

- (void)setAllowsOccurrenceSelection:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_allowsOccurrenceSelection != a3)
  {
    v3 = a3;
    self->_allowsOccurrenceSelection = a3;
    -[EKDayAllDayView setAllowsOccurrenceSelection:](self->_allDayView, "setAllowsOccurrenceSelection:");
    -[EKDayViewContent setAllowsOccurrenceSelection:](self->_dayContent, "setAllowsOccurrenceSelection:", v3);
  }
}

- (void)setDimmedOccurrence:(id)a3
{
  EKDayAllDayView *allDayView;
  id v5;

  allDayView = self->_allDayView;
  v5 = a3;
  -[EKDayAllDayView setDimmedOccurrence:](allDayView, "setDimmedOccurrence:", v5);
  -[EKDayViewContent setDimmedOccurrence:](self->_dayContent, "setDimmedOccurrence:", v5);

}

- (void)_adjustForDateOrCalendarChange
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  NSInteger v13;
  NSInteger v14;
  NSInteger v15;
  NSInteger v16;
  _BOOL8 v17;
  id v18;

  self->_settingDate = 1;
  -[EKDayView stopScrolling](self, "stopScrolling");
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", self->_displayDate);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  v4 = v3;
  if (v3 != self->_dayStart)
  {
    v5 = (void *)-[NSDateComponents copy](self->_displayDate, "copy");
    objc_msgSend(v5, "setHour:", 23);
    objc_msgSend(v5, "setMinute:", 59);
    objc_msgSend(v5, "setSecond:", 59);
    -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_dayStart = v4;
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    self->_dayEnd = v7;
    -[NSCalendar timeZone](self->_calendar, "timeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_dayStart + -1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextDaylightSavingTimeTransitionAfterDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    self->_nextDSTTransition = v11;

    -[EKDayViewContent setStartDateWithDateComponents:](self->_dayContent, "setStartDateWithDateComponents:", self->_displayDate);
  }
  CUIKTodayComponents();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NSDateComponents era](self->_displayDate, "era");
  v17 = 0;
  if (v13 == objc_msgSend(v12, "era"))
  {
    v14 = -[NSDateComponents year](self->_displayDate, "year");
    if (v14 == objc_msgSend(v12, "year"))
    {
      v15 = -[NSDateComponents month](self->_displayDate, "month");
      if (v15 == objc_msgSend(v12, "month"))
      {
        v16 = -[NSDateComponents day](self->_displayDate, "day");
        if (v16 == objc_msgSend(v12, "day") && self->_shouldEverShowTimeIndicators)
          v17 = 1;
      }
    }
  }
  -[EKDayView setShowsTimeLine:](self, "setShowsTimeLine:", v17);
  -[EKDayView setShowsTimeMarker:](self, "setShowsTimeMarker:", v17);
  -[EKDayTimeView setNeedsDisplay](self->_timeView, "setNeedsDisplay");
  self->_settingDate = 0;

}

- (void)_invalidateMarkerTimer
{
  NSTimer *timeMarkerTimer;

  -[NSTimer invalidate](self->_timeMarkerTimer, "invalidate");
  timeMarkerTimer = self->_timeMarkerTimer;
  self->_timeMarkerTimer = 0;

}

- (void)stopScrolling
{
  UIScrollView *scroller;

  scroller = self->_scroller;
  -[UIScrollView contentOffset](scroller, "contentOffset");
  -[UIScrollView setContentOffset:animated:](scroller, "setContentOffset:animated:", 0);
}

- (void)setShowsTimeMarker:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[EKDayTimeView setShowsTimeMarker:](self->_timeView, "setShowsTimeMarker:");
  -[EKDayViewContent grid](self->_dayContent, "grid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsTimeMarker:", v3);

  if (v3
    && (-[EKDayView superview](self, "superview"), v6 = (void *)objc_claimAutoreleasedReturnValue(),
                                                   v6,
                                                   v6))
  {
    -[EKDayView _startMarkerTimer](self, "_startMarkerTimer");
  }
  else
  {
    -[EKDayView _invalidateMarkerTimer](self, "_invalidateMarkerTimer");
  }
}

- (void)setShowsTimeLine:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKDayViewContent grid](self->_dayContent, "grid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsTimeLine:", v3);

}

- (void)scrollToNowAnimated:(BOOL)a3 whenFinished:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  CUIKNowDate();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[EKDayView scrollToDate:animated:whenFinished:](self, "scrollToDate:animated:whenFinished:", v7, v4, v6);

}

- (void)scrollToDate:(id)a3 offset:(double)a4 animated:(BOOL)a5 whenFinished:(id)a6
{
  _BOOL8 v6;
  double v10;
  double dayStart;
  id v12;

  v6 = a5;
  v12 = a6;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  dayStart = self->_dayStart;
  if (v10 >= dayStart && v10 <= self->_dayEnd)
    -[EKDayView _scrollToSecond:offset:animated:whenFinished:](self, "_scrollToSecond:offset:animated:whenFinished:", (int)(v10 - dayStart), v6, v12, a4);

}

- (void)scrollToDate:(id)a3 animated:(BOOL)a4 whenFinished:(id)a5
{
  -[EKDayView scrollToDate:offset:animated:whenFinished:](self, "scrollToDate:offset:animated:whenFinished:", a3, a4, a5, 0.0);
}

- (void)_scrollToSecond:(int)a3 offset:(double)a4 animated:(BOOL)a5 whenFinished:(id)a6
{
  _BOOL4 v6;
  void (**v10)(_QWORD);
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[7];
  _QWORD aBlock[4];
  void (**v26)(_QWORD);

  v6 = a5;
  v10 = (void (**)(_QWORD))a6;
  -[EKDayView layoutIfNeeded](self, "layoutIfNeeded");
  -[UIScrollView bounds](self->_scroller, "bounds");
  v12 = v11;
  -[UIScrollView contentSize](self->_scroller, "contentSize");
  v14 = v13;
  -[EKDayView todayScrollSecondBuffer](self, "todayScrollSecondBuffer");
  v16 = (double)a3 - v15;
  v17 = 0.0;
  v18 = (int)fmax(v16, 0.0);
  if (v18)
  {
    if (v18 < 86399)
      -[EKDayView _positionOfSecond:](self, "_positionOfSecond:");
    else
      v17 = v14 - v12;
  }
  v19 = v17 + a4;
  v20 = v14 - v12;
  -[UIScrollView contentInset](self->_scroller, "contentInset");
  if (v19 >= v20 + v21)
    v19 = v20 + v21;
  if (v6)
  {
    v22 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__EKDayView__scrollToSecond_offset_animated_whenFinished___block_invoke;
    aBlock[3] = &unk_1E6018CC0;
    v26 = v10;
    v23 = _Block_copy(aBlock);
    v24[0] = v22;
    v24[1] = 3221225472;
    v24[2] = __58__EKDayView__scrollToSecond_offset_animated_whenFinished___block_invoke_2;
    v24[3] = &unk_1E601AA30;
    v24[4] = self;
    v24[5] = 0;
    *(double *)&v24[6] = v19;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v24, v23, 0.4);

  }
  else
  {
    -[UIScrollView setContentOffset:](self->_scroller, "setContentOffset:", 0.0, v19);
    if (v10)
      v10[2](v10);
  }
  -[EKDayView firstVisibleSecondChanged](self, "firstVisibleSecondChanged");

}

- (double)todayScrollSecondBuffer
{
  return self->_todayScrollSecondBuffer;
}

- (double)_positionOfSecond:(int)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;

  -[EKDayViewContent grid](self->_dayContent, "grid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "positionOfSecond:", a3);
  v7 = v6;

  -[EKDayView _verticalOffset](self, "_verticalOffset");
  return v7 - v8;
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIImageView *topVerticalGridExtension;
  UIImageView *v9;
  UIImageView *v10;
  void *v11;
  UIImageView *v12;
  double v13;
  double v14;
  double v15;
  UIImageView *bottomVerticalGridExtension;
  UIImageView *v17;
  UIImageView *v18;
  void *v19;
  double v20;
  double v21;
  UIImageView *v22;
  void *v23;
  EKDayViewContent *dayContent;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  void *v35;
  char v36;
  id v37;
  CGRect v38;
  CGRect v39;

  objc_msgSend(a3, "contentOffset");
  v5 = v4;
  -[EKDayView _verticalOffset](self, "_verticalOffset");
  v7 = v6;
  topVerticalGridExtension = self->_topVerticalGridExtension;
  if (v5 >= -v6)
  {
    if (topVerticalGridExtension)
    {
      -[UIImageView removeFromSuperview](self->_topVerticalGridExtension, "removeFromSuperview");
      v12 = self->_topVerticalGridExtension;
      self->_topVerticalGridExtension = 0;

    }
  }
  else
  {
    if (!topVerticalGridExtension)
    {
      v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v10 = self->_topVerticalGridExtension;
      self->_topVerticalGridExtension = v9;

      -[EKDayView _generateVerticalGridExtensionImage](self, "_generateVerticalGridExtensionImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_topVerticalGridExtension, "setImage:", v11);

      -[UIImageView setOpaque:](self->_topVerticalGridExtension, "setOpaque:", -[EKDayView isOpaque](self, "isOpaque"));
      -[UIScrollView insertSubview:atIndex:](self->_scroller, "insertSubview:atIndex:", self->_topVerticalGridExtension, 0);
      topVerticalGridExtension = self->_topVerticalGridExtension;
    }
    -[EKDayView bounds](self, "bounds");
    -[UIImageView setFrame:](topVerticalGridExtension, "setFrame:", 0.0, v5 - v7);
  }
  -[EKDayViewContent bounds](self->_dayContent, "bounds");
  v14 = v13;
  -[UIScrollView bounds](self->_scroller, "bounds");
  bottomVerticalGridExtension = self->_bottomVerticalGridExtension;
  if (v5 <= v14 - v15 - v7)
  {
    if (bottomVerticalGridExtension)
    {
      -[UIImageView removeFromSuperview](self->_bottomVerticalGridExtension, "removeFromSuperview");
      v22 = self->_bottomVerticalGridExtension;
      self->_bottomVerticalGridExtension = 0;

    }
  }
  else
  {
    if (!bottomVerticalGridExtension)
    {
      v17 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v18 = self->_bottomVerticalGridExtension;
      self->_bottomVerticalGridExtension = v17;

      -[EKDayView _generateVerticalGridExtensionImage](self, "_generateVerticalGridExtensionImage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_bottomVerticalGridExtension, "setImage:", v19);

      -[UIImageView setOpaque:](self->_bottomVerticalGridExtension, "setOpaque:", 1);
      -[UIScrollView insertSubview:atIndex:](self->_scroller, "insertSubview:atIndex:", self->_bottomVerticalGridExtension, 0);
      bottomVerticalGridExtension = self->_bottomVerticalGridExtension;
    }
    -[EKDayViewContent bounds](self->_dayContent, "bounds");
    v21 = v20 - v7;
    -[EKDayView bounds](self, "bounds");
    -[UIImageView setFrame:](bottomVerticalGridExtension, "setFrame:", 0.0, v21);
  }
  -[EKDayView superview](self, "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    dayContent = self->_dayContent;
    -[UIScrollView bounds](self->_scroller, "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[EKDayViewContent frame](self->_dayContent, "frame");
    v34 = -v33;
    v38.origin.x = v26;
    v38.origin.y = v28;
    v38.size.width = v30;
    v38.size.height = v32;
    v39 = CGRectOffset(v38, 0.0, v34);
    -[EKDayViewContent rectBecameVisible:](dayContent, "rectBecameVisible:", v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
  }
  -[EKDayView delegate](self, "delegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_opt_respondsToSelector();

  if ((v36 & 1) != 0)
  {
    -[EKDayView delegate](self, "delegate");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    -[UIScrollView contentOffset](self->_scroller, "contentOffset");
    objc_msgSend(v37, "dayView:didUpdateScrollPosition:", self);

  }
}

- (EKDayViewDelegate)delegate
{
  return (EKDayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_isTimeMarkerFullyUnobstructed
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v12;
  CGRect v13;

  -[EKDayView currentTimeRectInView:](self, "currentTimeRectInView:", self);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[EKDayView bounds](self, "bounds");
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  return CGRectContainsRect(v12, v13);
}

- (CGRect)currentTimeRectInView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[EKDayView currentTimeRectInView:requireThumb:](self, "currentTimeRectInView:requireThumb:", a3, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_generateVerticalGridExtensionImage
{
  double v3;
  double v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  CGContext *CurrentContext;
  CGFloat x;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  uint64_t v21;
  void *v22;
  CGSize v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[EKDayView bounds](self, "bounds");
  v4 = v3;
  if (__verticalGridExtensionImageCache)
  {
    objc_msgSend((id)__verticalGridExtensionImageCache, "size");
    v5 = (void *)__verticalGridExtensionImageCache;
    if (v6 == v4)
    {
      v7 = (id)__verticalGridExtensionImageCache;
      return v7;
    }
    if (__verticalGridExtensionImageCache)
    {
      __verticalGridExtensionImageCache = 0;

    }
  }
  objc_msgSend(MEMORY[0x1E0DC3E88], "_currentTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v9);

  v10 = -[EKDayView isOpaque](self, "isOpaque");
  v24.height = 1.0;
  v24.width = v4;
  UIGraphicsBeginImageContextWithOptions(v24, v10, 0.0);
  if (-[EKDayView isOpaque](self, "isOpaque"))
  {
    -[UIScrollView backgroundColor](self->_scroller, "backgroundColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "CGColor");
    UISetColor();

    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.height = 1.0;
    v25.size.width = v4;
    UIRectFill(v25);
  }
  if (self->_outlineStyle)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "CGColor");

    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(CurrentContext, 0);
    UISetColor();
    -[EKDayViewContent frame](self->_dayContent, "frame");
    x = v26.origin.x;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v26.origin.y = 0.0;
    v26.size.width = 1.0;
    v26.size.height = 1.0;
    UIRectFill(v26);
    v27.origin.x = x;
    v27.origin.y = v16;
    v27.size.width = v18;
    v27.size.height = v20;
    v28.origin.x = CGRectGetMaxX(v27) + -1.0;
    v28.origin.y = 0.0;
    v28.size.width = 1.0;
    v28.size.height = 1.0;
    UIRectFill(v28);
    if (self->_outlineStyle == 1)
    {
      v29.origin.x = 0.0;
      v29.origin.y = 0.0;
      v29.size.width = 1.0;
      v29.size.height = 1.0;
      UIRectFill(v29);
    }
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)__verticalGridExtensionImageCache;
  __verticalGridExtensionImageCache = v21;

  UIGraphicsEndImageContext();
  objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v8);
  -[EKDayView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__clearVerticalGridExtensionImageCache, 0, 1.0);
  v7 = (id)__verticalGridExtensionImageCache;

  return v7;
}

void __37__EKDayView_loadData_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  char v6;
  char v7;

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "loadAndLayoutOccurrences:reverse:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setOccurrences:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "movePreloadedItemsToVisible");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 512);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__EKDayView_loadData_withCompletion___block_invoke_3;
  v4[3] = &unk_1E601AA58;
  v4[4] = v2;
  v6 = *(_BYTE *)(a1 + 57);
  v5 = *(id *)(a1 + 48);
  v7 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v3, "applyLoadedOccurrencesWithBatching:animated:reverse:completion:", 0, 0, 0, v4);

}

void __37__EKDayView_loadData_withCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
    objc_msgSend(v4, "dayViewDidCompleteAsyncLoadAndLayout:", *(_QWORD *)(a1 + 32));

  }
}

- (double)dayStart
{
  return self->_dayStart;
}

- (double)dayEnd
{
  return self->_dayEnd;
}

void __37__EKDayView_loadData_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 v2;
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id obj;
  _QWORD block[5];
  id v45;
  id v46;
  char v47;
  char v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v1 = a1;
  v54 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "saveTemporaryViews");
    v2 = *(_BYTE *)(v1 + 48) != 0;
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 512), "prepareForReuseIsReload:", v2);
  v3 = (void *)MEMORY[0x1E0D0C420];
  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(double *)(v4 + 424);
  objc_msgSend(*(id *)(v4 + 688), "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarDateWithAbsoluteTime:timeZone:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D0C420];
  v9 = *(_QWORD *)(v1 + 32);
  v10 = *(double *)(v9 + 432);
  objc_msgSend(*(id *)(v9 + 688), "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendarDateWithAbsoluteTime:timeZone:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v1 + 32) + 656));
  objc_msgSend(WeakRetained, "dayView:eventsForStartDate:endDate:", *(_QWORD *)(v1 + 32), v7, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "timedOccurrences");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(v1 + 32);
  v17 = *(void **)(v16 + 480);
  *(_QWORD *)(v16 + 480) = v15;

  v18 = objc_msgSend(*(id *)(v1 + 32), "_viewContentShouldDrawSynchronously");
  if ((v18 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 512), "loadAndLayoutOccurrences:reverse:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 480), 0);
  objc_msgSend(v14, "allDayOccurrences");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");
  if (v20)
  {
    v21 = v20;
    v37 = v18;
    v39 = v14;
    v40 = v12;
    v41 = v7;
    v42 = v1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v38 = v19;
    obj = v19;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v50;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v50 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v27);
          CUIKCalendar();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "startDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "endDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v29, "isDate:inSameDayAsDate:", v30, v31);

          if (v32)
            v33 = v23;
          else
            v33 = v22;
          objc_msgSend(v33, "addObject:", v28);
          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v25);
    }

    objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v23);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v41;
    v1 = v42;
    v14 = v39;
    v12 = v40;
    v19 = v38;
    v18 = v37;
  }
  else
  {
    v34 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EKDayView_loadData_withCompletion___block_invoke_2;
  block[3] = &unk_1E601AA80;
  v47 = v18;
  v35 = *(void **)(v1 + 40);
  block[4] = *(_QWORD *)(v1 + 32);
  v45 = v34;
  v48 = *(_BYTE *)(v1 + 48);
  v46 = v35;
  v36 = v34;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)loadData:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *reloadQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  reloadQueue = self->_reloadQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EKDayView_loadData_withCompletion___block_invoke;
  block[3] = &unk_1E601AAA8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(reloadQueue, block);

}

- (EKDayView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 displayDate:(id)a6 backgroundColor:(id)a7 opaque:(BOOL)a8 scrollbarShowsInside:(BOOL)a9 isMiniPreviewInEventDetail:(BOOL)a10 rightClickDelegate:(id)a11
{
  _BOOL8 v12;
  double height;
  double width;
  double y;
  double x;
  id v22;
  id v23;
  id v24;
  EKDayView *v25;
  EKDayView *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  uint64_t v33;
  NSCalendar *calendar;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  UIScrollView *scroller;
  uint64_t v51;
  UIPinchGestureRecognizer *pinchGestureRecognizer;
  uint64_t v53;
  UITapGestureRecognizer *doubleTapGestureRecognizer;
  EKDayTimeView *v55;
  EKDayTimeView *timeView;
  void *v57;
  EKDayViewContent *v58;
  double v59;
  double v60;
  uint64_t v61;
  EKDayViewContent *dayContent;
  EKDayViewContent *v63;
  EKUIRightClickEmptySpaceInteraction *v64;
  void *v65;
  void *v66;
  void *v67;
  dispatch_queue_t v68;
  OS_dispatch_queue *reloadQueue;
  CGFloat v71;
  CGFloat v72;
  id v73;
  objc_super v74;
  CGRect v75;

  v12 = a8;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = a6;
  v23 = a7;
  v24 = a11;
  v74.receiver = self;
  v74.super_class = (Class)EKDayView;
  v25 = -[EKDayView initWithFrame:](&v74, sel_initWithFrame_, x, y, width, height);
  v26 = v25;
  if (v25)
  {
    v73 = v22;
    -[EKDayView setAutoresizingMask:](v25, "setAutoresizingMask:", 18);
    -[EKDayView setOpaque:](v26, "setOpaque:", v12);
    -[EKDayView bounds](v26, "bounds");
    v71 = v28;
    v72 = v27;
    v30 = v29;
    v32 = v31;
    v26->_outlineStyle = 0;
    v26->_scrollbarShowsInside = a9;
    v26->_allowsOccurrenceSelection = 1;
    v26->_isMiniPreviewInEventDetail = a10;
    objc_storeStrong((id *)&v26->_displayDate, a6);
    CUIKCalendar();
    v33 = objc_claimAutoreleasedReturnValue();
    calendar = v26->_calendar;
    v26->_calendar = (NSCalendar *)v33;

    +[EKDayTimeView defaultHeightForSizeClass:orientation:](EKDayTimeView, "defaultHeightForSizeClass:orientation:", a4, a5);
    v36 = v35;
    if (EKUIHasFallbackSizingContext())
    {
      +[EKDayTimeView timeWidthForOrientation:inViewHierarchy:](EKDayTimeView, "timeWidthForOrientation:inViewHierarchy:", a5, v26);
      v38 = v37;
    }
    else
    {
      v38 = 100.0;
    }
    +[EKDayTimeView defaultHourScale](EKDayTimeView, "defaultHourScale");
    v26->_hourScale = v39;
    v26->_shouldEverShowTimeIndicators = 1;
    v26->_targetSizeClass = a4;
    -[EKDayView setTodayScrollSecondBuffer:](v26, "setTodayScrollSecondBuffer:", 3600.0);
    -[EKDayView bounds](v26, "bounds");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    -[EKDayView scrollBarOffset](v26, "scrollBarOffset");
    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", v41, v43, v48 + v45, v47);
    scroller = v26->_scroller;
    v26->_scroller = (UIScrollView *)v49;

    -[UIScrollView setBackgroundColor:](v26->_scroller, "setBackgroundColor:", v23);
    -[UIScrollView setOpaque:](v26->_scroller, "setOpaque:", v12);
    -[UIScrollView setAutoresizingMask:](v26->_scroller, "setAutoresizingMask:", 18);
    -[UIScrollView setDelegate:](v26->_scroller, "setDelegate:", v26);
    -[UIScrollView setContentInsetAdjustmentBehavior:](v26->_scroller, "setContentInsetAdjustmentBehavior:", 2);
    -[EKDayView addSubview:](v26, "addSubview:", v26->_scroller);
    v26->_allowPinchingHourHeights = 1;
    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", v26, sel__dayViewPinched_);
    pinchGestureRecognizer = v26->_pinchGestureRecognizer;
    v26->_pinchGestureRecognizer = (UIPinchGestureRecognizer *)v51;

    -[UIScrollView addGestureRecognizer:](v26->_scroller, "addGestureRecognizer:", v26->_pinchGestureRecognizer);
    v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v26, sel__doubleTap_);
    doubleTapGestureRecognizer = v26->_doubleTapGestureRecognizer;
    v26->_doubleTapGestureRecognizer = (UITapGestureRecognizer *)v53;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](v26->_doubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
    -[UIScrollView addGestureRecognizer:](v26->_scroller, "addGestureRecognizer:", v26->_doubleTapGestureRecognizer);
    v55 = -[EKDayTimeView initWithFrame:sizeClass:]([EKDayTimeView alloc], "initWithFrame:sizeClass:", a4, 0.0, 0.0, v38, v36);
    timeView = v26->_timeView;
    v26->_timeView = v55;

    -[EKDayTimeView setContentMode:](v26->_timeView, "setContentMode:", 3);
    -[EKDayTimeView setOpaque:](v26->_timeView, "setOpaque:", v12);
    -[EKDayTimeView setBackgroundColor:](v26->_timeView, "setBackgroundColor:", v23);
    -[EKDayTimeView setDelegate:](v26->_timeView, "setDelegate:", v26);
    -[UIScrollView addSubview:](v26->_scroller, "addSubview:", v26->_timeView);
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v26, sel__timeViewTapped_);
    -[EKDayTimeView addGestureRecognizer:](v26->_timeView, "addGestureRecognizer:", v57);
    v58 = [EKDayViewContent alloc];
    v75.origin.y = v71;
    v75.origin.x = v72;
    v75.size.width = v30;
    v75.size.height = v32;
    v59 = CGRectGetWidth(v75) - v38;
    if (v59 >= 0.0)
      v60 = v59;
    else
      v60 = 0.0;
    v61 = -[EKDayViewContent initWithFrame:sizeClass:orientation:backgroundColor:opaque:isMiniPreviewInEventDetail:numberOfDaysToDisplay:](v58, "initWithFrame:sizeClass:orientation:backgroundColor:opaque:isMiniPreviewInEventDetail:numberOfDaysToDisplay:", a4, a5, v23, v12, v26->_isMiniPreviewInEventDetail, 1, v38, 0.0, v60, v36);
    dayContent = v26->_dayContent;
    v26->_dayContent = (EKDayViewContent *)v61;

    if (v24)
    {
      v63 = v26->_dayContent;
      v64 = -[EKUIRightClickEmptySpaceInteraction initWithDelegate:]([EKUIRightClickEmptySpaceInteraction alloc], "initWithDelegate:", v24);
      -[EKDayViewContent addInteraction:](v63, "addInteraction:", v64);

    }
    -[EKDayViewContent setAutoresizingMask:](v26->_dayContent, "setAutoresizingMask:", 2);
    -[EKDayViewContent grid](v26->_dayContent, "grid");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setAnimatesTimeMarker:", 1);

    -[EKDayViewContent grid](v26->_dayContent, "grid");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setShowsTimeMarker:", 0);

    -[EKDayViewContent setDelegate:](v26->_dayContent, "setDelegate:", v26);
    -[UIScrollView addSubview:](v26->_scroller, "addSubview:", v26->_dayContent);
    -[UIScrollView setContentSize:](v26->_scroller, "setContentSize:", v30, v36);
    -[UIScrollView setBounces:](v26->_scroller, "setBounces:", 1);
    -[EKDayView _createAllDayViewWithSizeClass:rightClickDelegate:](v26, "_createAllDayViewWithSizeClass:rightClickDelegate:", a4, v24);
    -[EKDayView setOrientation:](v26, "setOrientation:", a5);
    -[EKDayViewContent setStartDateWithDateComponents:](v26->_dayContent, "setStartDateWithDateComponents:", v26->_displayDate);
    -[EKDayView _adjustForDateOrCalendarChange](v26, "_adjustForDateOrCalendarChange");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObserver:selector:name:object:", v26, sel__localeChanged, *MEMORY[0x1E0D0CA70], 0);
    objc_msgSend(v67, "addObserver:selector:name:object:", v26, sel__updateContentForSizeCategoryChange_, *MEMORY[0x1E0DC48E8], 0);
    v68 = dispatch_queue_create("dayReload", 0);
    reloadQueue = v26->_reloadQueue;
    v26->_reloadQueue = (OS_dispatch_queue *)v68;

    v22 = v73;
  }

  return v26;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)EKDayView;
  -[EKDayView description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@; _displayDate: [%@]"), v4, self->_displayDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)_localeChanged
{
  void *v3;

  CUIKCalendar();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView setCalendar:](self, "setCalendar:", v3);

  -[EKDayView _adjustForDateOrCalendarChange](self, "_adjustForDateOrCalendarChange");
  -[EKDayView setNeedsLayout](self, "setNeedsLayout");
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[EKDayView _invalidateMarkerTimer](self, "_invalidateMarkerTimer");
  v3.receiver = self;
  v3.super_class = (Class)EKDayView;
  -[EKDayView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[EKDayView _disposeAllDayView](self, "_disposeAllDayView");
  -[UIScrollView setDelegate:](self->_scroller, "setDelegate:", 0);
  -[EKDayView _invalidateMarkerTimer](self, "_invalidateMarkerTimer");
  v4.receiver = self;
  v4.super_class = (Class)EKDayView;
  -[EKDayView dealloc](&v4, sel_dealloc);
}

- (void)adjustFrameToSpanToMidnightFromStartDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  CUIKCalendar();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 32, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "hour");
  v7 = 24.0 - (double)objc_msgSend(v5, "hour") + 1.0 + 0.15;
  +[EKDayTimeView hourHeightForSizeClass:orientation:](EKDayTimeView, "hourHeightForSizeClass:orientation:", -[EKDayView _sizeClass](self, "_sizeClass"), self->_orientation);
  if (v7 >= 24.0)
  {
    -[EKDayTimeView defaultHeight](self->_timeView, "defaultHeight");
    v8 = 0.0;
  }
  else
  {
    v8 = ((double)v6 + -0.15) * 3600.0;
  }
  -[EKDayView frame](self, "frame");
  -[EKDayView setFrame:](self, "setFrame:");
  -[EKDayView setFirstVisibleSecond:](self, "setFirstVisibleSecond:", (int)v8);

}

- (void)updateMarkerPosition
{
  void *v3;
  void *v4;

  -[EKDayView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKDayViewContent grid](self->_dayContent, "grid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateMarkerPosition");

    -[EKDayTimeView updateMarkerPosition](self->_timeView, "updateMarkerPosition");
  }
}

- (void)setDisplayDate:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *displayDate;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "isEqual:", self->_displayDate) & 1) == 0)
  {
    objc_msgSend(v8, "dateComponentsForDateOnly");
    v4 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
    displayDate = self->_displayDate;
    self->_displayDate = v4;

    -[EKDayView _adjustForDateOrCalendarChange](self, "_adjustForDateOrCalendarChange");
    -[EKDayView displayDateDidChangeCallback](self, "displayDateDidChangeCallback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[EKDayView displayDateDidChangeCallback](self, "displayDateDidChangeCallback");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, NSDateComponents *))v7)[2](v7, self->_displayDate);

    }
  }

}

- (void)setShouldEverShowTimeIndicators:(BOOL)a3
{
  self->_shouldEverShowTimeIndicators = a3;
  if (!a3)
  {
    -[EKDayView setShowsTimeLine:](self, "setShowsTimeLine:", 0);
    -[EKDayView setShowsTimeMarker:](self, "setShowsTimeMarker:", 0);
  }
}

- (void)setShowsTimeLabel:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[EKDayViewContent grid](self->_dayContent, "grid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeMarker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsThumb:", v3);

}

- (BOOL)showsTimeLabel
{
  void *v2;
  void *v3;
  char v4;

  -[EKDayViewContent grid](self->_dayContent, "grid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeMarker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsThumb");

  return v4;
}

- (void)setAnimatesTimeMarker:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKDayViewContent grid](self->_dayContent, "grid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimatesTimeMarker:", v3);

}

- (BOOL)animatesTimeMarker
{
  void *v2;
  char v3;

  -[EKDayViewContent grid](self->_dayContent, "grid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "animatesTimeMarker");

  return v3;
}

- (void)setEventsFillGrid:(BOOL)a3
{
  -[EKDayViewContent setEventsFillGrid:](self->_dayContent, "setEventsFillGrid:", a3);
}

- (BOOL)eventsFillGrid
{
  return -[EKDayViewContent eventsFillGrid](self->_dayContent, "eventsFillGrid");
}

- (void)setShowsLeftBorder:(BOOL)a3
{
  -[EKDayViewContent setShowsLeftBorder:](self->_dayContent, "setShowsLeftBorder:", a3);
}

- (BOOL)showsLeftBorder
{
  return -[EKDayViewContent showsLeftBorder](self->_dayContent, "showsLeftBorder");
}

- (void)setOutlineStyle:(int)a3
{
  UIView *v4;
  UIView *bottomLine;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_outlineStyle != a3)
  {
    self->_outlineStyle = a3;
    if (a3)
    {
      if (!self->_bottomLine)
      {
        v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        bottomLine = self->_bottomLine;
        self->_bottomLine = v4;

        v6 = self->_bottomLine;
        objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

        -[EKDayView addSubview:](self, "addSubview:", self->_bottomLine);
      }
      -[EKDayViewContent grid](self->_dayContent, "grid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setShowsRightBorder:", 1);

      -[EKDayView setShowsLeftBorder:](self, "setShowsLeftBorder:", 1);
      -[EKDayTimeView setShowsLeftBorder:](self->_timeView, "setShowsLeftBorder:", self->_outlineStyle == 1);
    }
    else
    {
      -[EKDayView setContentMode:](self, "setContentMode:", 0);
      -[EKDayViewContent grid](self->_dayContent, "grid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setShowsRightBorder:", 0);

      -[UIView removeFromSuperview](self->_bottomLine, "removeFromSuperview");
    }
    -[EKDayView needsDisplay](self, "needsDisplay");
  }
}

- (BOOL)allowsScrolling
{
  return -[UIScrollView isScrollEnabled](self->_scroller, "isScrollEnabled");
}

- (void)setAllowsScrolling:(BOOL)a3
{
  -[UIScrollView setScrollEnabled:](self->_scroller, "setScrollEnabled:", a3);
}

- (UIColor)timeViewTextColor
{
  return -[EKDayTimeView timeColor](self->_timeView, "timeColor");
}

- (void)setTimeViewTextColor:(id)a3
{
  -[EKDayTimeView setTimeColor:](self->_timeView, "setTimeColor:", a3);
}

- (_NSRange)hoursToRender
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[EKDayTimeView hoursToRender](self->_timeView, "hoursToRender");
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setHoursToRender:(_NSRange)a3
{
  -[EKDayTimeView setHoursToRender:](self->_timeView, "setHoursToRender:", a3.location, a3.length);
}

- (UIColor)gridLineColor
{
  void *v2;
  void *v3;

  -[EKDayViewContent grid](self->_dayContent, "grid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setGridLineColor:(id)a3
{
  EKDayViewContent *dayContent;
  id v4;
  id v5;

  dayContent = self->_dayContent;
  v4 = a3;
  -[EKDayViewContent grid](dayContent, "grid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineColor:", v4);

}

- (UIVisualEffect)gridVisualEffect
{
  void *v2;
  void *v3;

  -[EKDayViewContent grid](self->_dayContent, "grid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridVisualEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIVisualEffect *)v3;
}

- (void)setGridVisualEffect:(id)a3
{
  EKDayViewContent *dayContent;
  id v4;
  id v5;

  dayContent = self->_dayContent;
  v4 = a3;
  -[EKDayViewContent grid](dayContent, "grid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGridVisualEffect:", v4);

}

- (UIVisualEffect)timeViewVisualEffect
{
  return -[EKDayTimeView visualEffect](self->_timeView, "visualEffect");
}

- (void)setTimeViewVisualEffect:(id)a3
{
  -[EKDayTimeView setVisualEffect:](self->_timeView, "setVisualEffect:", a3);
}

- (UIColor)occurrenceTitleColor
{
  return -[EKDayViewContent occurrenceTitleColor](self->_dayContent, "occurrenceTitleColor");
}

- (void)setOccurrenceTitleColor:(id)a3
{
  -[EKDayViewContent setOccurrenceTitleColor:](self->_dayContent, "setOccurrenceTitleColor:", a3);
}

- (UIColor)occurrenceTimeColor
{
  return -[EKDayViewContent occurrenceTimeColor](self->_dayContent, "occurrenceTimeColor");
}

- (void)setOccurrenceTimeColor:(id)a3
{
  -[EKDayViewContent setOccurrenceTimeColor:](self->_dayContent, "setOccurrenceTimeColor:", a3);
}

- (UIColor)occurrenceLocationColor
{
  return -[EKDayViewContent occurrenceLocationColor](self->_dayContent, "occurrenceLocationColor");
}

- (void)setOccurrenceLocationColor:(id)a3
{
  -[EKDayViewContent setOccurrenceLocationColor:](self->_dayContent, "setOccurrenceLocationColor:", a3);
}

- (UIColor)occurrenceTextBackgroundColor
{
  return -[EKDayViewContent occurrenceTextBackgroundColor](self->_dayContent, "occurrenceTextBackgroundColor");
}

- (void)setOccurrenceTextBackgroundColor:(id)a3
{
  -[EKDayViewContent setOccurrenceTextBackgroundColor:](self->_dayContent, "setOccurrenceTextBackgroundColor:", a3);
}

- (void)setAllowPinchingHourHeights:(BOOL)a3
{
  UIScrollView *scroller;

  if (self->_allowPinchingHourHeights != a3)
  {
    self->_allowPinchingHourHeights = a3;
    scroller = self->_scroller;
    if (a3)
    {
      -[UIScrollView addGestureRecognizer:](scroller, "addGestureRecognizer:", self->_pinchGestureRecognizer);
      -[UIScrollView addGestureRecognizer:](self->_scroller, "addGestureRecognizer:", self->_doubleTapGestureRecognizer);
    }
    else
    {
      -[UIScrollView removeGestureRecognizer:](scroller, "removeGestureRecognizer:", self->_pinchGestureRecognizer);
      -[UIScrollView removeGestureRecognizer:](self->_scroller, "removeGestureRecognizer:", self->_doubleTapGestureRecognizer);
    }
  }
}

- (EKDayAllDayView)allDayView
{
  return self->_allDayView;
}

- (EKDayViewContent)dayContent
{
  return self->_dayContent;
}

- (EKDayTimeView)timeView
{
  return self->_timeView;
}

- (double)scrollOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[UIScrollView contentOffset](self->_scroller, "contentOffset");
  v4 = v3;
  -[EKDayView _verticalOffset](self, "_verticalOffset");
  v6 = v4 - v5;
  -[UIScrollView frame](self->_scroller, "frame");
  return v6 - v7;
}

- (CGPoint)normalizedContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[UIScrollView contentOffset](self->_scroller, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[UIScrollView contentSize](self->_scroller, "contentSize");
  v8 = v6 / v7;
  v9 = v4;
  result.y = v8;
  result.x = v9;
  return result;
}

- (void)setNormalizedContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  -[UIScrollView contentSize](self->_scroller, "contentSize");
  v7 = y * v6;
  -[EKDayView _verticalOffset](self, "_verticalOffset");
  v9 = v8;
  -[UIScrollView frame](self->_scroller, "frame");
  -[UIScrollView setContentOffset:animated:](self->_scroller, "setContentOffset:animated:", 0, x, v7 + v9 + v10);
}

- (id)verticalScrollView
{
  return self->_scroller;
}

- (void)scrollToEvent:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  uint64_t v20;
  void (**v21)(void *, uint64_t);
  UIScrollView *scroller;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  _QWORD v40[5];
  CGRect v41;
  _QWORD aBlock[4];
  id v43;
  CGRect v44;
  CGRect v45;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[EKDayViewContent occurrenceViewForEvent:](self->_dayContent, "occurrenceViewForEvent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__EKDayView_scrollToEvent_animated_completionBlock___block_invoke;
    aBlock[3] = &unk_1E6018CC0;
    v43 = v9;
    v21 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    if ((objc_msgSend(v8, "isAllDay") & 1) == 0)
    {
      scroller = self->_scroller;
      objc_msgSend(v11, "frame");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      objc_msgSend(v11, "superview");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView convertRect:fromView:](scroller, "convertRect:fromView:", v31, v24, v26, v28, v30);
      v13 = v32;
      v17 = v33;
      v19 = v34;

      v35 = (void *)MEMORY[0x1E0D0C420];
      objc_msgSend(v8, "startDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCalendar timeZone](self->_calendar, "timeZone");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "calendarDateWithDate:timeZone:", v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKDayView _positionOfSecond:](self, "_positionOfSecond:", 3600 * objc_msgSend(v38, "hour")+ 60 * objc_msgSend(v38, "minute")+ objc_msgSend(v38, "second"));
      v15 = v39;

      v20 = MEMORY[0x1E0C809B0];
    }
    v44.origin.x = v13;
    v44.origin.y = v15;
    v44.size.width = v17;
    v44.size.height = v19;
    v45 = CGRectInset(v44, 0.0, -20.0);
    if (v6)
    {
      v40[0] = v20;
      v40[1] = 3221225472;
      v40[2] = __52__EKDayView_scrollToEvent_animated_completionBlock___block_invoke_2;
      v40[3] = &unk_1E601AA08;
      v40[4] = self;
      v41 = v45;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v40, v21, 0.4);
    }
    else
    {
      -[UIScrollView scrollRectToVisible:animated:](self->_scroller, "scrollRectToVisible:animated:", 0, v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
      v21[2](v21, 1);
    }

  }
  -[EKDayView firstVisibleSecondChanged](self, "firstVisibleSecondChanged");

}

uint64_t __52__EKDayView_scrollToEvent_animated_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __52__EKDayView_scrollToEvent_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "scrollRectToVisible:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_scrollToSecond:(int)a3 animated:(BOOL)a4 whenFinished:(id)a5
{
  -[EKDayView _scrollToSecond:offset:animated:whenFinished:](self, "_scrollToSecond:offset:animated:whenFinished:", *(_QWORD *)&a3, a4, a5, 0.0);
}

uint64_t __58__EKDayView__scrollToSecond_offset_animated_whenFinished___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__EKDayView__scrollToSecond_offset_animated_whenFinished___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)presentationControllerForEditMenu
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationControllerForEditMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "selectedEventsForEditMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)attemptDisplayReviewPrompt
{
  EKDayViewDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "attemptDisplayReviewPrompt");

  }
}

- (NSArray)occurrenceViews
{
  return (NSArray *)-[EKDayViewContent occurrenceViews](self->_dayContent, "occurrenceViews");
}

- (NSArray)allOccurrenceViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayAllDayView occurrenceViews](self->_allDayView, "occurrenceViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[EKDayViewContent occurrenceViews](self->_dayContent, "occurrenceViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v6;
}

- (void)bringEventToFront:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EKDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (-[EKDayViewContent occurrenceViewForEvent:](self->_dayContent, "occurrenceViewForEvent:", v6),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bringSubviewToFront:", v4);

  }
}

- (void)insertViewForEvent:(id)a3 belowViewForOtherEvent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[EKDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
LABEL_6:
    -[EKDayViewContent occurrenceViewForEvent:](self->_dayContent, "occurrenceViewForEvent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_14;
    goto LABEL_7;
  }
  -[EKDayViewContent occurrenceViewForEvent:](self->_dayContent, "occurrenceViewForEvent:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_6;
LABEL_3:
  if (!v7)
    goto LABEL_14;
LABEL_7:
  if (v9)
  {
    objc_msgSend(v7, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = v7;
    v13 = v9;
  }
  else
  {
    v14 = objc_msgSend(v16, "isAllDay");
    objc_msgSend(v7, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v14)
      v15 = 504;
    else
      v15 = 512;
    v13 = *(Class *)((char *)&self->super.super.super.isa + v15);
    v12 = v7;
  }
  objc_msgSend(v10, "insertSubview:aboveSubview:", v12, v13);

LABEL_14:
}

- (void)setTopContentInset:(double)a3
{
  double v5;

  self->_topContentInset = a3;
  -[UIScrollView contentInset](self->_scroller, "contentInset");
  -[UIScrollView setContentInset:](self->_scroller, "setContentInset:", v5 + a3);
}

- (void)setBottomContentInset:(double)a3
{
  self->_bottomContentInset = a3;
  -[UIScrollView contentInset](self->_scroller, "contentInset");
  -[UIScrollView setContentInset:](self->_scroller, "setContentInset:");
}

- (double)leftContentInset
{
  double v3;
  double v4;
  double Width;
  double v6;
  CGRect v8;
  CGRect v9;

  if (CalInterfaceIsLeftToRight())
  {
    -[EKDayViewContent frame](self->_dayContent, "frame");
    v4 = v3;
  }
  else
  {
    -[EKDayView bounds](self, "bounds");
    Width = CGRectGetWidth(v8);
    -[EKDayViewContent frame](self->_dayContent, "frame");
    v4 = Width - CGRectGetMaxX(v9);
  }
  +[EKDayOccurrenceView barToBarGapWidth](EKDayOccurrenceView, "barToBarGapWidth");
  return v4 + v6;
}

- (void)setAlignsMidnightToTop:(BOOL)a3
{
  if (self->_alignsMidnightToTop != a3)
  {
    self->_alignsMidnightToTop = a3;
    -[EKDayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowOnlyAllDayArea:(BOOL)a3
{
  if (self->_showOnlyAllDayArea != a3)
  {
    self->_showOnlyAllDayArea = a3;
    -[UIScrollView setHidden:](self->_scroller, "setHidden:");
    -[EKDayAllDayView setShowsBorderLines:](self->_allDayView, "setShowsBorderLines:", !self->_showOnlyAllDayArea);
  }
}

- (void)_clearVerticalGridExtensionImageCache
{
  void *v2;

  v2 = (void *)__verticalGridExtensionImageCache;
  __verticalGridExtensionImageCache = 0;

}

- (BOOL)eventOccursOnThisDay:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  -[EKDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)occurrenceViewForEvent:(id)a3
{
  id v4;
  int v5;
  int *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "isAllDay");
  v6 = &OBJC_IVAR___EKDayView__dayContent;
  if (v5)
    v6 = &OBJC_IVAR___EKDayView__allDayView;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "occurrenceViewForEvent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)yPositionPerhapsMatchingAllDayOccurrence:(id)a3
{
  EKDayAllDayView *v4;
  EKDayAllDayView *v5;
  double v6;
  double v7;
  EKDayView *v8;
  EKDayAllDayView *v9;
  EKDayAllDayView *allDayView;
  double v11;
  double v12;
  double v13;

  -[EKDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:", a3);
  v4 = (EKDayAllDayView *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && -[EKDayAllDayView isAllDay](v4, "isAllDay"))
  {
    -[EKDayAllDayView bounds](v5, "bounds");
    v8 = self;
    v9 = v5;
  }
  else
  {
    allDayView = self->_allDayView;
    if (!allDayView)
    {
      v13 = 0.0;
      goto LABEL_8;
    }
    -[EKDayAllDayView nextAvailableOccurrenceViewYOrigin](allDayView, "nextAvailableOccurrenceViewYOrigin");
    v7 = v11;
    v9 = self->_allDayView;
    v6 = 0.0;
    v8 = self;
  }
  -[EKDayView convertPoint:fromView:](v8, "convertPoint:fromView:", v9, v6, v7);
  v13 = v12;
LABEL_8:

  return v13;
}

- (CGRect)rectForEvent:(id)a3
{
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  CGRect result;

  -[EKDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "bounds");
    -[EKDayView convertRect:fromView:](self, "convertRect:fromView:", v5);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)selectEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *allDayView;
  void *dayContent;
  id v9;

  v9 = a3;
  -[EKDayView selectedEvent](self, "selectedEvent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 == v9)
    goto LABEL_14;
  if (!v9 || (v6 = objc_msgSend(v4, "isAllDay"), v6 != objc_msgSend(v9, "isAllDay")))
  {
    if (objc_msgSend(v5, "isAllDay"))
    {
      allDayView = self->_allDayView;
      if (!allDayView)
        goto LABEL_9;
    }
    else
    {
      allDayView = self->_dayContent;
    }
    objc_msgSend(allDayView, "selectEvent:", 0);
  }
LABEL_9:
  if (objc_msgSend(v9, "isAllDay"))
  {
    dayContent = self->_allDayView;
    if (!dayContent)
      goto LABEL_14;
  }
  else
  {
    dayContent = self->_dayContent;
  }
  objc_msgSend(dayContent, "selectEvent:", v9);
LABEL_14:

}

- (id)selectedEvent
{
  void *v3;

  -[EKDayViewContent selectedEvent](self->_dayContent, "selectedEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKDayAllDayView selectedEvent](self->_allDayView, "selectedEvent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (EKEvent)dimmedOccurrence
{
  void *v3;

  -[EKDayAllDayView dimmedOccurrence](self->_allDayView, "dimmedOccurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKDayViewContent dimmedOccurrence](self->_dayContent, "dimmedOccurrence");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (EKEvent *)v3;
}

- (BOOL)containsOccurrences
{
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;

  -[EKDayAllDayView occurrenceViews](self->_allDayView, "occurrenceViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 > 0)
    return 1;
  -[EKDayViewContent occurrenceViews](self->_dayContent, "occurrenceViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7 > 0;
}

- (void)_notifyDelegateOfFinishedScrollingToOccurrence
{
  EKDayViewDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "dayViewDidFinishScrollingToOccurrence:", self);

    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_userScrolling = 1;
  -[EKDayView _scrollViewWillBeginDragging:](self, "_scrollViewWillBeginDragging:", a3);
}

- (void)_scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[EKDayView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[EKDayView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dayView:scrollViewWillBeginDragging:", self, v7);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4 && self->_userScrolling)
  {
    -[EKDayView firstVisibleSecondChanged](self, "firstVisibleSecondChanged", a3);
    self->_userScrolling = 0;
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_userScrolling)
  {
    -[EKDayView firstVisibleSecondChanged](self, "firstVisibleSecondChanged", a3);
    self->_userScrolling = 0;
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id WeakRetained;

  if (self->_scrollingToOccurrence)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dayViewDidFinishScrollingToOccurrence:", self);

    self->_scrollingToOccurrence = 0;
  }
}

- (void)_updateContentForSizeCategoryChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  char v8;
  id v9;

  -[EKDayAllDayView updateLabelFont](self->_allDayView, "updateLabelFont", a3);
  -[EKDayTimeView timeMarker](self->_timeView, "timeMarker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateFonts");

  -[EKDayViewContent grid](self->_dayContent, "grid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateFonts");

  +[EKDayTimeView defaultHourScale](EKDayTimeView, "defaultHourScale");
  -[EKDayView setHourScale:](self, "setHourScale:");
  -[EKDayView reloadData](self, "reloadData");
  -[EKDayView setNeedsLayout](self, "setNeedsLayout");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "dayView:didScaleDayViewWithScale:", self, self->_hourScale);

  }
}

- (void)_disposeAllDayView
{
  EKDayAllDayView *allDayView;
  EKDayAllDayView *v4;

  allDayView = self->_allDayView;
  if (allDayView)
  {
    -[EKDayAllDayView removeFromSuperview](allDayView, "removeFromSuperview");
    v4 = self->_allDayView;
    self->_allDayView = 0;

  }
}

- (void)scrollEventsIntoViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  EKDayViewContent *dayContent;
  double v6;

  v3 = a3;
  -[EKDayView layoutIfNeeded](self, "layoutIfNeeded");
  if (-[EKDayView scrollEventsInToViewIgnoresVisibility](self, "scrollEventsInToViewIgnoresVisibility")
    || (dayContent = self->_dayContent,
        -[EKDayView bounds](self, "bounds"),
        -[EKDayView convertRect:toView:](self, "convertRect:toView:", self->_dayContent),
        !-[EKDayViewContent eventsIntersectRect:](dayContent, "eventsIntersectRect:")))
  {
    -[EKDayView setScrollEventsInToViewIgnoresVisibility:](self, "setScrollEventsInToViewIgnoresVisibility:", 0);
    -[EKDayViewContent firstEventSecond](self->_dayContent, "firstEventSecond");
    if (v6 == -1.0)
      self->_scrollToOccurrencesOnNextReload = 1;
    else
      -[EKDayView _scrollToSecond:animated:whenFinished:](self, "_scrollToSecond:animated:whenFinished:", (int)v6, v3, 0);
  }
}

- (void)setScrollerYInset:(double)a3 keepingYPointVisible:(double)a4
{
  double MaxY;
  double v8;
  double v9;
  UIScrollView *scroller;
  double v11;
  _QWORD v12[6];
  CGRect v13;

  -[UIScrollView frame](self->_scroller, "frame");
  MaxY = CGRectGetMaxY(v13);
  if (a3 + a4 > MaxY)
  {
    -[UIScrollView contentInset](self->_scroller, "contentInset", a3 + a4);
    v9 = v8 - a3;
    scroller = self->_scroller;
    -[UIScrollView contentOffset](scroller, "contentOffset");
    -[UIScrollView setContentOffset:animated:](scroller, "setContentOffset:animated:", 1, 0.0, v11 - v9 - MaxY + a4);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__EKDayView_setScrollerYInset_keepingYPointVisible___block_invoke;
  v12[3] = &unk_1E6018FC8;
  v12[4] = self;
  *(double *)&v12[5] = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v12, 0.3);
}

uint64_t __52__EKDayView_setScrollerYInset_keepingYPointVisible___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "contentInset");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setContentInset:");
}

- (void)relayoutExistingTimedOccurrences
{
  -[EKDayViewContent layoutSubviews](self->_dayContent, "layoutSubviews");
}

- (void)reloadData
{
  -[EKDayView loadData:withCompletion:](self, "loadData:withCompletion:", 1, 0);
}

- (void)reloadDataSynchronously
{
  void *v3;
  double dayStart;
  void *v5;
  void *v6;
  double dayEnd;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  EKDayAllDayView *allDayView;
  void *v15;
  NSArray *v16;
  NSArray *existingTimedOcurrences;
  id v18;

  v3 = (void *)MEMORY[0x1E0D0C420];
  dayStart = self->_dayStart;
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarDateWithAbsoluteTime:timeZone:", v5, dayStart);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D0C420];
  dayEnd = self->_dayEnd;
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendarDateWithAbsoluteTime:timeZone:", v8, dayEnd);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "dayView:eventsForStartDate:endDate:", self, v18, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "allDayOccurrences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  allDayView = self->_allDayView;
  if (v13)
  {
    objc_msgSend(v11, "allDayOccurrences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayAllDayView setOccurrences:](allDayView, "setOccurrences:", v15);

  }
  else
  {
    -[EKDayAllDayView setOccurrences:](self->_allDayView, "setOccurrences:", 0);
  }
  objc_msgSend(v11, "timedOccurrences");
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  existingTimedOcurrences = self->_existingTimedOcurrences;
  self->_existingTimedOcurrences = v16;

  -[EKDayViewContent setOccurrences:](self->_dayContent, "setOccurrences:", self->_existingTimedOcurrences);
  -[EKDayView setNeedsLayout](self, "setNeedsLayout");
  -[EKDayView layoutIfNeeded](self, "layoutIfNeeded");
  if (self->_scrollToOccurrencesOnNextReload)
  {
    -[EKDayView scrollEventsIntoViewAnimated:](self, "scrollEventsIntoViewAnimated:", 1);
    self->_scrollToOccurrencesOnNextReload = 0;
  }

}

- (void)resetOccurrenceViewColors
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[EKDayViewContent occurrenceViews](self->_dayContent, "occurrenceViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "forceUpdateColors");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }
  -[EKDayAllDayView occurrenceViews](self->_allDayView, "occurrenceViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "forceUpdateColors");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

}

- (void)allDayView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v5 = a5;
  v10 = a4;
  -[EKDayView selectEvent:](self, "selectEvent:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "dayView:didSelectEvent:userInitiated:", self, v10, v5);

  }
}

- (BOOL)allDayViewShouldAnnotateAppEntities:(id)a3
{
  EKDayViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  void *v7;
  double dayStart;
  void *v9;
  void *v10;
  id v11;
  char v12;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 0;
  v7 = (void *)MEMORY[0x1E0D0C420];
  dayStart = self->_dayStart;
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarDateWithAbsoluteTime:timeZone:", v9, dayStart);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_loadWeakRetained((id *)p_delegate);
  v12 = objc_msgSend(v11, "dayViewShouldAnnotateAppEntities:onDayStarting:", self, v10);

  return v12;
}

- (void)dayViewContent:(id)a3 didCreateOccurrenceViews:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "dayView:didCreateOccurrenceViews:", self, v10);

    }
  }

}

- (void)dayViewContent:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;

  v5 = a5;
  v12 = a4;
  if (-[EKDayView _sizeClass](self, "_sizeClass") == 1)
    -[EKDayView selectEvent:](self, "selectEvent:", v12);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "dayView:didSelectEvent:userInitiated:", self, v12, v5);

    }
  }

}

- (void)dayViewContent:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;

  v5 = a5;
  v12 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "dayView:didSelectEvents:userInitiated:", self, v12, v5);

    }
  }

}

- (void)dayViewContent:(id)a3 didTapInEmptySpaceOnDay:(double)a4
{
  EKDayViewDelegate **p_delegate;
  id WeakRetained;
  char v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0D0C420];
    -[NSCalendar timeZone](self->_calendar, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calendarDateWithAbsoluteTime:timeZone:", v10, a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "dayViewDidTapEmptySpace:onDate:", self, v12);

  }
}

- (void)dayViewContent:(id)a3 didTapPinnedOccurrence:(id)a4
{
  -[EKDayView scrollToEvent:animated:completionBlock:](self, "scrollToEvent:animated:completionBlock:", a4, 1, 0);
}

- (void)dayViewContentDidCompleteAsyncLoadAndLayout:(id)a3
{
  EKDayViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "dayViewDidCompleteAsyncLoadAndLayout:", self);

  }
}

- (void)_timeViewTapped:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  if (objc_msgSend(a3, "state") == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "dayViewDidTapEmptySpace:onDate:", self, 0);

    }
  }
}

- (id)dayViewContent:(id)a3 selectedCopyViewForOccurrenceView:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "dayView:selectedCopyViewForOccurrence:", self, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)dayViewContentShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[EKDayView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[EKDayView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "dayViewShouldAnnotateAppEntities:onDayStarting:", self, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)shouldAnnotateAppEntitiesChanged
{
  -[EKDayViewContent shouldAnnotateAppEntitiesChanged](self->_dayContent, "shouldAnnotateAppEntitiesChanged");
  -[EKDayAllDayView shouldAnnotateAppEntitiesChanged](self->_allDayView, "shouldAnnotateAppEntitiesChanged");
}

- (void)_doubleTap:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id WeakRetained;
  char v28;
  id v29;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  -[EKDayViewContent grid](self->_dayContent, "grid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  +[EKDayTimeView defaultHourScale](EKDayTimeView, "defaultHourScale");
  v13 = v12;
  v14 = v12 / self->_hourScale;
  -[EKDayView setHourScale:](self, "setHourScale:", v12);
  -[EKDayViewContent grid](self->_dayContent, "grid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView convertPoint:fromView:](self, "convertPoint:fromView:", v15, v9, v11 * v14);
  v17 = v16;

  v18 = v17 - v6;
  -[UIScrollView contentOffset](self->_scroller, "contentOffset");
  v20 = v19;
  v22 = v18 + v21;
  +[EKDayTimeView defaultHeightForSizeClass:orientation:withHourScale:](EKDayTimeView, "defaultHeightForSizeClass:orientation:withHourScale:", -[EKDayView _sizeClass](self, "_sizeClass"), self->_orientation, self->_hourScale);
  v24 = v23;
  -[UIScrollView frame](self->_scroller, "frame");
  v26 = 0.0;
  if (v22 >= 0.0)
    v26 = v22;
  if (v26 >= v24 - v25)
    v26 = v24 - v25;
  -[UIScrollView setContentOffset:animated:](self->_scroller, "setContentOffset:animated:", 0, v20, v26);
  -[EKDayView layoutIfNeeded](self, "layoutIfNeeded");
  -[EKDayViewContent layoutIfNeeded](self->_dayContent, "layoutIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) != 0)
  {
    v29 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v29, "dayView:didScaleDayViewWithScale:", self, v13);

  }
}

- (double)minimumHourScale
{
  double v3;
  double v4;
  int64_t orientation;
  double v6;

  -[EKDayView frame](self, "frame");
  v4 = v3;
  if (-[EKDayView _sizeClass](self, "_sizeClass") == 2)
    orientation = 1;
  else
    orientation = self->_orientation;
  +[EKDayTimeView defaultHeightForSizeClass:orientation:](EKDayTimeView, "defaultHeightForSizeClass:orientation:", -[EKDayView _sizeClass](self, "_sizeClass"), orientation);
  return fmax(v4 / v6, 0.7);
}

- (double)maximumHourScale
{
  return 1.8;
}

- (void)setHourScale:(double)a3
{
  double v5;
  double v6;
  void *v7;

  -[EKDayView maximumHourScale](self, "maximumHourScale");
  if (v5 <= a3)
    a3 = v5;
  -[EKDayView minimumHourScale](self, "minimumHourScale");
  if (a3 < v6)
    a3 = v6;
  self->_hourScale = a3;
  -[EKDayTimeView setHourHeightScale:](self->_timeView, "setHourHeightScale:", a3);
  -[EKDayViewContent grid](self->_dayContent, "grid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGridHeightScale:", a3);

  +[EKDayTimeView defaultHeightForSizeClass:orientation:withHourScale:](EKDayTimeView, "defaultHeightForSizeClass:orientation:withHourScale:", -[EKDayView _sizeClass](self, "_sizeClass"), self->_orientation, self->_hourScale);
  -[UIScrollView contentSize](self->_scroller, "contentSize");
  -[UIScrollView setContentSize:](self->_scroller, "setContentSize:");
  -[EKDayView setNeedsLayout](self, "setNeedsLayout");
  -[EKDayViewContent setNeedsLayout](self->_dayContent, "setNeedsLayout");
}

- (double)scaledHourHeight
{
  double result;

  -[EKDayTimeView scaledHourHeight](self->_timeView, "scaledHourHeight");
  return result;
}

- (void)_dayViewPinched:(id)a3
{
  uint64_t v4;
  id WeakRetained;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double x;
  double y;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
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
  BOOL v26;
  double v27;
  double v28;
  double v30;
  double v31;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;
  char v59;
  id v60;
  id v61;

  v61 = a3;
  v4 = objc_msgSend(v61, "state");
  if ((unint64_t)(v4 - 3) <= 2)
  {
    -[EKDayViewContent setReduceLayoutProcessingForAnimation:](self->_dayContent, "setReduceLayoutProcessingForAnimation:", 0);
    -[EKDayViewContent setNeedsLayout](self->_dayContent, "setNeedsLayout");
    -[EKDayView reloadDataSynchronously](self, "reloadDataSynchronously");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "dayView:didScaleDayViewWithScale:", self, self->_hourScale);

    }
  }
  v8 = objc_msgSend(v61, "numberOfTouches");
  if ((v8 | 2) == 2)
  {
    v9 = v8;
    x = self->_lastPinchPoint1.x;
    y = self->_lastPinchPoint1.y;
    if (v8)
    {
      objc_msgSend(v61, "locationOfTouch:inView:", 0, self);
      self->_lastPinchPoint1.x = v12;
      self->_lastPinchPoint1.y = v13;
    }
    if (v4 == 2)
    {
      if (v9)
      {
        v15 = pinchDistanceForGestureRecognizer(v61, self);
        v17 = self->_lastPinchDistance.y;
        v18 = v16 / v17;
        v19 = v15 - self->_lastPinchDistance.x;
        if (v19 < 0.0)
          v19 = -v19;
        v20 = v16 - v17;
        if (v20 < 0.0)
          v20 = -v20;
        if (v19 <= v20)
          v21 = v18;
        else
          v21 = 1.0;
        self->_lastPinchDistance.x = v15;
        self->_lastPinchDistance.y = v16;
      }
      else
      {
        objc_msgSend(v61, "scale");
        v21 = fabs(v23 / self->_lastPinchScale);
        self->_lastPinchScale = v23;
      }
      v24 = v21 * self->_hourScale;
      -[EKDayView minimumHourScale](self, "minimumHourScale");
      v26 = v21 <= 1.0 && v24 < v25;
      if (v26 || (-[EKDayView maximumHourScale](self, "maximumHourScale"), v24 > v27))
      {
        -[EKDayView minimumHourScale](self, "minimumHourScale");
        if (1.0 - v21 > 0.01 && v24 < v28)
          goto LABEL_50;
        -[EKDayView maximumHourScale](self, "maximumHourScale");
        v31 = v21 + -1.0;
        v21 = 1.0;
        if (v31 > 0.01 && v24 > v30)
          goto LABEL_50;
      }
      else
      {
        self->_hourScale = v24;
      }
      -[EKDayViewContent grid](self->_dayContent, "grid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v9)
        objc_msgSend(v33, "convertPoint:fromView:", self, x, y);
      else
        objc_msgSend(v61, "locationInView:", v33);
      v37 = v35;
      v38 = v36;

      -[EKDayTimeView setHourHeightScale:](self->_timeView, "setHourHeightScale:", self->_hourScale);
      -[EKDayViewContent grid](self->_dayContent, "grid");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setGridHeightScale:", self->_hourScale);

      +[EKDayTimeView defaultHeightForSizeClass:orientation:withHourScale:](EKDayTimeView, "defaultHeightForSizeClass:orientation:withHourScale:", -[EKDayView _sizeClass](self, "_sizeClass"), self->_orientation, self->_hourScale);
      v41 = v40;
      -[UIScrollView contentSize](self->_scroller, "contentSize");
      -[UIScrollView setContentSize:](self->_scroller, "setContentSize:");
      -[EKDayView setNeedsLayout](self, "setNeedsLayout");
      -[EKDayViewContent setNeedsLayout](self->_dayContent, "setNeedsLayout");
      -[UIScrollView contentOffset](self->_scroller, "contentOffset");
      v43 = v42;
      v45 = v44;
      v46 = v21 * v38;
      -[EKDayViewContent grid](self->_dayContent, "grid");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[EKDayView convertPoint:fromView:](self, "convertPoint:fromView:", v47, v37, v46);
        v49 = v48;

        v50 = v49 - self->_lastPinchPoint1.y;
        -[UIScrollView contentOffset](self->_scroller, "contentOffset");
        v43 = v51;
        v53 = v50 + v52;
      }
      else
      {
        objc_msgSend(v61, "locationInView:", v47);
        v55 = v54;

        v53 = v45 + v46 - v55;
      }
      -[UIScrollView frame](self->_scroller, "frame");
      v57 = 0.0;
      if (v53 >= 0.0)
        v57 = v53;
      if (v57 >= v41 - v56)
        v57 = v41 - v56;
      -[UIScrollView setContentOffset:animated:](self->_scroller, "setContentOffset:animated:", 0, v43, v57);
      v58 = objc_loadWeakRetained((id *)&self->_delegate);
      v59 = objc_opt_respondsToSelector();

      if ((v59 & 1) != 0)
      {
        v60 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v60, "dayView:isPinchingDayViewWithScale:", self, self->_hourScale);

      }
    }
    else if (v4 == 1)
    {
      if (v9)
      {
        self->_lastPinchDistance.x = pinchDistanceForGestureRecognizer(v61, self);
        self->_lastPinchDistance.y = v14;
      }
      else
      {
        objc_msgSend(v61, "scale");
        self->_lastPinchScale = v22;
      }
      -[EKDayViewContent setReduceLayoutProcessingForAnimation:](self->_dayContent, "setReduceLayoutProcessingForAnimation:", 1);
    }
  }
LABEL_50:

}

- (id)occurrenceViewAtPoint:(CGPoint)a3
{
  void *v3;
  id v4;
  void *v5;

  -[EKDayView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "occurrenceView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (double)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4
{
  double result;

  -[EKDayView dateAtPoint:isAllDay:requireAllDayRegionInsistence:](self, "dateAtPoint:isAllDay:requireAllDayRegionInsistence:", a4, 1, a3.x, a3.y);
  return result;
}

- (BOOL)_showingAllDaySection
{
  EKDayAllDayView *allDayView;
  double v3;

  allDayView = self->_allDayView;
  if (allDayView)
  {
    -[EKDayAllDayView frame](allDayView, "frame");
    LOBYTE(allDayView) = v3 > 0.0;
  }
  return (char)allDayView;
}

- (double)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4 requireAllDayRegionInsistence:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double dayStart;
  CGRect v17;

  v5 = a5;
  y = a3.y;
  -[UIScrollView contentOffset](self->_scroller, "contentOffset", a3.x);
  v10 = y + v9;
  -[UIScrollView frame](self->_scroller, "frame");
  v12 = v10 - v11;
  v13 = 0;
  if (-[EKDayView _showingAllDaySection](self, "_showingAllDaySection"))
  {
    -[EKDayAllDayView frame](self->_allDayView, "frame");
    if (y < CGRectGetMaxY(v17) + (double)v5 * -6.0)
      v13 = 1;
  }
  -[EKDayView _adjustSecondForwardForDSTHole:](self, "_adjustSecondForwardForDSTHole:", (double)-[EKDayView _secondAtPosition:](self, "_secondAtPosition:", fmax(v12, 0.0)));
  dayStart = self->_dayStart;
  if (a4)
    *a4 = v13;
  return dayStart + (double)(int)v14;
}

- (double)_adjustSecondForwardForDSTHole:(double)result
{
  double nextDSTTransition;
  double dayStart;
  double dayEnd;
  double v6;
  double v7;
  double v8;

  nextDSTTransition = self->_nextDSTTransition;
  dayStart = self->_dayStart;
  if (nextDSTTransition >= dayStart)
  {
    dayEnd = self->_dayEnd;
    if (nextDSTTransition < dayEnd)
    {
      v6 = dayStart - dayEnd + 86399.0;
      v7 = dayStart + result;
      v8 = nextDSTTransition + v6;
      if (dayStart + result >= nextDSTTransition && v7 < v8)
      {
        return nextDSTTransition - dayStart + v6;
      }
      else if (v7 >= v8)
      {
        return result - v6;
      }
    }
  }
  return result;
}

- (double)_adjustSecondBackwardForDSTHole:(double)result
{
  double nextDSTTransition;
  double dayStart;
  double dayEnd;

  nextDSTTransition = self->_nextDSTTransition;
  dayStart = self->_dayStart;
  if (nextDSTTransition >= dayStart)
  {
    dayEnd = self->_dayEnd;
    if (dayStart + result >= nextDSTTransition && nextDSTTransition < dayEnd)
      return dayStart - dayEnd + 86399.0 + result;
  }
  return result;
}

- (CGPoint)pointAtDate:(double)a3 isAllDay:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  EKDayAllDayView *allDayView;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  v4 = a4;
  v7 = 0.0;
  if (CalInterfaceIsLeftToRight())
  {
    -[EKDayView leftContentInset](self, "leftContentInset");
    v7 = v8;
  }
  -[EKDayView _adjustSecondBackwardForDSTHole:](self, "_adjustSecondBackwardForDSTHole:", a3 - self->_dayStart);
  if (v4)
  {
    allDayView = self->_allDayView;
    if (allDayView)
    {
      -[EKDayAllDayView firstEventYOffset](allDayView, "firstEventYOffset");
      v12 = v11;
    }
    else
    {
      v12 = 0.0;
    }
  }
  else
  {
    v13 = v9;
    -[UIScrollView frame](self->_scroller, "frame");
    v15 = v14;
    -[UIScrollView contentOffset](self->_scroller, "contentOffset");
    v17 = v15 - v16;
    -[EKDayView _positionOfSecond:](self, "_positionOfSecond:", (int)v13);
    v12 = v18 + v17;
  }
  v19 = v7;
  result.y = v12;
  result.x = v19;
  return result;
}

- (double)_scrollRate
{
  return dbl_1AFA13530[-[EKDayView _sizeClass](self, "_sizeClass") == 2];
}

- (double)_scrollZoneTop
{
  int64_t v2;
  double result;

  v2 = -[EKDayView _sizeClass](self, "_sizeClass");
  result = 40.0;
  if (v2 != 2)
    return 30.0;
  return result;
}

- (BOOL)scrollTowardPoint:(CGPoint)a3
{
  double y;
  double MinY;
  double v6;
  double v7;
  double MaxY;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float v31;
  CGRect v33;
  CGRect v34;

  y = a3.y;
  -[UIScrollView frame](self->_scroller, "frame", a3.x);
  MinY = CGRectGetMinY(v33);
  -[EKDayView _scrollZoneTop](self, "_scrollZoneTop");
  v7 = MinY + v6;
  -[UIScrollView frame](self->_scroller, "frame");
  MaxY = CGRectGetMaxY(v34);
  -[UIScrollView contentInset](self->_scroller, "contentInset");
  if (y >= v7)
  {
    v11 = MaxY - v9 + -40.0;
    if (y <= v11)
      return 0;
    v10 = y - v11;
  }
  else
  {
    v10 = v7 - y;
  }
  -[EKDayView _scrollRate](self, "_scrollRate");
  v13 = v10 * v12;
  -[UIScrollView contentOffset](self->_scroller, "contentOffset");
  v16 = v15;
  v17 = v14;
  if (y >= v7)
  {
    -[UIScrollView bounds](self->_scroller, "bounds");
    v21 = v17 + v20;
    -[UIScrollView contentInset](self->_scroller, "contentInset");
    v23 = v21 - v22;
    -[UIScrollView contentSize](self->_scroller, "contentSize");
    if (v23 < v24)
    {
      -[UIScrollView contentSize](self->_scroller, "contentSize");
      v27 = v26;
      -[UIScrollView contentInset](self->_scroller, "contentInset");
      v29 = v27 + v28;
      -[UIScrollView bounds](self->_scroller, "bounds");
      v31 = v29 - v30;
      v25 = v13 + v17;
      v19 = fminf(v25, v31);
      goto LABEL_10;
    }
  }
  else if (v14 > 0.0)
  {
    v18 = v14 - v13;
    v19 = fmaxf(v18, 0.0);
LABEL_10:
    -[UIScrollView setContentOffset:](self->_scroller, "setContentOffset:", v16, v19);
    return 1;
  }
  return 0;
}

- (double)timedRegionYOrigin
{
  double v2;

  -[UIScrollView frame](self->_scroller, "frame");
  return v2;
}

- (void)highlightHour:(double)a3
{
  double v4;

  -[EKDayView _adjustSecondBackwardForDSTHole:](self, "_adjustSecondBackwardForDSTHole:", a3 * 3600.0);
  -[EKDayTimeView setHighlightedHour:](self->_timeView, "setHighlightedHour:", v4 / 3600.0);
}

- (double)highlightedHour
{
  double result;

  -[EKDayTimeView highlightedHour](self->_timeView, "highlightedHour");
  return result;
}

- (void)setAllDayLabelHighlighted:(BOOL)a3
{
  -[EKDayAllDayView setAllDayLabelHighlighted:](self->_allDayView, "setAllDayLabelHighlighted:", a3);
}

- (BOOL)isAllDayLabelHighlighted
{
  return -[EKDayAllDayView isAllDayLabelHighlighted](self->_allDayView, "isAllDayLabelHighlighted");
}

- (void)addViewToScroller:(id)a3 isAllDay:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  UIScrollView *v7;
  UIScrollView *scroller;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v4 = a4;
  v6 = a3;
  v19 = v6;
  if (v4)
  {
    -[EKDayAllDayView addViewToScroller:](self->_allDayView, "addViewToScroller:", v6);
LABEL_5:
    v9 = v19;
    goto LABEL_6;
  }
  objc_msgSend(v6, "superview");
  v7 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  scroller = self->_scroller;

  v9 = v19;
  if (v7 != scroller)
  {
    objc_msgSend(v19, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    objc_msgSend(v10, "convertRect:toView:", self->_scroller);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    -[UIScrollView addSubview:](self->_scroller, "addSubview:", v19);
    objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)configureOccurrenceViewForGestureController:(id)a3
{
  -[EKDayViewContent configureOccurrenceViewForGestureController:](self->_dayContent, "configureOccurrenceViewForGestureController:", a3);
}

- (EKDayViewDataSource)dataSource
{
  return (EKDayViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (id)displayDateDidChangeCallback
{
  return self->_displayDateDidChangeCallback;
}

- (void)setDisplayDateDidChangeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (id)contentDidChangeCallback
{
  return self->_contentDidChangeCallback;
}

- (void)setContentDidChangeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (BOOL)allowsOccurrenceSelection
{
  return self->_allowsOccurrenceSelection;
}

- (BOOL)showOnlyAllDayArea
{
  return self->_showOnlyAllDayArea;
}

- (double)additionalLeftPadding
{
  return self->_additionalLeftPadding;
}

- (void)setAdditionalLeftPadding:(double)a3
{
  self->_additionalLeftPadding = a3;
}

- (double)topContentInset
{
  return self->_topContentInset;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (void)setIsNowVisible:(BOOL)a3
{
  self->_isNowVisible = a3;
}

- (BOOL)scrollEventsInToViewIgnoresVisibility
{
  return self->_scrollEventsInToViewIgnoresVisibility;
}

- (void)setScrollEventsInToViewIgnoresVisibility:(BOOL)a3
{
  self->_scrollEventsInToViewIgnoresVisibility = a3;
}

- (BOOL)shouldEverShowTimeIndicators
{
  return self->_shouldEverShowTimeIndicators;
}

- (void)setSizeTimeViewUsingOnlyHourText:(BOOL)a3
{
  self->_sizeTimeViewUsingOnlyHourText = a3;
}

- (int)outlineStyle
{
  return self->_outlineStyle;
}

- (BOOL)allowPinchingHourHeights
{
  return self->_allowPinchingHourHeights;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)scrollAnimationDurationOverride
{
  return self->_scrollAnimationDurationOverride;
}

- (void)setScrollAnimationDurationOverride:(double)a3
{
  self->_scrollAnimationDurationOverride = a3;
}

- (double)hourScale
{
  return self->_hourScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong(&self->_contentDidChangeCallback, 0);
  objc_storeStrong(&self->_displayDateDidChangeCallback, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_timeMarkerTimer, 0);
  objc_storeStrong((id *)&self->_scroller, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_dayContent, 0);
  objc_storeStrong((id *)&self->_allDayView, 0);
  objc_storeStrong((id *)&self->_existingTimedOcurrences, 0);
  objc_storeStrong((id *)&self->_bottomLine, 0);
  objc_storeStrong((id *)&self->_bottomVerticalGridExtension, 0);
  objc_storeStrong((id *)&self->_topVerticalGridExtension, 0);
}

@end
