@implementation EKDayViewController

- (BOOL)dayViewShouldDrawSynchronously:(id)a3
{
  EKDayViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  char v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 0;
  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_msgSend(v7, "dayViewControllerShouldDrawSynchronously:", self);

  return v8;
}

- (NSDateComponents)displayDate
{
  return self->_displayDate;
}

- (void)dayView:(id)a3 didCreateOccurrenceViews:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[EKEventGestureController draggingView](self->_eventGestureController, "draggingView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[EKEventGestureController draggingView](self->_eventGestureController, "draggingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animationKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
      -[EKEventGestureController updateDraggingOccurrence](self->_eventGestureController, "updateDraggingOccurrence");
  }
}

void __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)setFrame:(CGRect)a3 gutterWidth:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ++self->_sizeTransitionsInProgress;
  -[EKDayViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", x, y, width, height);

  -[EKDayViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutSubviews");

  -[EKDayViewController setGutterWidth:](self, "setGutterWidth:", a4);
  -[EKDayViewController scrollDayViewAppropriatelyWithAnimation:](self, "scrollDayViewAppropriatelyWithAnimation:", 0);
  if ((*((_BYTE *)self + 1032) & 1) == 0)
    -[EKDayViewController _relayoutDays](self, "_relayoutDays");
  --self->_sizeTransitionsInProgress;
}

- (void)_relayoutDays
{
  int IsLeftToRight;
  double v4;
  double v5;
  double v6;
  double v7;
  int *v8;
  int *v9;

  IsLeftToRight = CalTimeDirectionIsLeftToRight();
  -[UIScrollView bounds](self->_horizontalScrollingView, "bounds");
  v5 = v4;
  v7 = v6;
  if (IsLeftToRight)
    v8 = &OBJC_IVAR___EKDayViewController__previousDayWithGutter;
  else
    v8 = &OBJC_IVAR___EKDayViewController__nextDayWithGutter;
  if (IsLeftToRight)
    v9 = &OBJC_IVAR___EKDayViewController__nextDayWithGutter;
  else
    v9 = &OBJC_IVAR___EKDayViewController__previousDayWithGutter;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v8), "setFrame:", 0.0, 0.0);
  -[EKDayViewWithGutters setFrame:](self->_currentDayWithGutter, "setFrame:", v5, 0.0, v5, v7);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v9), "setFrame:", v5 + v5, 0.0, v5, v7);
  -[UIScrollView setContentSize:](self->_horizontalScrollingView, "setContentSize:", v5 * 3.0, v7);
  -[EKDayViewWithGutters frame](self->_currentDayWithGutter, "frame");
  -[UIScrollView setContentOffset:](self->_horizontalScrollingView, "setContentOffset:");
  -[EKDayViewController _setNextAndPreviousFirstVisibleSecondToCurrent](self, "_setNextAndPreviousFirstVisibleSecondToCurrent");
}

- (void)layoutContainerView:(id)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  UIView *clipView;
  double gutterWidth;
  double v12;
  void *v13;
  _BOOL4 IsRegularInViewHierarchy;
  double v15;
  double Height;
  char v17;
  char v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  self->_requiresFullDayRelayout = 0;
  objc_msgSend(a3, "bounds");
  v7 = v4;
  v8 = v5;
  v9 = v6;
  clipView = self->_clipView;
  if (clipView)
  {
    -[UIView setFrame:](clipView, "setFrame:", v4, 0.0, v5, v6);
    gutterWidth = self->_gutterWidth;
    v19.origin.y = 0.0;
    v19.origin.x = v7;
    v19.size.width = v8;
    v19.size.height = v9;
    v12 = CGRectGetWidth(v19) + gutterWidth * 2.0;
    -[EKDayViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v13);

    if (IsRegularInViewHierarchy)
    {
      v15 = self->_gutterWidth;
      v12 = v12 + v15 * -4.0;
    }
    else
    {
      v15 = -gutterWidth;
    }
    v20.origin.y = 0.0;
    v20.origin.x = v7;
    v20.size.width = v8;
    v20.size.height = v9;
    Height = CGRectGetHeight(v20);
    -[UIScrollView setFrame:](self->_horizontalScrollingView, "setFrame:", v15, 0.0, v12, Height);
    v21.origin.y = 0.0;
    v21.origin.x = v15;
    v21.size.width = v12;
    v21.size.height = Height;
    -[UIScrollView setContentSize:](self->_horizontalScrollingView, "setContentSize:", CGRectGetWidth(v21) * 3.0, 0.0);
  }
  else
  {
    -[EKDayView setFrame:](self->_currentDay, "setFrame:", v4, 0.0, v5, v6);
  }
  if (-[EKEventGestureController dragGestureInProgress](self->_eventGestureController, "dragGestureInProgress"))
    v17 = -[UIScrollView isScrollAnimating](self->_horizontalScrollingView, "isScrollAnimating");
  else
    v17 = 0;
  if ((*((_BYTE *)self + 1032) & 1) == 0 && !-[UIScrollView isTracking](self->_horizontalScrollingView, "isTracking"))
  {
    if (self->_springAnimatedDecelerationsInProgress > 0)
      v18 = 1;
    else
      v18 = v17;
    if ((v18 & 1) == 0)
      -[EKDayViewController _relayoutDays](self, "_relayoutDays");
  }
}

- (void)blockableScrollViewDidChangeFrameSize
{
  id v2;

  self->_requiresFullDayRelayout = 1;
  -[EKDayViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)setGutterWidth:(double)a3
{
  self->_gutterWidth = a3;
  -[EKDayViewWithGutters setGutterWidth:](self->_nextDayWithGutter, "setGutterWidth:");
  -[EKDayViewWithGutters setGutterWidth:](self->_previousDayWithGutter, "setGutterWidth:", a3);
  -[EKDayViewWithGutters setGutterWidth:](self->_currentDayWithGutter, "setGutterWidth:", a3);
}

- (void)scrollDayViewAppropriatelyWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  NSDateComponents *displayDate;
  void *v6;

  v3 = a3;
  displayDate = self->_displayDate;
  CUIKTodayComponents();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(displayDate) = -[NSDateComponents isEqual:](displayDate, "isEqual:", v6);

  if ((_DWORD)displayDate)
    -[EKDayViewController scrollToNow:](self, "scrollToNow:", v3);
  else
    -[EKDayViewController scrollEventsIntoViewAnimated:](self, "scrollEventsIntoViewAnimated:", v3);
}

- (void)_setNextAndPreviousFirstVisibleSecondToCurrent
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[EKDayViewWithGutters superview](self->_previousDayWithGutter, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[EKDayViewWithGutters superview](self->_nextDayWithGutter, "superview"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = 0;
  }
  else
  {
    -[EKDayViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    EKUIPushFallbackSizingContextWithViewHierarchy(v9);

    v6 = 1;
  }
  -[EKDayView setFirstVisibleSecond:](self->_previousDay, "setFirstVisibleSecond:", -[EKDayView firstVisibleSecond](self->_currentDay, "firstVisibleSecond"));
  -[EKDayView setFirstVisibleSecond:](self->_nextDay, "setFirstVisibleSecond:", -[EKDayView firstVisibleSecond](self->_currentDay, "firstVisibleSecond"));
  if (v6)
  {
    -[EKDayViewController navigationController](self, "navigationController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    EKUIPopFallbackSizingContextWithViewHierarchy(v11);

  }
}

- (void)dayView:(id)a3 firstVisibleSecondChanged:(unint64_t)a4
{
  EKDayViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v7;
  void *v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    -[EKDayViewController currentDayView](self, "currentDayView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dayViewController:requestsSaveFirstVisibleSecondPreference:", self, objc_msgSend(v8, "firstVisibleSecond"));

  }
}

- (EKDayView)currentDayView
{
  return self->_currentDay;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKDayViewController;
  -[EKDayViewController viewDidLoad](&v4, sel_viewDidLoad);
  if (-[EKDayViewController shouldLogVisibleEvents](self, "shouldLogVisibleEvents"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__logUserStateDiagnostics_, *MEMORY[0x1E0D0CBD0], 0);

  }
}

- (BOOL)shouldLogVisibleEvents
{
  return self->_shouldLogVisibleEvents;
}

void __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  if (*(_DWORD *)(a1 + 40) != 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_eventsForDay:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "copy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 1072);
    *(_QWORD *)(v4 + 1072) = v3;

  }
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 1209))
  {
    objc_msgSend((id)v6, "_eventsForDay:", *(_QWORD *)(v6 + 1000));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 1088);
    *(_QWORD *)(v9 + 1088) = v8;

    objc_msgSend(*(id *)(a1 + 32), "_eventsForDay:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v14, "copy");
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 1080);
    *(_QWORD *)(v12 + 1080) = v11;

  }
}

- (id)_eventsForDay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSCalendar *calendar;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "displayDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "setHour:", 23);
  objc_msgSend(v6, "setMinute:", 59);
  objc_msgSend(v6, "setSecond:", 59);
  calendar = self->_calendar;
  objc_msgSend(v4, "displayDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCalendar dateFromComponents:](calendar, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewController eventsForStartDate:endDate:](self, "eventsForStartDate:endDate:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)scrollToNow:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[EKDayViewController _shouldScrollToNow](self, "_shouldScrollToNow"))
    -[EKDayView scrollToNowAnimated:whenFinished:](self->_currentDay, "scrollToNowAnimated:whenFinished:", v3, 0);
}

- (BOOL)_canScrollToNow
{
  BOOL v3;

  v3 = -[EKDayViewController _isCurrentDayToday](self, "_isCurrentDayToday");
  return v3 & !-[EKDayView isNowVisible](self->_currentDay, "isNowVisible");
}

- (BOOL)_isCurrentDayToday
{
  void *v2;
  void *v3;
  char v4;

  -[EKDayView displayDate](self->_currentDay, "displayDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKTodayComponents();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (id)eventsForStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v9, "dayViewController:eventsForStartDate:endDate:", self, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)loadView
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t targetSizeClass;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *reloadQueue;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *protectionQueue;
  double v14;
  void *v15;
  EKEventGestureController *v16;
  EKEventGestureController *eventGestureController;
  void *v18;
  double Width;
  void *v20;
  double Height;
  double v22;
  UIView *v23;
  UIView *clipView;
  BOOL v25;
  _BOOL8 v26;
  double gutterWidth;
  double v28;
  BlockableScrollView *v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  EKDayView *v34;
  int64_t v35;
  void *v36;
  EKDayView *v37;
  EKDayView *previousDay;
  EKDayView *v39;
  int64_t v40;
  NSDateComponents *displayDate;
  void *v42;
  uint64_t v43;
  EKDayView *v44;
  EKDayView *currentDay;
  uint64_t v46;
  EKDayView *v47;
  int64_t v48;
  void *v49;
  EKDayView *v50;
  EKDayView *nextDay;
  id WeakRetained;
  id v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  float v58;
  double v59;
  EKDayViewWithGutters *v60;
  EKDayViewWithGutters *previousDayWithGutter;
  EKDayViewWithGutters *v62;
  EKDayViewWithGutters *currentDayWithGutter;
  EKDayViewWithGutters *v64;
  EKDayViewWithGutters *nextDayWithGutter;
  void *v66;
  EKDayView *v67;
  void *v68;
  EKDayView *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  BlockableScrollView *v79;
  EKLayoutContainerView *v80;
  CGRect v81;
  CGRect v82;

  EKUIMultiwindowAssert(self->_targetSizeClass != 0, CFSTR("Target size class was not specified."), v2, v3, v4, v5, v6, v7, v72);
  targetSizeClass = self->_targetSizeClass;
  v10 = (OS_dispatch_queue *)dispatch_queue_create("dayControllerReload", 0);
  reloadQueue = self->_reloadQueue;
  self->_reloadQueue = v10;

  v12 = (OS_dispatch_queue *)dispatch_queue_create("dayControllerProtection", 0);
  protectionQueue = self->_protectionQueue;
  self->_protectionQueue = v12;

  v14 = 0.0;
  v80 = -[EKLayoutContainerView initWithFrame:]([EKLayoutContainerView alloc], "initWithFrame:", 0.0, 0.0, 400.0, 600.0);
  -[EKLayoutContainerView setAutoresizingMask:](v80, "setAutoresizingMask:", 18);
  -[EKLayoutContainerView setDelegate:](v80, "setDelegate:", self);
  -[EKDayViewController setView:](self, "setView:", v80);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKLayoutContainerView setBackgroundColor:](v80, "setBackgroundColor:", v15);

  if (!self->_eventGestureController)
  {
    v16 = -[EKEventGestureController initWithView:]([EKEventGestureController alloc], "initWithView:", v80);
    eventGestureController = self->_eventGestureController;
    self->_eventGestureController = v16;

    -[EKEventGestureController setDelegate:](self->_eventGestureController, "setDelegate:", self);
    -[EKEventGestureController setUsesHorizontalDragLocking:](self->_eventGestureController, "setUsesHorizontalDragLocking:", 1);
  }
  -[EKDayViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  Width = CGRectGetWidth(v81);

  -[EKDayViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  Height = CGRectGetHeight(v82);

  if (-[EKDayViewController showWeekdayLabel](self, "showWeekdayLabel"))
  {
    +[EKDayViewWithGutters defaultTopLabelContainerHeight](EKDayViewWithGutters, "defaultTopLabelContainerHeight");
    v14 = v22;
  }
  if (targetSizeClass != 2)
    Height = Height + -88.0;
  v23 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, Width, Height);
  clipView = self->_clipView;
  self->_clipView = v23;

  -[UIView setAutoresizingMask:](self->_clipView, "setAutoresizingMask:", 18);
  -[UIView setClipsToBounds:](self->_clipView, "setClipsToBounds:", 1);
  v25 = targetSizeClass == 2;
  v26 = targetSizeClass != 2;
  gutterWidth = self->_gutterWidth;
  if (v25)
    v28 = self->_gutterWidth;
  else
    v28 = -gutterWidth;
  if (v25)
    Width = Width + gutterWidth * -4.0;
  v29 = -[BlockableScrollView initWithFrame:]([BlockableScrollView alloc], "initWithFrame:", v28, 0.0, Width + gutterWidth * 2.0, Height);
  -[BlockableScrollView setBlockableDelegate:](v29, "setBlockableDelegate:", self);
  v79 = v29;
  objc_storeStrong((id *)&self->_horizontalScrollingView, v29);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView setBackgroundColor:](self->_horizontalScrollingView, "setBackgroundColor:", v30);

  -[UIScrollView setBounces:](self->_horizontalScrollingView, "setBounces:", 1);
  -[UIScrollView setPagingEnabled:](self->_horizontalScrollingView, "setPagingEnabled:", 1);
  -[UIScrollView setOpaque:](self->_horizontalScrollingView, "setOpaque:", 1);
  -[UIScrollView setDelegate:](self->_horizontalScrollingView, "setDelegate:", self);
  -[UIScrollView setScrollsToTop:](self->_horizontalScrollingView, "setScrollsToTop:", 0);
  -[UIScrollView setContentSize:](self->_horizontalScrollingView, "setContentSize:", self->_gutterWidth + self->_gutterWidth + Width * 3.0, 0.0);
  -[UIScrollView setAutoresizingMask:](self->_horizontalScrollingView, "setAutoresizingMask:", 18);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_horizontalScrollingView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_horizontalScrollingView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setDecelerationRate:](self->_horizontalScrollingView, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
  -[UIScrollView setDirectionalLockEnabled:](self->_horizontalScrollingView, "setDirectionalLockEnabled:", 1);
  -[UIScrollView setScrollEnabled:](self->_horizontalScrollingView, "setScrollEnabled:", -[EKDayViewController allowsDaySwitching](self, "allowsDaySwitching"));
  -[UIScrollView setClipsToBounds:](self->_horizontalScrollingView, "setClipsToBounds:", v26);
  -[UIScrollView setContentInsetAdjustmentBehavior:](self->_horizontalScrollingView, "setContentInsetAdjustmentBehavior:", 2);
  -[UIView addSubview:](self->_clipView, "addSubview:", self->_horizontalScrollingView);
  -[EKLayoutContainerView addSubview:](v80, "addSubview:", self->_clipView);
  v31 = self->_gutterWidth;
  v32 = Height - v14;
  v76 = -[EKDayViewController interfaceOrientation](self, "interfaceOrientation");
  -[NSDateComponents dateComponents:byAddingDays:calendar:](self->_displayDate, "dateComponents:byAddingDays:calendar:", 30, 0xFFFFFFFFLL, self->_calendar);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = [EKDayView alloc];
  v35 = self->_targetSizeClass;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v73) = 0;
  v78 = (void *)v33;
  v37 = -[EKDayView initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:](v34, "initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:", v35, v76, v33, v36, 1, 1, v31, v14, Width, v32, v73, self);
  previousDay = self->_previousDay;
  self->_previousDay = v37;

  v39 = [EKDayView alloc];
  v40 = self->_targetSizeClass;
  displayDate = self->_displayDate;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v74) = 0;
  v43 = v76;
  v44 = -[EKDayView initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:](v39, "initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:", v40, v76, displayDate, v42, 1, 1, v31, v14, Width, v32, v74, self);
  currentDay = self->_currentDay;
  self->_currentDay = v44;

  -[NSDateComponents dateComponents:byAddingDays:calendar:](self->_displayDate, "dateComponents:byAddingDays:calendar:", 30, 1, self->_calendar);
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = [EKDayView alloc];
  v48 = self->_targetSizeClass;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v75) = 0;
  v77 = (void *)v46;
  v50 = -[EKDayView initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:](v47, "initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:", v48, v43, v46, v49, 1, 1, v31, v14, Width, v32, v75, self);
  nextDay = self->_nextDay;
  self->_nextDay = v50;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v48) = objc_opt_respondsToSelector();

  if ((v48 & 1) != 0
    && (v53 = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(v53, "dayViewControllerPersistedHourScalePreference:", self),
        v55 = v54,
        v53,
        v55 > 0.0))
  {
    -[EKDayView setHourScale:](self->_currentDay, "setHourScale:", v55);
    -[EKDayView setHourScale:](self->_previousDay, "setHourScale:", v55);
    -[EKDayView setHourScale:](self->_nextDay, "setHourScale:", v55);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "dayViewHourScale");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v57, "floatValue");
      v59 = v58;
      -[EKDayView setHourScale:](self->_currentDay, "setHourScale:", v58);
      -[EKDayView setHourScale:](self->_previousDay, "setHourScale:", v59);
      -[EKDayView setHourScale:](self->_nextDay, "setHourScale:", v59);
    }

  }
  -[EKDayViewController _createGutterDayViewWithDayView:](self, "_createGutterDayViewWithDayView:", self->_previousDay);
  v60 = (EKDayViewWithGutters *)objc_claimAutoreleasedReturnValue();
  previousDayWithGutter = self->_previousDayWithGutter;
  self->_previousDayWithGutter = v60;

  -[EKDayViewController _createGutterDayViewWithDayView:](self, "_createGutterDayViewWithDayView:", self->_currentDay);
  v62 = (EKDayViewWithGutters *)objc_claimAutoreleasedReturnValue();
  currentDayWithGutter = self->_currentDayWithGutter;
  self->_currentDayWithGutter = v62;

  -[EKDayViewController _createGutterDayViewWithDayView:](self, "_createGutterDayViewWithDayView:", self->_nextDay);
  v64 = (EKDayViewWithGutters *)objc_claimAutoreleasedReturnValue();
  nextDayWithGutter = self->_nextDayWithGutter;
  self->_nextDayWithGutter = v64;

  -[UIScrollView addSubview:](self->_horizontalScrollingView, "addSubview:", self->_currentDayWithGutter);
  -[EKDayView setCalendar:](self->_currentDay, "setCalendar:", self->_calendar);
  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView setTimeZone:](self->_currentDay, "setTimeZone:", v66);

  -[EKDayView setDelegate:](self->_currentDay, "setDelegate:", self);
  -[EKDayView setDataSource:](self->_currentDay, "setDataSource:", self);
  -[EKDayView setAllowsOccurrenceSelection:](self->_currentDay, "setAllowsOccurrenceSelection:", self->_allowsSelection);
  v67 = self->_nextDay;
  if (v67)
  {
    -[EKDayView setCalendar:](v67, "setCalendar:", self->_calendar);
    -[NSCalendar timeZone](self->_calendar, "timeZone");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayView setTimeZone:](self->_nextDay, "setTimeZone:", v68);

    -[EKDayView setDelegate:](self->_nextDay, "setDelegate:", self);
    -[EKDayView setDataSource:](self->_nextDay, "setDataSource:", self);
    -[EKDayView setAllowsOccurrenceSelection:](self->_nextDay, "setAllowsOccurrenceSelection:", self->_allowsSelection);
  }
  v69 = self->_previousDay;
  if (v69)
  {
    -[EKDayView setCalendar:](v69, "setCalendar:", self->_calendar);
    -[NSCalendar timeZone](self->_calendar, "timeZone");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayView setTimeZone:](self->_previousDay, "setTimeZone:", v70);

    -[EKDayView setDelegate:](self->_previousDay, "setDelegate:", self);
    -[EKDayView setDataSource:](self->_previousDay, "setDataSource:", self);
    -[EKDayView setAllowsOccurrenceSelection:](self->_previousDay, "setAllowsOccurrenceSelection:", self->_allowsSelection);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addObserver:selector:name:object:", self, sel__localeChanged_, *MEMORY[0x1E0D0CA70], 0);
  objc_msgSend(v71, "addObserver:selector:name:object:", self, sel__showWeekNumbersPreferenceChanged_, *MEMORY[0x1E0D0CB58], 0);
  objc_msgSend(v71, "addObserver:selector:name:object:", self, sel_preferredContentSizeDidChanged_, *MEMORY[0x1E0DC48E8], 0);

}

- (id)_createGutterDayViewWithDayView:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double gutterWidth;
  double v12;
  EKDayViewWithGutters *v13;
  int v14;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  objc_msgSend(v4, "frame");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v9 = CGRectGetWidth(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v10 = CGRectGetHeight(v17);
  gutterWidth = self->_gutterWidth;
  if (-[EKDayViewController showWeekdayLabel](self, "showWeekdayLabel"))
  {
    +[EKDayViewWithGutters defaultTopLabelContainerHeight](EKDayViewWithGutters, "defaultTopLabelContainerHeight");
    v10 = v10 + v12;
  }
  v13 = -[EKDayViewWithGutters initWithFrame:dayView:sizeClass:showWeekDayLabel:showWeekNumberLabel:]([EKDayViewWithGutters alloc], "initWithFrame:dayView:sizeClass:showWeekDayLabel:showWeekNumberLabel:", v4, self->_targetSizeClass, -[EKDayViewController showWeekdayLabel](self, "showWeekdayLabel"), -[EKDayViewController showWeekNumberLabel](self, "showWeekNumberLabel"), 0.0, 0.0, v9 + gutterWidth * 2.0, v10);
  -[EKDayViewWithGutters setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
  v14 = objc_msgSend(v4, "hasAllDaySection");

  -[EKDayViewWithGutters setShowDividerLine:](v13, "setShowDividerLine:", v14 ^ 1u);
  return v13;
}

- (void)setDisplayDate:(id)a3
{
  id v4;

  v4 = a3;
  if ((*((_BYTE *)self + 1032) & 1) == 0
    && (objc_msgSend(v4, "isEqual:", self->_displayDate) & 1) == 0
    && !-[EKEventGestureController dragGestureInProgress](self->_eventGestureController, "dragGestureInProgress"))
  {
    -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
  }
  -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", 0);
  -[EKDayViewController _setDisplayDate:forRepeat:](self, "_setDisplayDate:forRepeat:", v4, 0);

}

- (void)_setDisplayDate:(id)a3 forRepeat:(BOOL)a4 animate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSDateComponents *v9;
  NSDateComponents *displayDate;
  double dayStart;
  void *v12;
  int v13;
  char v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  EKDayViewWithGutters **p_previousDayWithGutter;
  void *v35;
  int *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;

  v5 = a5;
  v8 = a3;
  -[EKDayViewController _completeScrollingAnimationIfNeeded](self, "_completeScrollingAnimationIfNeeded");
  -[EKDayViewController _completeDecelerationIfNeeded](self, "_completeDecelerationIfNeeded");
  objc_msgSend(v8, "dateComponentsForDateOnly");
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_instigatedDateChange && (objc_msgSend(obj, "isEqual:", self->_displayDate) & 1) == 0)
  {
    v9 = (NSDateComponents *)objc_msgSend(obj, "copy");
    displayDate = self->_displayDate;
    self->_displayDate = v9;

    dayStart = self->_dayStart;
    -[EKDayViewController _setDisplayDateInternal:](self, "_setDisplayDateInternal:", obj);
    -[EKDayView stopScrolling](self->_currentDay, "stopScrolling");
    if ((*((_BYTE *)self + 1064) & 2) != 0)
    {
LABEL_40:
      -[EKDayViewController _performDisplayedOccurrencesChangedDelegateMethodWithTrigger:](self, "_performDisplayedOccurrencesChangedDelegateMethodWithTrigger:", 0);
      goto LABEL_41;
    }
    if (!self->_horizontalScrollingView)
    {
      v14 = 0;
      goto LABEL_34;
    }
    if (a4 || !self->_viewAppeared)
      goto LABEL_31;
    -[EKDayView displayDate](self->_previousDay, "displayDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", obj);

    if (v13 && v5)
    {
      -[EKDayViewController _setNextAndPreviousFirstVisibleSecondToCurrent](self, "_setNextAndPreviousFirstVisibleSecondToCurrent");
      *((_BYTE *)self + 1032) |= 1u;
      v14 = 1;
      -[EKEventGestureController setCommitBlocked:](self->_eventGestureController, "setCommitBlocked:", 1);
      v15 = 1008;
      goto LABEL_15;
    }
    if (!self->_viewAppeared)
      goto LABEL_31;
    -[EKDayView displayDate](self->_nextDay, "displayDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", obj);

    if (v17 && v5)
    {
      -[EKDayViewController _setNextAndPreviousFirstVisibleSecondToCurrent](self, "_setNextAndPreviousFirstVisibleSecondToCurrent");
      *((_BYTE *)self + 1032) |= 1u;
      v14 = 1;
      -[EKEventGestureController setCommitBlocked:](self->_eventGestureController, "setCommitBlocked:", 1);
      v15 = 1024;
LABEL_15:
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v15), "frame");
      -[EKDayViewController _setHorizontalContentOffsetUsingSpringAnimation:](self, "_setHorizontalContentOffsetUsingSpringAnimation:");
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v15), "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        -[UIScrollView addSubview:](self->_horizontalScrollingView, "addSubview:", *(Class *)((char *)&self->super.super.super.isa + v15));
      goto LABEL_34;
    }
    if (!self->_viewAppeared)
      goto LABEL_31;
    -[EKDayView displayDate](self->_currentDay, "displayDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqual:", obj) && v5)
    {
      -[EKDayViewWithGutters frame](self->_currentDayWithGutter, "frame");
      v21 = v20;
      v23 = v22;
      -[UIScrollView contentOffset](self->_horizontalScrollingView, "contentOffset");
      v25 = v24;
      v27 = v26;

      if (v21 != v25 || v23 != v27)
      {
        -[EKDayViewController _setNextAndPreviousFirstVisibleSecondToCurrent](self, "_setNextAndPreviousFirstVisibleSecondToCurrent");
        *((_BYTE *)self + 1032) |= 1u;
        v14 = 1;
        -[EKEventGestureController setCommitBlocked:](self->_eventGestureController, "setCommitBlocked:", 1);
        -[EKDayViewWithGutters frame](self->_currentDayWithGutter, "frame");
        -[EKDayViewController _setHorizontalContentOffsetUsingSpringAnimation:](self, "_setHorizontalContentOffsetUsingSpringAnimation:");
        goto LABEL_34;
      }
    }
    else
    {

    }
    if (!self->_viewAppeared || !self->_alwaysAnimate || !v5)
    {
LABEL_31:
      objc_msgSend(obj, "dateComponents:byAddingDays:calendar:", 30, 0xFFFFFFFFLL, self->_calendar);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "dateComponents:byAddingDays:calendar:", 30, 1, self->_calendar);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", self->_previousDay, v37);
      -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", self->_currentDay, obj);
      -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", self->_nextDay, v38);
      -[EKDayViewController _setNextAndPreviousFirstVisibleSecondToCurrent](self, "_setNextAndPreviousFirstVisibleSecondToCurrent");
      if ((*((_BYTE *)self + 1032) & 1) == 0)
        -[EKDayViewController _relayoutDays](self, "_relayoutDays");

      v14 = 0;
      goto LABEL_34;
    }
    -[EKDayViewController calendar](self, "calendar");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayView displayDate](self->_currentDay, "displayDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dateFromComponents:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKDayViewController calendar](self, "calendar");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dateFromComponents:", obj);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v30, "compare:", v32);
    -[EKDayViewController _setNextAndPreviousFirstVisibleSecondToCurrent](self, "_setNextAndPreviousFirstVisibleSecondToCurrent");
    *((_BYTE *)self + 1032) |= 1u;
    -[EKEventGestureController setCommitBlocked:](self->_eventGestureController, "setCommitBlocked:", 1);
    self->_correctAfterScroll = 1;
    objc_storeStrong((id *)&self->_targetDateComponents, obj);
    if (v33 == 1)
    {
      p_previousDayWithGutter = &self->_previousDayWithGutter;
      -[EKDayViewWithGutters superview](self->_previousDayWithGutter, "superview");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = &OBJC_IVAR___EKDayViewController__previousDay;
      if (!v39)
LABEL_43:
        -[UIScrollView addSubview:](self->_horizontalScrollingView, "addSubview:", *p_previousDayWithGutter);
    }
    else
    {
      if (v33 != -1)
      {
        v14 = 0;
        goto LABEL_46;
      }
      p_previousDayWithGutter = &self->_nextDayWithGutter;
      -[EKDayViewWithGutters superview](self->_nextDayWithGutter, "superview");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = &OBJC_IVAR___EKDayViewController__nextDay;
      if (!v35)
        goto LABEL_43;
    }
    -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", *(Class *)((char *)&self->super.super.super.isa + *v36), obj);
    -[EKDayViewWithGutters frame](*p_previousDayWithGutter, "frame");
    -[EKDayViewController _setHorizontalContentOffsetUsingSpringAnimation:](self, "_setHorizontalContentOffsetUsingSpringAnimation:");
    v14 = 1;
LABEL_46:

LABEL_34:
    if ((*((_BYTE *)self + 1032) & 1) == 0
      && dayStart != self->_dayStart
      && -[EKDayViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[EKDayView setDisplayDate:](self->_currentDay, "setDisplayDate:", obj);
      -[EKDayViewController reloadData](self, "reloadData");
    }
    if ((v14 & 1) == 0)
      -[EKDayViewController scrollToNow:](self, "scrollToNow:", 0);
    goto LABEL_40;
  }
LABEL_41:

}

- (void)_setDisplayDate:(id)a3 forRepeat:(BOOL)a4
{
  -[EKDayViewController _setDisplayDate:forRepeat:animate:](self, "_setDisplayDate:forRepeat:animate:", a3, a4, 1);
}

- (void)_completeScrollingAnimationIfNeeded
{
  if (self->_needToCompleteScrollingAnimation)
  {
    self->_needToCompleteScrollingAnimation = 0;
    -[EKDayViewController _relayoutDaysDuringScrollingAndPerformDayChanges:](self, "_relayoutDaysDuringScrollingAndPerformDayChanges:", 0);
    -[EKDayViewController _cleanUpTargetDateComponents](self, "_cleanUpTargetDateComponents");
  }
}

- (void)_completeDecelerationIfNeeded
{
  if (self->_needToCompleteDeceleration)
  {
    self->_needToCompleteDeceleration = 0;
    -[EKDayViewController _scrollViewDidEndDecelerating:](self, "_scrollViewDidEndDecelerating:", self->_horizontalScrollingView);
  }
}

- (BOOL)allowsDaySwitching
{
  return self->_allowsDaySwitching;
}

- (void)_setDisplayDateInternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_msgSend(v4, "copy");
  objc_msgSend(v10, "setHour:", 0);
  objc_msgSend(v10, "setMinute:", 0);
  objc_msgSend(v10, "setSecond:", 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "setHour:", 23);
  objc_msgSend(v5, "setMinute:", 59);
  objc_msgSend(v5, "setSecond:", 59);
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  self->_dayStart = v7;

  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  self->_dayEnd = v9;

}

uint64_t __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_6(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dayViewControllerDidReloadData:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "_performDisplayedOccurrencesChangedDelegateMethodWithTrigger:", *(unsigned int *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_updateAllDayAreaHeight");
  objc_msgSend(*(id *)(a1 + 32), "updateGutterTopLabelsAppearance");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateAllDayAreaHeight
{
  UIScrollView *horizontalScrollingView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  if (-[EKDayViewController animateAllDayAreaHeight](self, "animateAllDayAreaHeight"))
  {
    horizontalScrollingView = self->_horizontalScrollingView;
    -[UIScrollView frame](horizontalScrollingView, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIScrollView superview](self->_horizontalScrollingView, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView convertRect:fromView:](horizontalScrollingView, "convertRect:fromView:", v12, v5, v7, v9, v11);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    -[EKDayViewController _weightedAllDayHeightForView:visibleRect:](self, "_weightedAllDayHeightForView:visibleRect:", self->_previousDayWithGutter, v14, v16, v18, v20);
    v22 = v21 + 0.0;
    -[EKDayViewController _weightedAllDayHeightForView:visibleRect:](self, "_weightedAllDayHeightForView:visibleRect:", self->_currentDayWithGutter, v14, v16, v18, v20);
    v24 = v22 + v23;
    -[EKDayViewController _weightedAllDayHeightForView:visibleRect:](self, "_weightedAllDayHeightForView:visibleRect:", self->_nextDayWithGutter, v14, v16, v18, v20);
    v26 = v24 + v25;
    -[EKDayViewWithGutters setAllDayHeight:](self->_previousDayWithGutter, "setAllDayHeight:", v24 + v25);
    -[EKDayViewWithGutters setAllDayHeight:](self->_currentDayWithGutter, "setAllDayHeight:", v26);
    -[EKDayViewWithGutters setAllDayHeight:](self->_nextDayWithGutter, "setAllDayHeight:", v26);
    -[EKDayViewWithGutters dayView](self->_previousDayWithGutter, "dayView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allDayView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFixedHeight:", v26);

    -[EKDayViewWithGutters dayView](self->_currentDayWithGutter, "dayView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allDayView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFixedHeight:", v26);

    -[EKDayViewWithGutters dayView](self->_nextDayWithGutter, "dayView");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "allDayView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFixedHeight:", v26);

  }
}

- (BOOL)animateAllDayAreaHeight
{
  return self->_animateAllDayAreaHeight;
}

- (void)viewWillAppear:(BOOL)a3
{
  EKDayView *currentDay;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKDayViewController;
  -[EKDayViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (self->_shouldScrollToNowOnViewWillAppear)
  {
    self->_shouldScrollToNowOnViewWillAppear = 0;
    currentDay = self->_currentDay;
    if (self->_startingFirstVisibleSecond < 0)
    {
      -[EKDayView scrollToNowAnimated:whenFinished:](currentDay, "scrollToNowAnimated:whenFinished:", 0, 0);
    }
    else
    {
      -[EKDayView setFirstVisibleSecond:](currentDay, "setFirstVisibleSecond:");
      -[EKDayView layoutIfNeeded](self->_currentDay, "layoutIfNeeded");
    }
  }
  -[EKDayViewController reloadDataIfNeeded](self, "reloadDataIfNeeded");
}

- (void)reloadData
{
  self->_needsReload = 0;
  -[EKDayViewController loadData:withTrigger:withCompletion:](self, "loadData:withTrigger:withCompletion:", 1, 0, 0);
}

- (void)reloadDataIfNeeded
{
  if (self->_needsReload)
    -[EKDayViewController reloadData](self, "reloadData");
}

- (void)loadData:(BOOL)a3 withTrigger:(int)a4 withCompletion:(id)a5
{
  id v8;
  NSObject *reloadQueue;
  _QWORD block[5];
  id v11;
  int v12;
  BOOL v13;

  v8 = a5;
  if (-[EKDayViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[EKDayView layoutSubviews](self->_currentDay, "layoutSubviews");
    -[EKDayView layoutSubviews](self->_previousDay, "layoutSubviews");
    -[EKDayView layoutSubviews](self->_nextDay, "layoutSubviews");
    reloadQueue = self->_reloadQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke;
    block[3] = &unk_1E601AFD0;
    block[4] = self;
    v12 = a4;
    v13 = a3;
    v11 = v8;
    dispatch_async(reloadQueue, block);

  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int64_t v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKDayViewController;
  -[EKDayViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (-[EKDayViewController isViewLoaded](self, "isViewLoaded"))
  {
    v7 = -[EKDayViewController _effectiveInterfaceOrientationForSize:](self, "_effectiveInterfaceOrientationForSize:", EKUICurrentWindowSize(v6));
    -[EKDayView setOrientation:](self->_previousDay, "setOrientation:", v7);
    -[EKDayView setOrientation:](self->_currentDay, "setOrientation:", v7);
    -[EKDayView setOrientation:](self->_nextDay, "setOrientation:", v7);
  }

}

- (int64_t)_effectiveInterfaceOrientationForSize:(CGSize)a3
{
  if (a3.height > a3.width)
    return 1;
  else
    return 4;
}

- (void)_performDisplayedOccurrencesChangedDelegateMethodWithTrigger:(int)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[EKDayViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  -[EKDayViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7, "dayViewController:didChangeDisplayedOccurrencesDueToTrigger:", self, v3);
  }
  else
  {
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
      return;
    -[EKDayViewController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dayViewControllerDidChangeDisplayedOccurrences:", self);
  }

}

- (void)dayView:(id)a3 didUpdateScrollPosition:(CGPoint)a4
{
  void *v5;
  char v6;
  id v7;

  -[EKDayViewController delegate](self, "delegate", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[EKDayViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dayViewControllerDidUpdateScrollPosition:", self);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  char v4;
  id v5;

  -[EKDayViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[EKDayViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateSelectedOccurrenceView");

  }
}

- (EKDayViewControllerDelegate)delegate
{
  return (EKDayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setStartingFirstVisibleSecond:(int)a3
{
  self->_startingFirstVisibleSecond = a3;
}

- (void)setShowsBanner:(BOOL)a3
{
  self->_showsBanner = a3;
}

- (void)setShouldLogVisibleEvents:(BOOL)a3
{
  self->_shouldLogVisibleEvents = a3;
}

- (void)setShouldAutoscrollAfterAppearance:(BOOL)a3
{
  self->_shouldAutoscrollAfterAppearance = a3;
}

- (void)setDisableNotifyDateChangeDuringTracking:(BOOL)a3
{
  self->_disableNotifyDateChangeDuringTracking = a3;
}

- (void)setAlwaysAnimate:(BOOL)a3
{
  self->_alwaysAnimate = a3;
}

- (double)gutterWidth
{
  return self->_gutterWidth;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void)setPreloadExtraDays:(BOOL)a3
{
  if (self->_preloadExtraDays != a3)
  {
    self->_preloadExtraDays = a3;
    if (a3)
    {
      if (self->_needsReload)
        -[EKDayViewController reloadData](self, "reloadData");
      else
        -[EKDayViewController loadData:withTrigger:withCompletion:](self, "loadData:withTrigger:withCompletion:", 1, 3, 0);
    }
  }
}

- (void)dayViewDidCompleteAsyncLoadAndLayout:(id)a3
{
  void *v4;
  id WeakRetained;
  char v6;
  id v7;

  if (self->_currentDay == a3)
  {
    -[EKEventGestureController draggingView](self->_eventGestureController, "draggingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[EKEventGestureController updateDraggingOccurrenceForced:animated:](self->_eventGestureController, "updateDraggingOccurrenceForced:animated:", 1, 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "dayViewControllerCurrentDayDidCompleteAsyncLoadAndLayout:", self);

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKDayViewController;
  -[EKDayViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_viewAppeared = 1;
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_6(uint64_t a1)
{
  int v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "generation");
  if (v2)
    v3 = v2 < *(_DWORD *)(a1 + 48);
  else
    v3 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_eventsForDay:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1072);
    *(_QWORD *)(v5 + 1072) = v4;

  }
}

- (EKDayViewController)initWithTargetSizeClass:(int64_t)a3
{
  EKDayViewController *v4;
  EKDayViewController *v5;
  uint64_t v6;
  NSDateComponents *displayDate;
  uint64_t v8;
  NSCalendar *calendar;
  uint64_t v10;
  ScrollSpringFactory *decelerationSpringFactory;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)EKDayViewController;
  v4 = -[EKDayViewController init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_shouldScrollToNowOnViewWillAppear = 1;
    v4->_allowsDaySwitching = 1;
    v4->_allowsSelection = 1;
    CUIKTodayComponents();
    v6 = objc_claimAutoreleasedReturnValue();
    displayDate = v5->_displayDate;
    v5->_displayDate = (NSDateComponents *)v6;

    CUIKCalendar();
    v8 = objc_claimAutoreleasedReturnValue();
    calendar = v5->_calendar;
    v5->_calendar = (NSCalendar *)v8;

    v5->_gutterWidth = 0.0;
    v10 = objc_opt_new();
    decelerationSpringFactory = v5->_decelerationSpringFactory;
    v5->_decelerationSpringFactory = (ScrollSpringFactory *)v10;

    v5->_preloadExtraDays = 1;
    v5->_targetSizeClass = a3;
    v5->_needsReload = 1;
    -[EKDayViewController _setDisplayDateInternal:](v5, "_setDisplayDateInternal:", v5->_displayDate);
    objc_initWeak(&location, v5);
    v19[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__EKDayViewController_initWithTargetSizeClass___block_invoke;
    v15[3] = &unk_1E6018610;
    objc_copyWeak(&v16, &location);
    v13 = (id)-[EKDayViewController registerForTraitChanges:withHandler:](v5, "registerForTraitChanges:withHandler:", v12, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)loadDataBetweenStart:(id)a3 end:(id)a4 withTrigger:(int)a5 generation:(int)a6 completionForCurrentDayReload:(id)a7
{
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  NSObject *reloadQueue;
  double v25;
  double v26;
  NSObject *v27;
  double v28;
  double v29;
  NSObject *v30;
  _QWORD v31[5];
  id v32;
  int v33;
  _QWORD v34[5];
  id v35;
  int v36;
  _QWORD block[5];
  id v38;
  int v39;
  _QWORD v40[5];
  id v41;
  int v42;
  _QWORD aBlock[5];
  int v44;

  v12 = a7;
  v13 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v15 = v14;
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v17 = v16;

  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke;
  aBlock[3] = &unk_1E6019A60;
  aBlock[4] = self;
  v44 = a5;
  v19 = _Block_copy(aBlock);
  v40[0] = v18;
  v40[1] = 3221225472;
  v40[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_3;
  v40[3] = &unk_1E601AFA8;
  v40[4] = self;
  v42 = a5;
  v20 = v12;
  v41 = v20;
  v21 = _Block_copy(v40);
  -[EKDayView dayEnd](self->_currentDay, "dayEnd");
  if (v15 < v22)
  {
    -[EKDayView dayStart](self->_currentDay, "dayStart");
    if (v17 >= v23)
    {
      reloadQueue = self->_reloadQueue;
      block[0] = v18;
      block[1] = 3221225472;
      block[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_5;
      block[3] = &unk_1E601AFA8;
      block[4] = self;
      v39 = a6;
      v38 = v21;
      dispatch_async(reloadQueue, block);

    }
  }
  if (self->_preloadExtraDays)
  {
    -[EKDayView dayEnd](self->_previousDay, "dayEnd");
    if (v15 < v25)
    {
      -[EKDayView dayStart](self->_previousDay, "dayStart");
      if (v17 >= v26)
      {
        v27 = self->_reloadQueue;
        v34[0] = v18;
        v34[1] = 3221225472;
        v34[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_7;
        v34[3] = &unk_1E601AFA8;
        v34[4] = self;
        v36 = a6;
        v35 = v19;
        dispatch_async(v27, v34);

      }
    }
    -[EKDayView dayEnd](self->_nextDay, "dayEnd");
    if (v15 < v28)
    {
      -[EKDayView dayStart](self->_nextDay, "dayStart");
      if (v17 >= v29)
      {
        v30 = self->_reloadQueue;
        v31[0] = v18;
        v31[1] = 3221225472;
        v31[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_9;
        v31[3] = &unk_1E601AFA8;
        v31[4] = self;
        v33 = a6;
        v32 = v19;
        dispatch_async(v30, v31);

      }
    }
  }

}

void __46__EKDayViewController__occurrencesForDayView___block_invoke(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  void **v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a1[4];
  v1 = (_QWORD *)a1[5];
  if (v2 == v1[125])
  {
    v5 = (void *)v1[136];
    v3 = (void **)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  else
  {
    v3 = (void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v2 == v1[123])
      v4 = 135;
    else
      v4 = 134;
    v5 = (void *)v1[v4];
  }
  v6 = v5;
  v7 = *v3;
  *v3 = v6;

}

- (id)_occurrencesForDayView:(id)a3
{
  id v4;
  NSObject *protectionQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  EKDayViewController *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__12;
  v17 = __Block_byref_object_dispose__12;
  v18 = 0;
  protectionQueue = self->_protectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__EKDayViewController__occurrencesForDayView___block_invoke;
  block[3] = &unk_1E601AFF8;
  v10 = v4;
  v11 = self;
  v12 = &v13;
  v6 = v4;
  dispatch_sync(protectionQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[6];
  int v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 1184);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_6;
  block[3] = &unk_1E601AF80;
  block[4] = v2;
  block[5] = &v6;
  v5 = *(_DWORD *)(a1 + 48);
  dispatch_sync(v3, block);
  if (*((_BYTE *)v7 + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "loadData:withCompletion:", 1, *(_QWORD *)(a1 + 40));
  _Block_object_dispose(&v6, 8);
}

void __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  dispatch_time_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  int v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD block[5];
  int v26;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 1184);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_2;
  block[3] = &unk_1E6019A60;
  v26 = *(_DWORD *)(a1 + 48);
  block[4] = v2;
  dispatch_sync(v3, block);
  v5 = dispatch_group_create();
  v6 = v5;
  if (*(_DWORD *)(a1 + 48) != 3)
  {
    dispatch_group_enter(v5);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
    v8 = *(unsigned __int8 *)(a1 + 52);
    v23[0] = v4;
    v23[1] = 3221225472;
    v23[2] = __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_3;
    v23[3] = &unk_1E6018688;
    v24 = v6;
    objc_msgSend(v7, "loadData:withCompletion:", v8, v23);

  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1209))
  {
    dispatch_group_enter(v6);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 984);
    v10 = *(unsigned __int8 *)(a1 + 52);
    v21[0] = v4;
    v21[1] = 3221225472;
    v21[2] = __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_4;
    v21[3] = &unk_1E6018688;
    v11 = v6;
    v22 = v11;
    objc_msgSend(v9, "loadData:withCompletion:", v10, v21);
    dispatch_group_enter(v11);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
    v13 = *(unsigned __int8 *)(a1 + 52);
    v19[0] = v4;
    v19[1] = 3221225472;
    v19[2] = __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_5;
    v19[3] = &unk_1E6018688;
    v20 = v11;
    objc_msgSend(v12, "loadData:withCompletion:", v13, v19);

  }
  v14 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v6, v14);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_6;
  v16[3] = &unk_1E601AFA8;
  v15 = *(void **)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_DWORD *)(a1 + 48);
  v17 = v15;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  double v5;
  double v6;
  int IsLeftToRight;
  _BOOL4 v8;
  EKDayViewWithGutters **p_nextDayWithGutter;
  void *v10;
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
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  id v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v38 = a3;
  if (!-[EKDayViewController _isResizing](self, "_isResizing") && !self->_adjustingForDeceleration)
  {
    objc_msgSend(v38, "panGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "velocityInView:", v38);
    v6 = v5;

    IsLeftToRight = CalTimeDirectionIsLeftToRight();
    v8 = v6 < 0.0;
    if (!IsLeftToRight)
      v8 = v6 > 0.0;
    if (v8)
    {
      p_nextDayWithGutter = &self->_nextDayWithGutter;
      -[EKDayViewWithGutters superview](self->_nextDayWithGutter, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_8;
    }
    p_nextDayWithGutter = &self->_previousDayWithGutter;
    -[EKDayViewWithGutters superview](self->_previousDayWithGutter, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
LABEL_8:
      -[UIScrollView addSubview:](self->_horizontalScrollingView, "addSubview:", *p_nextDayWithGutter);
    -[EKDayViewWithGutters superview](self->_nextDayWithGutter, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      -[UIScrollView bounds](self->_horizontalScrollingView, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[EKDayViewWithGutters frame](self->_nextDayWithGutter, "frame");
      v41.origin.x = v21;
      v41.origin.y = v22;
      v41.size.width = v23;
      v41.size.height = v24;
      v39.origin.x = v14;
      v39.origin.y = v16;
      v39.size.width = v18;
      v39.size.height = v20;
      if (CGRectIntersectsRect(v39, v41))
        -[UIScrollView addSubview:](self->_horizontalScrollingView, "addSubview:", self->_nextDayWithGutter);
    }
    -[EKDayViewWithGutters superview](self->_previousDayWithGutter, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {

    }
    else
    {
      -[UIScrollView bounds](self->_horizontalScrollingView, "bounds");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      -[EKDayViewWithGutters frame](self->_previousDayWithGutter, "frame");
      v42.origin.x = v34;
      v42.origin.y = v35;
      v42.size.width = v36;
      v42.size.height = v37;
      v40.origin.x = v27;
      v40.origin.y = v29;
      v40.size.width = v31;
      v40.size.height = v33;
      if (CGRectIntersectsRect(v40, v42))
        -[UIScrollView addSubview:](self->_horizontalScrollingView, "addSubview:", self->_previousDayWithGutter);
    }
    if ((*((_BYTE *)self + 1032) & 1) == 0 && self->_viewAppeared)
      -[EKDayViewController _relayoutDaysDuringScrolling](self, "_relayoutDaysDuringScrolling");
    if ((*((_BYTE *)self + 1064) & 1) != 0 && -[UIScrollView isTracking](self->_horizontalScrollingView, "isTracking"))
    {
      *((_BYTE *)self + 1064) &= ~1u;
      if ((*((_BYTE *)self + 1032) & 2) != 0)
      {
        -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", self->_nextDay, self->_pendingNextDate);
        *((_BYTE *)self + 1032) &= ~2u;
      }
      if ((*((_BYTE *)self + 1048) & 1) != 0)
      {
        -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", self->_previousDay, self->_pendingPreviousDate);
        *((_BYTE *)self + 1048) &= ~1u;
      }
    }
    -[EKDayViewController _updateAllDayAreaHeight](self, "_updateAllDayAreaHeight");
  }

}

- (BOOL)_isResizing
{
  if (self->_sizeTransitionsInProgress > 0 || self->_requiresFullDayRelayout)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[UIScrollView isResizing](self->_horizontalScrollingView, "isResizing");
  else
    return 0;
}

- (EKDayViewController)init
{
  return -[EKDayViewController initWithTargetSizeClass:](self, "initWithTargetSizeClass:", 1);
}

void __47__EKDayViewController_initWithTargetSizeClass___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[124], "resetOccurrenceViewColors");
    objc_msgSend(v2[125], "resetOccurrenceViewColors");
    objc_msgSend(v2[123], "resetOccurrenceViewColors");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIScrollView setDelegate:](self->_horizontalScrollingView, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[EKEventGestureController invalidate](self->_eventGestureController, "invalidate");
  -[EKDayViewController _stopShowNowTimer](self, "_stopShowNowTimer");
  v4.receiver = self;
  v4.super_class = (Class)EKDayViewController;
  -[EKDayViewController dealloc](&v4, sel_dealloc);
}

- (void)setScrollEventsInToViewIgnoresVisibility:(BOOL)a3
{
  -[EKDayView setScrollEventsInToViewIgnoresVisibility:](self->_currentDay, "setScrollEventsInToViewIgnoresVisibility:", a3);
}

- (BOOL)scrollEventsInToViewIgnoresVisibility
{
  return -[EKDayView scrollEventsInToViewIgnoresVisibility](self->_currentDay, "scrollEventsInToViewIgnoresVisibility");
}

- (void)_scrollDayViewAfterRelayoutDays
{
  -[EKDayViewController scrollDayViewAppropriatelyWithAnimation:](self, "scrollDayViewAppropriatelyWithAnimation:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKDayViewController;
  -[EKDayViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_viewAppeared = 0;
  -[EKDayViewController _stopShowNowTimer](self, "_stopShowNowTimer");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKDayViewController;
  -[EKDayViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
  -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", 0);
}

- (void)setAllowsDaySwitching:(BOOL)a3
{
  if (self->_allowsDaySwitching != a3)
  {
    self->_allowsDaySwitching = a3;
    -[UIScrollView setScrollEnabled:](self->_horizontalScrollingView, "setScrollEnabled:");
  }
}

- (void)setAllowsSelection:(BOOL)a3
{
  if (self->_allowsSelection != a3)
  {
    self->_allowsSelection = a3;
    -[EKDayView setAllowsOccurrenceSelection:](self->_currentDay, "setAllowsOccurrenceSelection:");
  }
}

- (unint64_t)firstVisibleSecond
{
  return -[EKDayView firstVisibleSecond](self->_currentDay, "firstVisibleSecond");
}

- (id)occurrenceViewForEvent:(id)a3
{
  return -[EKDayViewController occurrenceViewForEvent:occurrenceDate:](self, "occurrenceViewForEvent:occurrenceDate:", a3, 0);
}

- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4
{
  return -[EKDayViewController occurrenceViewForEvent:includeNextAndPreviousDays:](self, "occurrenceViewForEvent:includeNextAndPreviousDays:", a3, 0);
}

- (id)occurrenceViewForEvent:(id)a3 includeNextAndPreviousDays:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  EKDayView *v7;
  uint64_t v8;
  BOOL v9;
  EKDayView *v10;
  void *v11;
  BOOL v12;
  EKDayView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a4;
  v6 = a3;
  v7 = self->_currentDay;
  -[EKDayView occurrenceViewForEvent:](self->_currentDay, "occurrenceViewForEvent:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 1;
  else
    v9 = !v4;
  if (v9)
  {
    v11 = (void *)v8;
  }
  else
  {
    v10 = self->_nextDay;

    -[EKDayView occurrenceViewForEvent:](self->_nextDay, "occurrenceViewForEvent:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
  }
  if (v11)
    v12 = 1;
  else
    v12 = !v4;
  if (!v12)
  {
    v13 = self->_previousDay;

    -[EKDayView occurrenceViewForEvent:](self->_previousDay, "occurrenceViewForEvent:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
  }
  if (v11)
  {
    -[EKDayViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    EKUIPushFallbackSizingContextWithViewHierarchy(v15);

    -[EKDayView layoutIfNeeded](v7, "layoutIfNeeded");
    -[EKDayViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    EKUIPopFallbackSizingContextWithViewHierarchy(v17);

  }
  return v11;
}

- (id)gestureController
{
  return self->_eventGestureController;
}

- (UIView)currentAllDayView
{
  return (UIView *)-[EKDayView allDayView](self->_currentDay, "allDayView");
}

- (UIView)currentTopLabelsContainer
{
  return -[EKDayViewWithGutters topLabelsContainer](self->_currentDayWithGutter, "topLabelsContainer");
}

- (NSArray)currentDayContentGridViewSubviews
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[EKDayView dayContent](self->_currentDay, "dayContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "grid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "occurrenceContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (BOOL)currentDayContainsOccurrences
{
  return -[EKDayView containsOccurrences](self->_currentDay, "containsOccurrences");
}

- (void)setAnimateAllDayAreaHeight:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_animateAllDayAreaHeight != a3)
  {
    self->_animateAllDayAreaHeight = a3;
    if (a3)
    {
      -[EKDayViewController _updateAllDayAreaHeight](self, "_updateAllDayAreaHeight");
    }
    else
    {
      -[EKDayViewWithGutters dayView](self->_currentDayWithGutter, "dayView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "allDayView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFixedHeight:", -1.0);

      -[EKDayViewWithGutters dayView](self->_previousDayWithGutter, "dayView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allDayView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFixedHeight:", -1.0);

      -[EKDayViewWithGutters dayView](self->_nextDayWithGutter, "dayView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allDayView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFixedHeight:", -1.0);

    }
  }
}

- (BOOL)_isCalendarDate:(id)a3 sameDayAsComponents:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "era");
  if (v7 == objc_msgSend(v6, "era")
    && (v8 = objc_msgSend(v5, "year"), v8 == objc_msgSend(v6, "year"))
    && (v9 = objc_msgSend(v5, "month"), v9 == objc_msgSend(v6, "month")))
  {
    v10 = objc_msgSend(v5, "day");
    v11 = v10 == objc_msgSend(v6, "day");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)preferredEventsToSelectOnDate:(id)a3
{
  id v4;
  EKDayView **p_currentDay;
  void *v6;
  BOOL v7;
  void *v8;
  BOOL v9;
  void *v10;
  _BOOL4 v11;
  EKDayView *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  EKDayView *v21;
  id v22;
  uint64_t v23;
  BOOL v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  EKDayView *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  EKDayViewController *v67;
  int v68;
  void *v69;
  void *v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_currentDay = &self->_currentDay;
  -[EKDayView displayDate](self->_currentDay, "displayDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKDayViewController _isCalendarDate:sameDayAsComponents:](self, "_isCalendarDate:sameDayAsComponents:", v4, v6);

  if (v7)
    goto LABEL_4;
  p_currentDay = &self->_previousDay;
  -[EKDayView displayDate](self->_previousDay, "displayDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EKDayViewController _isCalendarDate:sameDayAsComponents:](self, "_isCalendarDate:sameDayAsComponents:", v4, v8);

  if (v9
    || (p_currentDay = &self->_nextDay,
        -[EKDayView displayDate](self->_nextDay, "displayDate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[EKDayViewController _isCalendarDate:sameDayAsComponents:](self, "_isCalendarDate:sameDayAsComponents:", v4, v10), v10, v11))
  {
LABEL_4:
    v12 = *p_currentDay;
  }
  else
  {
    v12 = 0;
  }
  CUIKTodayComponents();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView displayDate](v12, "displayDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "era");
  if (v15 == objc_msgSend(v13, "era"))
  {
    -[EKDayView displayDate](v12, "displayDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "year");
    if (v17 == objc_msgSend(v13, "year"))
    {
      -[EKDayView displayDate](v12, "displayDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "month");
      if (v19 == objc_msgSend(v13, "month"))
      {
        -[EKDayView displayDate](v12, "displayDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v12;
        v22 = v4;
        v23 = objc_msgSend(v20, "day");
        v24 = v23 == objc_msgSend(v13, "day");
        v4 = v22;
        v12 = v21;
        v25 = v24;
        v68 = v25;

      }
      else
      {
        v68 = 0;
      }

    }
    else
    {
      v68 = 0;
    }

  }
  else
  {
    v68 = 0;
  }

  CUIKNowDate();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView occurrenceViews](v12, "occurrenceViews");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26 && objc_msgSend(v26, "count"))
  {
    v63 = v27;
    v64 = v13;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    if (v29)
    {
      v30 = v29;
      v62 = v12;
      v69 = 0;
      v70 = v4;
      v66 = 0;
      v67 = self;
      v71 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v73 != v71)
            objc_enumerationMutation(v28);
          v32 = v28;
          v33 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v33, "occurrence", v62);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "startCalendarDate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "endCalendarDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "dayComponents");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[EKDayViewController _isCalendarDate:sameDayAsComponents:](self, "_isCalendarDate:sameDayAsComponents:", v35, v37);

          if (v38
            || (objc_msgSend(v34, "startDate"),
                v39 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v70, "date"),
                v40 = (void *)objc_claimAutoreleasedReturnValue(),
                v41 = objc_msgSend(v39, "compare:", v40),
                v40,
                v39,
                v41 != -1))
          {
            if (objc_msgSend(v34, "status") != 3
              && (CUIKEventDisplaysAsDeclined() & 1) == 0
              && objc_msgSend(v34, "existsInStore"))
            {
              if (v69)
              {
                objc_msgSend(v69, "occurrence");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "startDate");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "startDate");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v43, "compare:", v44);

                if (v45 == 1)
                {
                  v46 = v33;

                  v47 = v46;
                }
                else
                {
                  v47 = v69;
                }
              }
              else
              {
                v47 = v33;
              }
              v69 = v47;
              self = v67;
              if (v68)
              {
                objc_msgSend(v34, "endDateUnadjustedForLegacyClients");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend(v48, "compare:", v65);

                if (v49 == 1)
                {
                  if (v66)
                  {
                    objc_msgSend(v66, "occurrence");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "startDate");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "startDate");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = objc_msgSend(v51, "compare:", v52);

                    if (v53 == 1)
                    {
                      v54 = v33;

                      v66 = v54;
                    }
                  }
                  else
                  {
                    v66 = v33;
                  }
                }
              }
            }
          }

          v28 = v32;
        }
        v30 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      }
      while (v30);

      v12 = v62;
      if (v66)
      {
        objc_msgSend(v66, "occurrences");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = v69;
        v4 = v70;
        v27 = v63;
        v13 = v64;
        goto LABEL_53;
      }
      v4 = v70;
      v27 = v63;
      v13 = v64;
      if (v69)
      {
        objc_msgSend(v69, "occurrences");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v69;
        goto LABEL_53;
      }
    }
    else
    {

    }
  }
  -[EKDayView allDayView](v12, "allDayView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "occurrenceViews");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = v55;
  if (v55)
  {
    if (objc_msgSend(v55, "count"))
    {
      v58 = v55;
      objc_msgSend(v55, "firstObject");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "occurrence");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
      {
        objc_msgSend(v59, "occurrences");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v55 = 0;
      }

      v56 = v58;
    }
    else
    {
      v55 = 0;
    }
  }
LABEL_53:

  return v55;
}

- (void)setShowWeekdayLabel:(BOOL)a3
{
  self->_showWeekdayLabel = a3;
  -[EKDayViewController updateGutterTopLabelsAppearance](self, "updateGutterTopLabelsAppearance");
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)_eventsForCutOrCopy
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  char v10;
  id v11;

  -[EKEventGestureController event](self->_eventGestureController, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[EKEventGestureController event](self->_eventGestureController, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithObject:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
    {
      v7 = 0;
      return v7;
    }
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "selectedOccurrencesForDayViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "count"))
    {
      v7 = 0;
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_4:

  return v7;
}

- (void)copy:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  -[EKDayViewController _eventsForCutOrCopy](self, "_eventsForCutOrCopy", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "pasteboardManagerForDayViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "copyEvents:delegate:", v6, self);
    -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");

  }
}

- (void)cut:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  -[EKDayViewController _eventsForCutOrCopy](self, "_eventsForCutOrCopy", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "pasteboardManagerForDayViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "cutEvents:delegate:", v6, self);
    -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");

  }
}

- (void)paste:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[EKDayViewController _eventsForCutOrCopy](self, "_eventsForCutOrCopy", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "pasteboardManagerForDayViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDateForPaste:", v7);

  }
  else
  {
    -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", self->_displayDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDateForPaste:", v6);
  }

  objc_msgSend(v5, "pasteEventsWithDateMode:delegate:", 0, self);
  -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  id WeakRetained;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D0CDD0], "declinesToPerformCutCopyPasteAction:withSender:", a3, v6) & 1) == 0)
  {
    if (sel_paste_ == a3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(WeakRetained, "pasteboardManagerForDayViewController:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "canPerformPaste");
    }
    else
    {
      if (sel_copy_ == a3)
      {
        v11 = (void *)MEMORY[0x1E0D0CDD0];
        -[EKDayViewController _eventsForCutOrCopy](self, "_eventsForCutOrCopy");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = 1;
      }
      else
      {
        if (sel_cut_ != a3)
        {
          v16.receiver = self;
          v16.super_class = (Class)EKDayViewController;
          v7 = -[EKDayViewController canPerformAction:withSender:](&v16, sel_canPerformAction_withSender_, a3, v6);
          goto LABEL_12;
        }
        v14 = (void *)MEMORY[0x1E0D0CDD0];
        -[EKDayViewController _eventsForCutOrCopy](self, "_eventsForCutOrCopy");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v14;
        v13 = 0;
      }
      v10 = objc_msgSend(v12, "allEventsValidForAction:fromEvents:", v13, v9);
    }
    v7 = v10;

    goto LABEL_12;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (void)dayView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v13;

  v5 = a5;
  v13 = a4;
  -[EKEventGestureController event](self->_eventGestureController, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!v13)
      goto LABEL_11;
    goto LABEL_8;
  }
  -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", 0);
  if (-[EKDayViewController _shouldEndGestureEditingOnTap](self, "_shouldEndGestureEditingOnTap")
    && !-[EKEventGestureController dragGestureInProgress](self->_eventGestureController, "dragGestureInProgress"))
  {
    -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
  }
  if (-[EKDayViewController notifyWhenTapOtherEventDuringDragging](self, "notifyWhenTapOtherEventDuringDragging"))
  {
LABEL_8:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v9 = WeakRetained;
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        v12 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v12, "dayViewController:didSelectEvent:animated:userInitiated:", self, v13, 1, v5);

      }
    }
  }
LABEL_11:

}

- (void)dayView:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5
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
      objc_msgSend(v11, "dayViewController:didSelectEvents:animated:userInitiated:", self, v12, 1, v5);

    }
  }

}

- (void)dayView:(id)a3 didScaleDayViewWithScale:(double)a4
{
  void *v6;
  double v7;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  id v12;
  char v13;
  id v14;

  -[EKDayView setHourScale:](self->_previousDay, "setHourScale:", a3);
  -[EKDayView setNeedsLayout](self->_previousDay, "setNeedsLayout");
  -[EKDayView setHourScale:](self->_nextDay, "setHourScale:", a4);
  -[EKDayView setNeedsLayout](self->_nextDay, "setNeedsLayout");
  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDayViewHourScale:", v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "dayViewController:requestsSaveHourScalePreference:", self, a4);

  }
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "dayViewControllerDidFinishPinchingDayView:", self);

  }
  -[EKEventGestureController updateDraggingOccurrenceFrame](self->_eventGestureController, "updateDraggingOccurrenceFrame");
}

- (void)dayView:(id)a3 isPinchingDayViewWithScale:(double)a4
{
  EKDayViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "dayViewControllerIsPinchingDayView:", self);

  }
  -[EKEventGestureController updateDraggingOccurrenceFrame](self->_eventGestureController, "updateDraggingOccurrenceFrame");
}

- (id)dayView:(id)a3 selectedCopyViewForOccurrence:(id)a4
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
    objc_msgSend(v8, "dayViewController:selectedCopyViewForView:", self, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)presentationControllerForEditMenu
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[EKDayViewController currentPresentationController](self, "currentPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "presentedViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v2;
  }
  v5 = v4;

  return v5;
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

- (void)setCalendar:(id)a3
{
  void *v4;
  void *v5;
  NSCalendar *v6;
  NSCalendar *calendar;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "isEqual:", self->_calendar) & 1) == 0)
  {
    -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", self->_displayDate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar timeZone](self->_calendar, "timeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSCalendar *)objc_msgSend(v9, "copy");
    calendar = self->_calendar;
    self->_calendar = v6;

    -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v5);
    -[EKDayViewController _setDisplayDateInternal:](self, "_setDisplayDateInternal:", self->_displayDate);
    -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 30, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayViewController setDisplayDate:](self, "setDisplayDate:", v8);

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
    -[EKDayViewController _setDisplayDateInternal:](self, "_setDisplayDateInternal:", self->_displayDate);
    -[EKDayView setTimeZone:](self->_currentDay, "setTimeZone:", v6);
    -[EKDayView setTimeZone:](self->_previousDay, "setTimeZone:", v6);
    -[EKDayView setTimeZone:](self->_nextDay, "setTimeZone:", v6);
  }

}

- (void)setGestureOccurrenceSuperview:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;

  v8 = (UIView *)a3;
  if (self->_gestureOccurrenceSuperview != v8)
  {
    objc_storeStrong((id *)&self->_gestureOccurrenceSuperview, a3);
    -[EKEventGestureController draggingView](self->_eventGestureController, "draggingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[EKEventGestureController draggingView](self->_eventGestureController, "draggingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKDayViewController _eventGestureSuperview](self, "_eventGestureSuperview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CalSwitchViewToSuperview(v6, v7);

    }
  }

}

- (void)scrollToDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  EKDayView *currentDay;
  id v6;

  v4 = a4;
  currentDay = self->_currentDay;
  objc_msgSend(a3, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[EKDayView scrollToDate:animated:whenFinished:](currentDay, "scrollToDate:animated:whenFinished:", v6, v4, 0);

}

- (void)scrollEventIntoView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  EKDayView *previousDay;
  id v7;
  EKDayView *currentDay;
  _QWORD v9[5];

  v4 = a4;
  previousDay = self->_previousDay;
  v7 = a3;
  -[EKDayView scrollToEvent:animated:completionBlock:](previousDay, "scrollToEvent:animated:completionBlock:", v7, v4, 0);
  -[EKDayView scrollToEvent:animated:completionBlock:](self->_nextDay, "scrollToEvent:animated:completionBlock:", v7, v4, 0);
  currentDay = self->_currentDay;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__EKDayViewController_scrollEventIntoView_animated___block_invoke;
  v9[3] = &unk_1E6018688;
  v9[4] = self;
  -[EKDayView scrollToEvent:animated:completionBlock:](currentDay, "scrollToEvent:animated:completionBlock:", v7, v4, v9);

}

void __52__EKDayViewController_scrollEventIntoView_animated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "gestureController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateDraggingOccurrenceOrigin");

}

- (void)scrollEventsIntoViewAnimated:(BOOL)a3
{
  -[EKDayView scrollEventsIntoViewAnimated:](self->_currentDay, "scrollEventsIntoViewAnimated:", a3);
}

- (void)bringEventToFront:(id)a3
{
  -[EKDayView bringEventToFront:](self->_currentDay, "bringEventToFront:", a3);
}

- (void)insertViewForEvent:(id)a3 belowViewForOtherEvent:(id)a4
{
  -[EKDayView insertViewForEvent:belowViewForOtherEvent:](self->_currentDay, "insertViewForEvent:belowViewForOtherEvent:", a3, a4);
}

- (void)editorDidSaveEvent:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
  -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "dayViewController:awaitsRefreshingOccurrence:", self, v7);

  }
  -[EKDayViewController reloadData](self, "reloadData");

}

- (void)editorDidDeleteEvent:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
  -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "dayViewController:awaitsDeletingOccurrence:", self, v7);

  }
  -[EKDayViewController reloadData](self, "reloadData");

}

- (void)editorDidCancelEditingEvent:(id)a3
{
  -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart", a3);
  -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", 0);
}

- (void)setNeedsReload
{
  self->_needsReload = 1;
}

- (BOOL)_delegateRespondsToDisplayedOccurrencesChangedMethod
{
  void *v3;
  char v4;
  void *v5;

  -[EKDayViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[EKDayViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (void)reloadDataForOccurrenceChangeWithGeneration:(int)a3
{
  NSObject *protectionQueue;
  _QWORD block[6];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  protectionQueue = self->_protectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__EKDayViewController_reloadDataForOccurrenceChangeWithGeneration___block_invoke;
  block[3] = &unk_1E601AF80;
  block[4] = self;
  block[5] = &v7;
  v6 = a3;
  dispatch_sync(protectionQueue, block);
  if (*((_BYTE *)v8 + 24))
    -[EKDayViewController reloadData](self, "reloadData");
  _Block_object_dispose(&v7, 8);
}

uint64_t __67__EKDayViewController_reloadDataForOccurrenceChangeWithGeneration___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t result;
  BOOL v5;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "generation");
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "generation");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "generation");
  if (v2 && v2 < *(_DWORD *)(a1 + 48) || v3 && v3 < *(_DWORD *)(a1 + 48))
  {
    v5 = 1;
  }
  else if ((_DWORD)result)
  {
    v5 = (int)result < *(_DWORD *)(a1 + 48);
  }
  else
  {
    v5 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  return result;
}

void __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__EKDayViewController_loadData_withTrigger_withCompletion___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  int v3;

  if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToDisplayedOccurrencesChangedMethod"))
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_2;
    v2[3] = &unk_1E6019A60;
    v2[4] = *(_QWORD *)(a1 + 32);
    v3 = *(_DWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v2);
  }
}

uint64_t __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performDisplayedOccurrencesChangedDelegateMethodWithTrigger:", *(unsigned int *)(a1 + 40));
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  int v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToDisplayedOccurrencesChangedMethod"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_4;
    block[3] = &unk_1E601AFA8;
    v2 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v5 = *(_DWORD *)(a1 + 48);
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_performDisplayedOccurrencesChangedDelegateMethodWithTrigger:", *(unsigned int *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[6];
  int v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 1184);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_8;
  block[3] = &unk_1E601AF80;
  block[4] = v2;
  block[5] = &v6;
  v5 = *(_DWORD *)(a1 + 48);
  dispatch_sync(v3, block);
  if (*((_BYTE *)v7 + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "loadData:withCompletion:", 1, *(_QWORD *)(a1 + 40));
  _Block_object_dispose(&v6, 8);
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_8(uint64_t a1)
{
  int v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "generation");
  if (v2)
    v3 = v2 < *(_DWORD *)(a1 + 48);
  else
    v3 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_eventsForDay:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1080);
    *(_QWORD *)(v5 + 1080) = v4;

  }
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[6];
  int v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 1184);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_10;
  block[3] = &unk_1E601AF80;
  block[4] = v2;
  block[5] = &v6;
  v5 = *(_DWORD *)(a1 + 48);
  dispatch_sync(v3, block);
  if (*((_BYTE *)v7 + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "loadData:withCompletion:", 1, *(_QWORD *)(a1 + 40));
  _Block_object_dispose(&v6, 8);
}

void __101__EKDayViewController_loadDataBetweenStart_end_withTrigger_generation_completionForCurrentDayReload___block_invoke_10(uint64_t a1)
{
  int v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "generation");
  if (v2)
    v3 = v2 < *(_DWORD *)(a1 + 48);
  else
    v3 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_eventsForDay:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1088);
    *(_QWORD *)(v5 + 1088) = v4;

  }
}

- (void)significantTimeChangeOccurred
{
  -[EKDayView adjustForSignificantTimeChange](self->_nextDay, "adjustForSignificantTimeChange");
  -[EKDayView adjustForSignificantTimeChange](self->_currentDay, "adjustForSignificantTimeChange");
  -[EKDayView adjustForSignificantTimeChange](self->_previousDay, "adjustForSignificantTimeChange");
}

- (BOOL)dayViewShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4
{
  return self->_currentDay == a3;
}

- (void)_localeChanged:(id)a3
{
  void *v4;
  _QWORD block[5];

  -[EKDayViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__EKDayViewController__localeChanged___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __38__EKDayViewController__localeChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateGutterTopLabelsAppearance");
}

- (void)_showWeekNumbersPreferenceChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__EKDayViewController__showWeekNumbersPreferenceChanged___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __57__EKDayViewController__showWeekNumbersPreferenceChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateGutterTopLabelsAppearance");
}

- (void)preferredContentSizeDidChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__EKDayViewController_preferredContentSizeDidChanged___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __54__EKDayViewController_preferredContentSizeDidChanged___block_invoke(uint64_t a1)
{
  +[EKUILargeTextUtilities clearCache](EKUILargeTextUtilities, "clearCache");
  return objc_msgSend(*(id *)(a1 + 32), "updateGutterTopLabelsAppearance");
}

- (void)updateGutterTopLabelsAppearance
{
  -[EKDayViewWithGutters setShowWeekNumberLabel:](self->_previousDayWithGutter, "setShowWeekNumberLabel:", -[EKDayViewController showWeekNumberLabel](self, "showWeekNumberLabel"));
  -[EKDayViewWithGutters setShowWeekDayLabel:](self->_previousDayWithGutter, "setShowWeekDayLabel:", -[EKDayViewController showWeekdayLabel](self, "showWeekdayLabel"));
  -[EKDayViewWithGutters updateLabelTexts](self->_previousDayWithGutter, "updateLabelTexts");
  -[EKDayViewWithGutters updateDividerLineVisibility](self->_previousDayWithGutter, "updateDividerLineVisibility");
  -[EKDayViewWithGutters setNeedsLayout](self->_previousDayWithGutter, "setNeedsLayout");
  -[EKDayViewWithGutters setShowWeekNumberLabel:](self->_currentDayWithGutter, "setShowWeekNumberLabel:", -[EKDayViewController showWeekNumberLabel](self, "showWeekNumberLabel"));
  -[EKDayViewWithGutters setShowWeekDayLabel:](self->_currentDayWithGutter, "setShowWeekDayLabel:", -[EKDayViewController showWeekdayLabel](self, "showWeekdayLabel"));
  -[EKDayViewWithGutters updateLabelTexts](self->_currentDayWithGutter, "updateLabelTexts");
  -[EKDayViewWithGutters updateDividerLineVisibility](self->_currentDayWithGutter, "updateDividerLineVisibility");
  -[EKDayViewWithGutters setNeedsLayout](self->_currentDayWithGutter, "setNeedsLayout");
  -[EKDayViewWithGutters setShowWeekNumberLabel:](self->_nextDayWithGutter, "setShowWeekNumberLabel:", -[EKDayViewController showWeekNumberLabel](self, "showWeekNumberLabel"));
  -[EKDayViewWithGutters setShowWeekDayLabel:](self->_nextDayWithGutter, "setShowWeekDayLabel:", -[EKDayViewController showWeekdayLabel](self, "showWeekdayLabel"));
  -[EKDayViewWithGutters updateLabelTexts](self->_nextDayWithGutter, "updateLabelTexts");
  -[EKDayViewWithGutters updateDividerLineVisibility](self->_nextDayWithGutter, "updateDividerLineVisibility");
  -[EKDayViewWithGutters setNeedsLayout](self->_nextDayWithGutter, "setNeedsLayout");
}

- (BOOL)showWeekNumberLabel
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showWeekNumbers");

  return v3;
}

- (void)_highlightEvent:(id)a3 dayViewDate:(double)a4 isAllDay:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  int v10;
  double v11;
  double v12;

  v5 = a5;
  v8 = a3;
  -[EKDayViewController gestureController](self, "gestureController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "currentDragSnappingType");

  v11 = CalSnapDateTo15MinuteOr5MinuteInterval(v8, v10, a4 - self->_dayStart);
  v12 = v11 / 3600.0;
  if (v5)
    v12 = -1.0;
  -[EKDayView highlightHour:](self->_currentDay, "highlightHour:", v12);
  -[EKDayView setAllDayLabelHighlighted:](self->_currentDay, "setAllDayLabelHighlighted:", v5);
}

- (void)dayViewDidTapEmptySpace:(id)a3 onDate:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  EKDayView *currentDay;
  _QWORD block[5];
  id v12;
  _QWORD v13[4];
  NSObject *v14;

  v6 = a4;
  if (self->_currentDay == a3)
  {
    v7 = dispatch_group_create();
    v8 = -[EKDayViewController _shouldEndGestureEditingOnTap](self, "_shouldEndGestureEditingOnTap");
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
      -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", 0);
      dispatch_group_enter(v7);
      currentDay = self->_currentDay;
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __54__EKDayViewController_dayViewDidTapEmptySpace_onDate___block_invoke;
      v13[3] = &unk_1E6018688;
      v14 = v7;
      -[EKDayView loadData:withCompletion:](currentDay, "loadData:withCompletion:", 1, v13);

    }
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __54__EKDayViewController_dayViewDidTapEmptySpace_onDate___block_invoke_2;
    block[3] = &unk_1E6018EC0;
    block[4] = self;
    v12 = v6;
    dispatch_group_notify(v7, MEMORY[0x1E0C80D38], block);

  }
}

void __54__EKDayViewController_dayViewDidTapEmptySpace_onDate___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __54__EKDayViewController_dayViewDidTapEmptySpace_onDate___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dayViewControllerDidTapEmptySpace:onDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_performDisplayedOccurrencesChangedDelegateMethodWithTrigger:", 0);
}

- (id)_eventGestureSuperview
{
  void *v3;
  UIView *v4;
  UIView *v5;

  -[EKDayViewController gestureOccurrenceSuperview](self, "gestureOccurrenceSuperview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[EKDayViewController gestureOccurrenceSuperview](self, "gestureOccurrenceSuperview");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_clipView;
  }
  v5 = v4;

  return v5;
}

- (double)horizontalOffsetForPagingForEventGestureController:(id)a3
{
  void *v4;
  _BOOL4 IsRegularInViewHierarchy;

  -[EKDayViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v4);

  if (IsRegularInViewHierarchy)
    return self->_gutterWidth * 2.0 + 80.0;
  else
    return 80.0;
}

- (id)createOccurrenceViewForEventGestures
{
  EKDayOccurrenceView *v3;
  EKDayOccurrenceView *v4;

  v3 = [EKDayOccurrenceView alloc];
  v4 = -[EKDayOccurrenceView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[EKDayOccurrenceView setDelegate:](v4, "setDelegate:", self);
  return v4;
}

- (id)createOccurrenceViewForEventGestureController:(id)a3
{
  -[EKDayViewController createOccurrenceViewForEventGestures](self, "createOccurrenceViewForEventGestures", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)eventGestureController:(id)a3 adjustDraggingView:(id)a4 forAllDay:(BOOL)a5
{
  _BOOL8 v5;
  EKDayView *currentDay;
  void *v8;
  id v9;

  v5 = a5;
  v9 = a4;
  objc_msgSend(v9, "setAllDayDrawingStyle:", v5);
  currentDay = self->_currentDay;
  if (v5)
  {
    -[EKDayView allDayView](currentDay, "allDayView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configureOccurrenceViewForGestureController:", v9);

  }
  else
  {
    -[EKDayView configureOccurrenceViewForGestureController:](currentDay, "configureOccurrenceViewForGestureController:", v9);
  }

}

- (id)createEventForEventGestureController:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", self->_displayDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_msgSend(WeakRetained, "dayViewController:createEventAtDate:allDay:", self, v4, 0);

  return v6;
}

- (void)showTimelineHighlightForTime:(id)a3
{
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  -[EKDayViewController _highlightEvent:dayViewDate:isAllDay:](self, "_highlightEvent:dayViewDate:isAllDay:", 0, 0);
}

- (void)hideTimelineHighlight
{
  -[EKDayView highlightHour:](self->_currentDay, "highlightHour:", -1.0);
  -[EKDayView setAllDayLabelHighlighted:](self->_currentDay, "setAllDayLabelHighlighted:", 0);
  -[EKDayView highlightHour:](self->_previousDay, "highlightHour:", -1.0);
  -[EKDayView setAllDayLabelHighlighted:](self->_previousDay, "setAllDayLabelHighlighted:", 0);
  -[EKDayView highlightHour:](self->_nextDay, "highlightHour:", -1.0);
  -[EKDayView setAllDayLabelHighlighted:](self->_nextDay, "setAllDayLabelHighlighted:", 0);
}

- (double)eventGestureController:(id)a3 yPositionPerhapsMatchingAllDayOccurrence:(id)a4 atPoint:(CGPoint)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v7 = a4;
  -[EKDayViewController touchTrackingViewForEventGestureController:](self, "touchTrackingViewForEventGestureController:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView yPositionPerhapsMatchingAllDayOccurrence:](self->_currentDay, "yPositionPerhapsMatchingAllDayOccurrence:", v7);
  v10 = v9;

  objc_msgSend(v8, "convertPoint:fromView:", self->_currentDay, 0.0, v10);
  v12 = v11;

  return v12;
}

- (void)eventGestureController:(id)a3 addViewToScroller:(id)a4 isAllDay:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  -[EKDayViewController gestureOccurrenceSuperview](self, "gestureOccurrenceSuperview");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        objc_msgSend(v13, "draggingView"),
        v11 = (id)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11 == v8))
  {
    -[EKDayViewController gestureOccurrenceSuperview](self, "gestureOccurrenceSuperview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CalSwitchViewToSuperview(v8, v12);

  }
  else
  {
    -[EKDayView addViewToScroller:isAllDay:](self->_currentDay, "addViewToScroller:isAllDay:", v8, v5);
  }

}

- (id)eventGestureController:(id)a3 occurrenceViewAtPoint:(CGPoint)a4 ignoreSelectedCopyView:(BOOL)a5
{
  double y;
  double x;
  EKDayView *currentDay;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  y = a4.y;
  x = a4.x;
  currentDay = self->_currentDay;
  -[EKDayViewController _eventGestureSuperview](self, "_eventGestureSuperview", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView convertPoint:fromView:](currentDay, "convertPoint:fromView:", v9, x, y);
  v11 = v10;
  v13 = v12;

  return -[EKDayView occurrenceViewAtPoint:](self->_currentDay, "occurrenceViewAtPoint:", v11, v13);
}

- (id)eventGestureController:(id)a3 occurrenceViewForOccurrence:(id)a4 occurrenceDate:(id)a5
{
  return -[EKDayViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", a4);
}

- (id)eventGestureController:(id)a3 occurrenceViewForOccurrence:(id)a4
{
  return -[EKDayViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", a4);
}

- (BOOL)eventGestureController:(id)a3 isAllDayAtPoint:(CGPoint)a4 requireInsistence:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  EKDayViewWithGutters *currentDayWithGutter;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  currentDayWithGutter = self->_currentDayWithGutter;
  -[EKDayViewController _eventGestureSuperview](self, "_eventGestureSuperview", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewWithGutters convertPoint:fromView:](currentDayWithGutter, "convertPoint:fromView:", v10, x, y);
  v12 = v11;
  v14 = v13;

  return -[EKDayViewWithGutters isPointAllDay:requireAllDayRegionInsistence:](self->_currentDayWithGutter, "isPointAllDay:requireAllDayRegionInsistence:", v5, v12, v14);
}

- (double)eventGestureController:(id)a3 dateAtPoint:(CGPoint)a4
{
  double y;
  double x;
  EKDayView *currentDay;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double result;

  y = a4.y;
  x = a4.x;
  currentDay = self->_currentDay;
  -[EKDayViewController _eventGestureSuperview](self, "_eventGestureSuperview", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView convertPoint:fromView:](currentDay, "convertPoint:fromView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  -[EKDayView dateAtPoint:isAllDay:](self->_currentDay, "dateAtPoint:isAllDay:", 0, v10, v12);
  return result;
}

- (CGPoint)pointAtDate:(double)a3 isAllDay:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  -[EKDayView pointAtDate:isAllDay:](self->_currentDay, "pointAtDate:isAllDay:", a4, a3);
  v6 = v5;
  v8 = v7;
  CalRoundToScreenScale(0.5);
  v10 = v8 - v9;
  -[EKDayViewController _eventGestureSuperview](self, "_eventGestureSuperview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromView:", self->_currentDay, v6, v10);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)eventGestureController:(id)a3 pointAtDate:(double)a4 isAllDay:(BOOL)a5
{
  double v5;
  double v6;
  CGPoint result;

  -[EKDayViewController pointAtDate:isAllDay:](self, "pointAtDate:isAllDay:", a5, a4);
  result.y = v6;
  result.x = v5;
  return result;
}

- (double)eventGestureController:(id)a3 widthForOccurrenceViewOfDays:(unint64_t)a4
{
  double v5;
  double v6;
  double v7;

  -[EKDayView frame](self->_currentDay, "frame", a3, a4);
  v6 = v5;
  -[EKDayView leftContentInset](self->_currentDay, "leftContentInset");
  return v6 - v7;
}

- (double)eventGestureController:(id)a3 heightForOccurrenceViewOfDuration:(double)a4
{
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;

  v6 = -[EKDayViewController interfaceOrientation](self, "interfaceOrientation", a3);
  -[EKDayViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKDayTimeView hourHeightForSizeClass:orientation:](EKDayTimeView, "hourHeightForSizeClass:orientation:", EKUIWidthSizeClassForViewHierarchy(v7), v6);
  v9 = v8;
  -[EKDayView hourScale](self->_currentDay, "hourScale");
  v11 = v9 * v10 * a4 / 3600.0;
  +[EKDayOccurrenceView bottomShadowMargin](EKDayOccurrenceView, "bottomShadowMargin");
  v13 = v12 + v11;

  CalRoundToScreenScale(0.5);
  v15 = v13 + v14;
  -[EKDayViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKDayOccurrenceView minimumHeightForSizeClass:orientation:](EKDayOccurrenceView, "minimumHeightForSizeClass:orientation:", EKUIWidthSizeClassForViewHierarchy(v16), v6);
  v18 = v17;

  if (v15 >= v18)
    return v15;
  else
    return v18;
}

- (double)eventGestureController:(id)a3 heightForAllDayOccurrenceView:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;

  v5 = a4;
  v6 = -[EKDayViewController interfaceOrientation](self, "interfaceOrientation");
  -[EKDayViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKDayOccurrenceView minimumHeightForSizeClass:orientation:isAllDay:](EKDayOccurrenceView, "minimumHeightForSizeClass:orientation:isAllDay:", EKUIWidthSizeClassForViewHierarchy(v7), v6, 1);
  v9 = v8;

  objc_msgSend(v5, "currentImageState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v10, "requiresLanguageAwarePadding");

  if ((_DWORD)v6)
  {
    objc_msgSend(v5, "currentImageState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "totalLanguageAwareHeightPadding");
    v9 = v9 + v12;

  }
  return v9;
}

- (double)timedRegionOriginForEventGestureController:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  -[EKDayViewController touchTrackingViewForEventGestureController:](self, "touchTrackingViewForEventGestureController:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView timedRegionYOrigin](self->_currentDay, "timedRegionYOrigin");
  objc_msgSend(v4, "convertPoint:fromView:", self->_currentDay, 0.0, v5);
  v7 = v6;

  return v7;
}

- (void)eventGestureController:(id)a3 requestsPresentationOfViewController:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "dayViewController:requestsPresentationOfViewControllerForGestures:", self, v8);

  }
}

- (void)eventGestureController:(id)a3 requestsShowEvent:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "dayViewController:requestsShowEvent:showDetails:", self, v8, 1);

  }
}

- (BOOL)eventGestureControllerShouldAllowLongPress:(id)a3
{
  EKDayViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  char v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 0;
  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_msgSend(v7, "dayViewControllerShouldAllowLongPress:", self);

  return v8;
}

- (void)eventGestureController:(id)a3 didSetUpAtDate:(double)a4 isAllDay:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  NSDateComponents *v10;
  NSDateComponents *originalDisplayDate;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a5;
  v18 = a3;
  objc_msgSend(v18, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewController _highlightEvent:dayViewDate:isAllDay:](self, "_highlightEvent:dayViewDate:isAllDay:", v8, v5, a4);

  objc_msgSend(v18, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", v9);

  v10 = (NSDateComponents *)-[NSDateComponents copy](self->_displayDate, "copy");
  originalDisplayDate = self->_originalDisplayDate;
  self->_originalDisplayDate = v10;

  objc_msgSend(v18, "draggingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewController _eventGestureSuperview](self, "_eventGestureSuperview");
  v13 = objc_claimAutoreleasedReturnValue();
  CalSwitchViewToSuperview(v12, (void *)v13);

  -[EKDayViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[EKDayViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dayViewcontrollerDidBeginMovingEventWithGesture:", self);

  }
  objc_msgSend(MEMORY[0x1E0CAA068], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "event");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "prepareForEventUpdate:", v17);

}

- (void)eventGestureController:(id)a3 didMoveToDate:(double)a4 isAllDay:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  objc_msgSend(a3, "event");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[EKDayViewController _highlightEvent:dayViewDate:isAllDay:](self, "_highlightEvent:dayViewDate:isAllDay:", v8, v5, a4);

}

- (BOOL)eventGestureController:(id)a3 didCommitOccurrence:(id)a4 toDate:(double)a5 isAllDay:(BOOL)a6 span:(int64_t)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  id WeakRetained;
  NSObject *v32;
  id v33;
  void *v34;
  id v35;
  char v36;
  id v37;
  NSDateComponents *originalDisplayDate;
  uint8_t v40[16];

  v10 = a3;
  v11 = a4;
  -[EKDayView highlightHour:](self->_currentDay, "highlightHour:", -1.0);
  -[EKDayView setAllDayLabelHighlighted:](self->_currentDay, "setAllDayLabelHighlighted:", 0);
  if (!objc_msgSend(v11, "isNew"))
  {
    -[EKDayViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[EKDayViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "dayViewController:willDuplicateOccurrence:", self, v11);

      if ((v21 & 1) != 0)
        goto LABEL_32;
    }
    else
    {

    }
    -[EKDayViewController currentEditor](self, "currentEditor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[EKDayViewController currentEditor](self, "currentEditor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "refreshStartAndEndDates");
LABEL_13:

      goto LABEL_32;
    }
    -[EKDayViewController delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[EKDayViewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "delegateWantsToHandleDayViewController:gestureCommittingOccurrence:", self, v11) & 1) != 0)
      {
        -[EKDayViewController delegate](self, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_opt_respondsToSelector();

        if ((v26 & 1) != 0)
        {
          -[EKDayViewController delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dayViewController:handleGestureCommittingOccurrence:", self, v11);
          goto LABEL_13;
        }
LABEL_20:
        v27 = objc_msgSend(v11, "isNew");
        objc_msgSend(MEMORY[0x1E0CAA068], "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v27)
          objc_msgSend(v28, "handleEventCreation:", v11);
        else
          objc_msgSend(v28, "handleEventUpdate:", v11);

        -[UIResponder EKUI_editor](self, "EKUI_editor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v30, "saveEvent:span:error:", v11, a7, 0) & 1) != 0)
        {
          if ((-[NSDateComponents isEqual:](self->_originalDisplayDate, "isEqual:", self->_displayDate) & 1) == 0)
          {
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(WeakRetained, "dayViewController:didChangeDisplayDate:", self, self->_displayDate);

          }
        }
        else
        {
          v32 = kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v40 = 0;
            _os_log_impl(&dword_1AF84D000, v32, OS_LOG_TYPE_ERROR, "Error moving event", v40, 2u);
          }
        }
        objc_msgSend(v10, "event");
        v33 = (id)objc_claimAutoreleasedReturnValue();

        if (v33 == v11)
        {
          objc_msgSend(v10, "occurrenceDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:", v11, v34, 0, 0, 0);

          v35 = objc_loadWeakRetained((id *)&self->_delegate);
          v36 = objc_opt_respondsToSelector();

          if ((v36 & 1) != 0)
          {
            v37 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v37, "dayViewController:awaitsRefreshingOccurrence:", self, v11);

          }
        }

        goto LABEL_32;
      }

    }
    goto LABEL_20;
  }
  -[EKDayViewController currentEditor](self, "currentEditor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[EKEventEditor defaultTitleForCalendarItem](EKEventEditor, "defaultTitleForCalendarItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if (v15)
      objc_msgSend(v11, "setTitle:", &stru_1E601DFA8);
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v18, "dayViewController:beginEditingOccurrence:creationMethod:", self, v11, 1);

    }
    goto LABEL_13;
  }
LABEL_32:
  originalDisplayDate = self->_originalDisplayDate;
  self->_originalDisplayDate = 0;

  return 1;
}

- (void)eventGestureController:(id)a3 didCancelEditingOccurrence:(id)a4 fadedOut:(BOOL)a5
{
  id v8;
  void *v9;
  NSDateComponents *originalDisplayDate;
  id v11;

  v11 = a3;
  v8 = a4;
  -[EKDayView highlightHour:](self->_currentDay, "highlightHour:", -1.0);
  -[EKDayView setAllDayLabelHighlighted:](self->_currentDay, "setAllDayLabelHighlighted:", 0);
  if (a5)
  {
    if ((objc_msgSend(v8, "isNew") & 1) == 0)
    {
      -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", 0);
      -[EKDayView setDimmedOccurrence:](self->_previousDay, "setDimmedOccurrence:", 0);
      -[EKDayView setDimmedOccurrence:](self->_nextDay, "setDimmedOccurrence:", 0);
      objc_msgSend(v11, "endForcedStart");
    }
  }
  else
  {
    objc_msgSend(v11, "occurrenceDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:", v8, v9, 0, 1, 1);

    -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", v8);
  }
  originalDisplayDate = self->_originalDisplayDate;
  self->_originalDisplayDate = 0;

}

- (void)eventGestureControllerDidEndDragSession:(id)a3
{
  NSDateComponents *originalDisplayDate;

  -[EKDayView highlightHour:](self->_currentDay, "highlightHour:", a3, -1.0);
  -[EKDayView setAllDayLabelHighlighted:](self->_currentDay, "setAllDayLabelHighlighted:", 0);
  -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", 0);
  -[EKDayView setDimmedOccurrence:](self->_previousDay, "setDimmedOccurrence:", 0);
  -[EKDayView setDimmedOccurrence:](self->_nextDay, "setDimmedOccurrence:", 0);
  originalDisplayDate = self->_originalDisplayDate;
  self->_originalDisplayDate = 0;

}

- (void)eventGestureController:(id)a3 didSingleTapOccurrence:(id)a4 shouldExtendSelection:(BOOL)a5
{
  id v8;
  id WeakRetained;
  char v10;
  id v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  -[EKDayView highlightHour:](self->_currentDay, "highlightHour:", -1.0);
  -[EKDayView setAllDayLabelHighlighted:](self->_currentDay, "setAllDayLabelHighlighted:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (a5)
  {
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
      goto LABEL_7;
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "dayViewController:modifySelection:", self, v8);
  }
  else
  {
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0)
      goto LABEL_7;
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventGestureController event](self->_eventGestureController, "event");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dayViewController:didSelectEvent:animated:userInitiated:", self, v13, 1, 1);

  }
LABEL_7:
  -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", 0);
  -[EKDayView setDimmedOccurrence:](self->_previousDay, "setDimmedOccurrence:", 0);
  -[EKDayView setDimmedOccurrence:](self->_nextDay, "setDimmedOccurrence:", 0);
  if (-[EKDayViewController _shouldEndGestureEditingOnTap](self, "_shouldEndGestureEditingOnTap"))
    objc_msgSend(v14, "endForcedStart");

}

- (BOOL)didScrollWhenEventGestureController:(id)a3 scrollTimerFiredToMoveLeft:(BOOL)a4 right:(BOOL)a5 vertically:(BOOL)a6 towardPoint:(CGPoint)a7
{
  double y;
  double x;
  _BOOL4 v9;
  int v10;
  int v11;
  id v13;
  int IsLeftToRight;
  int v15;
  int v16;
  void *v17;
  BOOL v18;

  y = a7.y;
  x = a7.x;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v13 = a3;
  if (((v11 & 1) != 0 || v10) && !-[EKDayViewController disableGestureDayChange](self, "disableGestureDayChange"))
  {
    IsLeftToRight = CalTimeDirectionIsLeftToRight();
    if (IsLeftToRight)
      v15 = -v11;
    else
      v15 = v11;
    if (IsLeftToRight)
      v16 = v10;
    else
      v16 = -v10;
    -[NSDateComponents dateComponents:byAddingDays:calendar:](self->_displayDate, "dateComponents:byAddingDays:calendar:", 30, (v15 + v16), self->_calendar);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayViewController _setDisplayDate:forRepeat:](self, "_setDisplayDate:forRepeat:", v17, 0);
    objc_msgSend(v13, "didCrossDragBoundary:", 2);

  }
  v18 = v9 && -[EKDayView scrollTowardPoint:](self->_currentDay, "scrollTowardPoint:", x, y);

  return v18;
}

- (void)externallyEndedGestureDragging
{
  NSDateComponents *originalDisplayDate;

  -[EKDayView highlightHour:](self->_currentDay, "highlightHour:", -1.0);
  -[EKDayView setAllDayLabelHighlighted:](self->_currentDay, "setAllDayLabelHighlighted:", 0);
  -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", 0);
  -[EKDayView setDimmedOccurrence:](self->_previousDay, "setDimmedOccurrence:", 0);
  -[EKDayView setDimmedOccurrence:](self->_nextDay, "setDimmedOccurrence:", 0);
  originalDisplayDate = self->_originalDisplayDate;
  self->_originalDisplayDate = 0;

}

- (void)validateInterfaceOrientationWithFutureOrientation:(int64_t)a3
{
  unint64_t v5;
  uint64_t v6;

  if (-[EKDayViewController isViewLoaded](self, "isViewLoaded"))
  {
    v5 = a3 - 1;
    if (v5 < 2 != (unint64_t)(-[EKDayView orientation](self->_currentDay, "orientation") - 1) < 2)
    {
      if (v5 < 2)
        v6 = 1;
      else
        v6 = 4;
      -[EKDayView setOrientation:](self->_previousDay, "setOrientation:", v6);
      -[EKDayView setOrientation:](self->_currentDay, "setOrientation:", v6);
      -[EKDayView setOrientation:](self->_nextDay, "setOrientation:", v6);
    }
  }
}

- (BOOL)eventEditorPopoverActiveWhileDraggingForEventGestureController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[EKDayViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  -[EKDayViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "dayViewControllerShouldShowDetachDialogOnGestureDraggingEnd:", self);

  return v7 ^ 1;
}

- (BOOL)_shouldEndGestureEditingOnTap
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  if (-[EKEventGestureController dragGestureInProgress](self->_eventGestureController, "dragGestureInProgress"))
    return 0;
  -[EKDayViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 1;
  -[EKDayViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "dayViewControllerShouldEndGestureEditingOnTap:", self);

  return v7;
}

- (void)cleanUpAfterGestureFailureForEventGestureController:(id)a3
{
  -[EKDayView highlightHour:](self->_currentDay, "highlightHour:", a3, -1.0);
  -[EKDayView setAllDayLabelHighlighted:](self->_currentDay, "setAllDayLabelHighlighted:", 0);
}

- (void)_notifyDelegateOfSelectedDateChange
{
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;

  if (!-[EKDayViewController disableNotifyDateChangeDuringTracking](self, "disableNotifyDateChangeDuringTracking")
    || !self->_fingerDown)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v4 = WeakRetained;
      v5 = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        v7 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v7, "dayViewController:didChangeDisplayDate:", self, self->_displayDate);

      }
    }
  }
}

- (void)_relayoutDaysDuringScrolling
{
  -[EKDayViewController _relayoutDaysDuringScrollingAndPerformDayChanges:](self, "_relayoutDaysDuringScrollingAndPerformDayChanges:", 1);
}

- (void)_relayoutDaysDuringScrollingAndPerformDayChanges:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  _BOOL4 v12;
  BOOL v13;
  int IsLeftToRight;
  _BOOL4 v15;
  _BOOL4 v16;
  int v17;
  int v18;
  void *v19;
  uint64_t v20;
  EKDayView **p_previousDay;
  EKDayView *previousDay;
  EKDayView **p_currentDay;
  EKDayView *v24;
  void *v25;
  id *p_nextDay;
  EKDayView *nextDay;
  EKDayView *v28;
  void *v29;
  EKDayViewWithGutters *nextDayWithGutter;
  id v31;
  EKDayView *v32;
  void *v33;
  NSObject *protectionQueue;
  uint64_t v35;
  void *v36;
  int v37;
  EKDayViewWithGutters *previousDayWithGutter;
  EKDayView *v39;
  void *v40;
  NSObject *v41;
  char v42;
  _BOOL4 v43;
  id v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  int v55;
  int v56;
  void *v57;
  EKDayViewWithGutters *v58;
  int v59;
  _BOOL4 v60;
  id v61;
  _QWORD v62[5];
  _QWORD block[6];

  v3 = a3;
  -[UIScrollView bounds](self->_horizontalScrollingView, "bounds");
  v6 = v5;
  v8 = v7;
  -[UIScrollView contentOffset](self->_horizontalScrollingView, "contentOffset");
  v10 = v9;
  v11 = v9 < v6 * 0.5;
  v12 = v9 > v6 * 1.5;
  v13 = -[EKDayViewController _isResizing](self, "_isResizing");
  IsLeftToRight = CalTimeDirectionIsLeftToRight();
  v59 = IsLeftToRight;
  if (IsLeftToRight)
    v15 = v12;
  else
    v15 = v11;
  if (!IsLeftToRight)
    v11 = v12;
  v16 = -[EKDayViewController allowsDaySwitching](self, "allowsDaySwitching");
  v17 = v16 && v11;
  v18 = v16 && v15;
  v60 = v3;
  if (v3 && !v13)
  {
    if (v18)
    {
      -[EKDayView displayDate](self->_nextDay, "displayDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
LABEL_13:
        if (v19 && (-[NSDateComponents isEqual:](self->_displayDate, "isEqual:", v19) & 1) == 0)
        {
          *((_BYTE *)self + 1064) |= 2u;
          -[EKDayViewController setDisplayDate:](self, "setDisplayDate:", v19);
          -[EKDayViewController _notifyDelegateOfSelectedDateChange](self, "_notifyDelegateOfSelectedDateChange");
          *((_BYTE *)self + 1064) &= ~2u;
        }

        goto LABEL_17;
      }
    }
    else
    {
      v19 = 0;
      if (!v17)
        goto LABEL_13;
    }
    -[EKDayView displayDate](self->_previousDay, "displayDate");
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
    goto LABEL_13;
  }
LABEL_17:
  p_previousDay = &self->_previousDay;
  previousDay = self->_previousDay;
  p_currentDay = &self->_currentDay;
  -[EKDayView highlightedHour](self->_currentDay, "highlightedHour");
  -[EKDayView highlightHour:](previousDay, "highlightHour:");
  -[EKDayView setAllDayLabelHighlighted:](self->_previousDay, "setAllDayLabelHighlighted:", -[EKDayView isAllDayLabelHighlighted](self->_currentDay, "isAllDayLabelHighlighted"));
  v24 = self->_previousDay;
  -[EKEventGestureController event](self->_eventGestureController, "event");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView setDimmedOccurrence:](v24, "setDimmedOccurrence:", v25);

  p_nextDay = (id *)&self->_nextDay;
  nextDay = self->_nextDay;
  -[EKDayView highlightedHour](self->_currentDay, "highlightedHour");
  -[EKDayView highlightHour:](nextDay, "highlightHour:");
  -[EKDayView setAllDayLabelHighlighted:](self->_nextDay, "setAllDayLabelHighlighted:", -[EKDayView isAllDayLabelHighlighted](self->_currentDay, "isAllDayLabelHighlighted"));
  v28 = self->_nextDay;
  -[EKEventGestureController event](self->_eventGestureController, "event");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView setDimmedOccurrence:](v28, "setDimmedOccurrence:", v29);

  if (-[UIScrollView isTracking](self->_horizontalScrollingView, "isTracking"))
  {
    if ((v18 | v17) != 1)
      goto LABEL_55;
  }
  else if (-[UIScrollView isDecelerating](self->_horizontalScrollingView, "isDecelerating") || ((v18 | v17) & 1) == 0)
  {
    goto LABEL_55;
  }
  if (v17)
  {
    nextDayWithGutter = self->_nextDayWithGutter;
    v58 = nextDayWithGutter;
    objc_storeStrong((id *)&self->_nextDayWithGutter, self->_currentDayWithGutter);
    objc_storeStrong((id *)&self->_currentDayWithGutter, self->_previousDayWithGutter);
    objc_storeStrong((id *)&self->_previousDayWithGutter, nextDayWithGutter);
    v31 = *p_nextDay;
    v32 = (EKDayView *)*p_nextDay;
    objc_storeStrong(p_nextDay, *p_currentDay);
    objc_storeStrong((id *)&self->_currentDay, *p_previousDay);
    objc_storeStrong((id *)p_previousDay, v31);
    -[EKDayView dayContent](*p_previousDay, "dayContent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "prepareForReuseIsReload:", 0);

    protectionQueue = self->_protectionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__EKDayViewController__relayoutDaysDuringScrollingAndPerformDayChanges___block_invoke;
    block[3] = &unk_1E6018688;
    block[4] = self;
    dispatch_sync(protectionQueue, block);
    v35 = 1032;
    if ((*((_BYTE *)self + 1032) & 2) == 0)
    {
      -[NSDateComponents dateComponents:byAddingDays:calendar:](self->_displayDate, "dateComponents:byAddingDays:calendar:", 30, 0xFFFFFFFFLL, self->_calendar, v58);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v59;
      if (-[UIScrollView isTracking](self->_horizontalScrollingView, "isTracking"))
      {
        *((_BYTE *)self + 1048) |= 1u;
        -[EKDayViewController setPendingPreviousDate:](self, "setPendingPreviousDate:", v36);
LABEL_35:

        v43 = v60;
        goto LABEL_36;
      }
      v44 = *p_previousDay;
      goto LABEL_34;
    }
    v42 = *((_BYTE *)self + 1032) & 0xFD;
  }
  else
  {
    previousDayWithGutter = self->_previousDayWithGutter;
    v58 = previousDayWithGutter;
    objc_storeStrong((id *)&self->_previousDayWithGutter, self->_currentDayWithGutter);
    objc_storeStrong((id *)&self->_currentDayWithGutter, self->_nextDayWithGutter);
    objc_storeStrong((id *)&self->_nextDayWithGutter, previousDayWithGutter);
    v39 = *p_previousDay;
    v32 = *p_previousDay;
    objc_storeStrong((id *)p_previousDay, *p_currentDay);
    objc_storeStrong((id *)&self->_currentDay, *p_nextDay);
    objc_storeStrong(p_nextDay, v39);
    objc_msgSend(*p_nextDay, "dayContent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "prepareForReuseIsReload:", 0);

    v41 = self->_protectionQueue;
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __72__EKDayViewController__relayoutDaysDuringScrollingAndPerformDayChanges___block_invoke_2;
    v62[3] = &unk_1E6018688;
    v62[4] = self;
    dispatch_sync(v41, v62);
    v35 = 1048;
    if ((*((_BYTE *)self + 1048) & 1) == 0)
    {
      -[NSDateComponents dateComponents:byAddingDays:calendar:](self->_displayDate, "dateComponents:byAddingDays:calendar:", 30, 1, self->_calendar, v58);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v59;
      if (-[UIScrollView isTracking](self->_horizontalScrollingView, "isTracking"))
      {
        *((_BYTE *)self + 1032) |= 2u;
        -[EKDayViewController setPendingNextDate:](self, "setPendingNextDate:", v36);
        goto LABEL_35;
      }
      v44 = *p_nextDay;
LABEL_34:
      -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", v44, v36);
      goto LABEL_35;
    }
    v42 = *((_BYTE *)self + 1048) & 0xFE;
  }
  *((_BYTE *)&self->super.super.super.isa + v35) = v42;
  v37 = v59;
  v43 = v60;
LABEL_36:

  -[EKDayViewWithGutters superview](self->_currentDayWithGutter, "superview");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
    -[UIScrollView addSubview:](self->_horizontalScrollingView, "addSubview:", self->_currentDayWithGutter);
  v46 = -v6;
  if (v10 < v6 * 0.5)
    v46 = v6;
  -[UIScrollView setContentOffset:](self->_horizontalScrollingView, "setContentOffset:", v10 + v46, 0.0, v58);
  if ((*((_BYTE *)self + 1032) & 2) != 0
    && -[EKDayViewController _isViewInVisibleRect:](self, "_isViewInVisibleRect:", *p_nextDay))
  {
    -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", *p_nextDay, self->_pendingNextDate);
    *((_BYTE *)self + 1032) &= ~2u;
  }
  if ((*((_BYTE *)self + 1048) & 1) != 0
    && -[EKDayViewController _isViewInVisibleRect:](self, "_isViewInVisibleRect:", *p_previousDay))
  {
    -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", *p_previousDay, self->_pendingPreviousDate);
    *((_BYTE *)self + 1048) &= ~1u;
  }
  if (v43)
  {
    -[EKDayView displayDate](*p_currentDay, "displayDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayViewController setDisplayDate:](self, "setDisplayDate:", v47);

  }
  v48 = CalRoundRectToScreenScale(0.0, 0.0, v6, v8);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  if (v37)
    v55 = 1008;
  else
    v55 = 1024;
  if (v37)
    v56 = 1024;
  else
    v56 = 1008;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v55), "setFrame:", v48);
  -[EKDayViewWithGutters setFrame:](self->_currentDayWithGutter, "setFrame:", v6, v50, v52, v54);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v56), "setFrame:", v6 + v6, v50, v52, v54);
  -[EKDayViewController _updateAllDayAreaHeight](self, "_updateAllDayAreaHeight");
  -[EKDayView shouldAnnotateAppEntitiesChanged](*p_previousDay, "shouldAnnotateAppEntitiesChanged");
  -[EKDayView shouldAnnotateAppEntitiesChanged](*p_currentDay, "shouldAnnotateAppEntitiesChanged");
  objc_msgSend(*p_nextDay, "shouldAnnotateAppEntitiesChanged");
LABEL_55:
  -[EKDayViewController view](self, "view");
  v61 = (id)objc_claimAutoreleasedReturnValue();
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v61))
  {
    -[EKEventGestureController draggingView](self->_eventGestureController, "draggingView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v57)
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__scrollDayViewAfterRelayoutDays, 0);
      -[EKDayViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__scrollDayViewAfterRelayoutDays, 0, 0.0);
    }
  }
  else
  {

  }
}

void __72__EKDayViewController__relayoutDaysDuringScrollingAndPerformDayChanges___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1088);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1088), *(id *)(*(_QWORD *)(a1 + 32) + 1072));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1072), *(id *)(*(_QWORD *)(a1 + 32) + 1080));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1080);
  *(_QWORD *)(v3 + 1080) = v2;

}

void __72__EKDayViewController__relayoutDaysDuringScrollingAndPerformDayChanges___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1080);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1080), *(id *)(*(_QWORD *)(a1 + 32) + 1072));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1072), *(id *)(*(_QWORD *)(a1 + 32) + 1088));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1088);
  *(_QWORD *)(v3 + 1088) = v2;

}

- (void)_setDayView:(id)a3 toDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *reloadQueue;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "displayDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v6, "setDisplayDate:", v7);
    reloadQueue = self->_reloadQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__EKDayViewController__setDayView_toDate___block_invoke;
    v11[3] = &unk_1E6018EC0;
    v11[4] = self;
    v12 = v6;
    dispatch_async(reloadQueue, v11);

  }
}

void __42__EKDayViewController__setDayView_toDate___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  uint64_t v11;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1184);
  v6 = MEMORY[0x1E0C809B0];
  v8 = __42__EKDayViewController__setDayView_toDate___block_invoke_2;
  v9 = &unk_1E6018EC0;
  v7 = 3221225472;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v11 = v5;
  dispatch_sync(v3, &v6);
  objc_msgSend(*(id *)(a1 + 40), "loadData:withCompletion:", 0, 0, v6, v7, v8, v9);

}

void __42__EKDayViewController__setDayView_toDate___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD block[5];

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 == v2[124])
  {
    objc_msgSend(v2, "_eventsForDay:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 1072);
    *(_QWORD *)(v9 + 1072) = v8;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__EKDayViewController__setDayView_toDate___block_invoke_3;
    block[3] = &unk_1E6018688;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    if (v3 == v2[123])
    {
      objc_msgSend(v2, "_eventsForDay:");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v12, "copy");
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 1080;
      goto LABEL_8;
    }
    if (v3 == v2[125])
    {
      objc_msgSend(v2, "_eventsForDay:");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v12, "copy");
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 1088;
LABEL_8:
      v11 = *(void **)(v5 + v6);
      *(_QWORD *)(v5 + v6) = v4;

    }
  }
}

uint64_t __42__EKDayViewController__setDayView_toDate___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfSelectedDateChange");
}

- (id)horizontalScrollView
{
  return self->_horizontalScrollingView;
}

- (id)verticalScrollView
{
  return -[EKDayView verticalScrollView](self->_currentDay, "verticalScrollView");
}

- (BOOL)_isViewInVisibleRect:(id)a3
{
  id v4;
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
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGRect v28;
  CGRect v29;

  v4 = a3;
  -[EKDayViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "convertRect:fromView:", v14, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[UIScrollView frame](self->_horizontalScrollingView, "frame");
  v29.origin.x = v23;
  v29.origin.y = v24;
  v29.size.width = v25;
  v29.size.height = v26;
  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v20;
  v28.size.height = v22;
  return CGRectIntersectsRect(v28, v29);
}

- (double)_weightedAllDayHeightForView:(id)a3 visibleRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend(v8, "frame");
  v28.origin.x = v9;
  v28.origin.y = v10;
  v28.size.width = v11;
  v28.size.height = v12;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v13 = 0.0;
  if (CGRectIntersectsRect(v25, v28))
  {
    objc_msgSend(v8, "frame");
    v29.origin.x = v14;
    v29.origin.y = v15;
    v29.size.width = v16;
    v29.size.height = v17;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v27 = CGRectIntersection(v26, v29);
    v18 = v27.size.width;
    objc_msgSend(v8, "frame", v27.origin.x, v27.origin.y);
    v20 = v18 / v19;
    objc_msgSend(v8, "dayView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allDayView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "naturalHeight");
    v13 = v20 * v23 + 0.0;

  }
  return v13;
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  double MinX;
  double MaxX;
  int IsLeftToRight;
  char v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  char v32;
  char v33;
  double v34;
  void *v35;
  double v36;
  ScrollSpringFactory *decelerationSpringFactory;
  uint64_t v38;
  id v39;
  void *v40;
  _QWORD v41[5];
  _QWORD v42[5];
  id v43;
  double v44;
  uint64_t v45;
  char v46;
  CGRect v47;
  CGRect v48;

  v4 = a3;
  *((_BYTE *)self + 1064) |= 1u;
  self->_fingerDown = 0;
  -[EKDayViewController setTransitionedToSameDay:](self, "setTransitionedToSameDay:", 0);
  -[EKDayViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    goto LABEL_29;
  -[UIScrollView _pageDecelerationTarget](self->_horizontalScrollingView, "_pageDecelerationTarget");
  v8 = v7;
  -[EKDayViewWithGutters frame](self->_currentDayWithGutter, "frame");
  MinX = CGRectGetMinX(v47);
  -[EKDayViewWithGutters frame](self->_currentDayWithGutter, "frame");
  MaxX = CGRectGetMaxX(v48);
  IsLeftToRight = CalTimeDirectionIsLeftToRight();
  if (IsLeftToRight && v8 >= MaxX)
    goto LABEL_19;
  if (v8 >= MinX)
    v12 = 1;
  else
    v12 = IsLeftToRight;
  if (v8 < MinX)
    v13 = IsLeftToRight;
  else
    v13 = 0;
  if ((v13 & 1) != 0)
  {
    if ((v12 & 1) == 0)
      goto LABEL_19;
    goto LABEL_22;
  }
  if ((v12 & 1) == 0)
  {
LABEL_19:
    if ((*((_BYTE *)self + 1032) & 2) == 0)
    {
      v16 = 1000;
LABEL_24:
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v16), "displayDate");
      v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
      v15 = v18;
      goto LABEL_28;
    }
    v17 = 1040;
    goto LABEL_26;
  }
  if (v8 < MaxX)
    v14 = 1;
  else
    v14 = IsLeftToRight;
  if ((v14 & 1) == 0)
  {
LABEL_22:
    if ((*((_BYTE *)self + 1048) & 1) == 0)
    {
      v16 = 984;
      goto LABEL_24;
    }
    v17 = 1056;
LABEL_26:
    v18 = *(id *)((char *)&self->super.super.super.isa + v17);
    goto LABEL_27;
  }
  -[EKDayView displayDate](self->_currentDay, "displayDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewController setTransitionedToSameDay:](self, "setTransitionedToSameDay:", 1);
LABEL_28:
  CalAnalyticsSendEventLazy();
  -[EKDayViewController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dayViewController:didStartDeceleratingTargettingDate:", self, v15);

LABEL_29:
  self->_adjustingForDeceleration = 1;
  objc_msgSend(v4, "_pageDecelerationTarget");
  v22 = CalRoundPointToScreenScale(v20, v21);
  v24 = v23;
  objc_msgSend(v4, "contentOffset");
  v27 = CalRoundPointToScreenScale(v25, v26);
  v29 = v28;
  objc_msgSend(v4, "_horizontalVelocity");
  if (v30 >= 0.0)
    v31 = v30;
  else
    v31 = -v30;
  objc_msgSend(v4, "stopScrollingAndZooming");
  objc_msgSend(v4, "setContentOffset:animated:", 0, v27, v29);
  self->_adjustingForDeceleration = 0;
  v32 = *((_BYTE *)self + 1032);
  *((_BYTE *)self + 1032) = v32 | 1;
  v33 = v32 & 1;
  v34 = v27 - v22;
  if (v27 - v22 < 0.0)
    v34 = -(v27 - v22);
  -[ScrollSpringFactory setInitialVelocity:](self->_decelerationSpringFactory, "setInitialVelocity:", v31 / v34 * EKUIScaleFactor() * 1000.0);
  self->_needToCompleteDeceleration = 0;
  v35 = (void *)MEMORY[0x1E0DC3F10];
  v36 = springAnimationDuration();
  decelerationSpringFactory = self->_decelerationSpringFactory;
  v38 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke_2;
  v42[3] = &unk_1E601B040;
  v42[4] = self;
  v43 = v4;
  v44 = v22;
  v45 = v24;
  v46 = v33;
  v39 = v4;
  dayViewScrollAnimationsPreferringFRR(v42);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v38;
  v41[1] = 3221225472;
  v41[2] = __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke_4;
  v41[3] = &unk_1E6018638;
  v41[4] = self;
  objc_msgSend(v35, "_animateWithDuration:delay:options:factory:animations:completion:", 393222, decelerationSpringFactory, v40, v41, v36, 0.0);

  -[EKDayViewController _cutAnimationTailAfterDelayForDecelerationFromUserInput](self, "_cutAnimationTailAfterDelayForDecelerationFromUserInput");
}

uint64_t __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", CFSTR("SwipedOnDayViewCanvas"), CFSTR("method"));
}

void __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];
  char v3;

  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1144);
  objc_msgSend(*(id *)(a1 + 40), "setContentOffset:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1169) = 1;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke_3;
  v2[3] = &unk_1E6019F18;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1032) = *(_BYTE *)(*(_QWORD *)(result + 32) + 1032) & 0xFE | *(_BYTE *)(result + 40);
  return result;
}

uint64_t __55__EKDayViewController_scrollViewWillBeginDecelerating___block_invoke_4(uint64_t result)
{
  --*(_DWORD *)(*(_QWORD *)(result + 32) + 1144);
  return result;
}

- (void)_scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v4 = a3;
  if (!self->_adjustingForDeceleration)
  {
    v8 = v4;
    *((_BYTE *)self + 1064) &= ~1u;
    if ((*((_BYTE *)self + 1032) & 1) == 0)
      -[EKDayViewController _relayoutDaysDuringScrolling](self, "_relayoutDaysDuringScrolling");
    if ((*((_BYTE *)self + 1032) & 2) != 0)
    {
      -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", self->_nextDay, self->_pendingNextDate);
      *((_BYTE *)self + 1032) &= ~2u;
    }
    if ((*((_BYTE *)self + 1048) & 1) != 0)
    {
      -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", self->_previousDay, self->_pendingPreviousDate);
      *((_BYTE *)self + 1048) &= ~1u;
    }
    -[EKDayViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[EKDayViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dayViewControllerDidEndDecelerating:", self);

    }
    -[EKDayViewController _showNowAfterScrollViewDidEndDecelerating:](self, "_showNowAfterScrollViewDidEndDecelerating:", v8);
    v4 = v8;
  }

}

- (void)_showNowAfterScrollViewDidEndDecelerating:(id)a3
{
  NSTimer *v4;
  NSTimer *showNowTimer;

  if (-[EKDayViewController _canShowNowAfterScrollViewDidEndDecelerating:](self, "_canShowNowAfterScrollViewDidEndDecelerating:", a3))
  {
    -[EKDayViewController _showNowDelay](self, "_showNowDelay");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__showNowTimerFired_, 0, 0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    showNowTimer = self->_showNowTimer;
    self->_showNowTimer = v4;

  }
  else
  {
    -[EKDayViewController _stopShowNowTimer](self, "_stopShowNowTimer");
  }
}

- (double)_showNowDelay
{
  return 0.4;
}

- (BOOL)_canShowNowAfterScrollViewDidEndDecelerating:(id)a3
{
  BOOL v4;

  v4 = -[EKDayViewController _isCurrentDayToday](self, "_isCurrentDayToday", a3);
  return v4 & !-[EKDayViewController transitionedToSameDay](self, "transitionedToSameDay");
}

- (void)_showNowTimerFired:(id)a3
{
  if (-[EKDayViewController _isCurrentDayToday](self, "_isCurrentDayToday", a3))
    -[EKDayViewController scrollToNow:](self, "scrollToNow:", 1);
  -[EKDayViewController setShowNowTimer:](self, "setShowNowTimer:", 0);
}

- (void)_cleanUpTargetDateComponents
{
  NSDateComponents *targetDateComponents;
  NSCalendar *calendar;
  NSDateComponents *v5;
  void *v6;
  NSDateComponents *v7;
  id v8;

  if (self->_correctAfterScroll)
  {
    targetDateComponents = self->_targetDateComponents;
    if (targetDateComponents)
    {
      calendar = self->_calendar;
      v5 = targetDateComponents;
      -[NSDateComponents dateComponents:byAddingDays:calendar:](v5, "dateComponents:byAddingDays:calendar:", 30, 0xFFFFFFFFLL, calendar);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[NSDateComponents dateComponents:byAddingDays:calendar:](v5, "dateComponents:byAddingDays:calendar:", 30, 1, self->_calendar);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", self->_previousDay, v8);
      -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", self->_currentDay, v5);
      -[EKDayViewController _setDayView:toDate:](self, "_setDayView:toDate:", self->_nextDay, v6);
      self->_correctAfterScroll = 0;
      v7 = self->_targetDateComponents;
      self->_targetDateComponents = 0;

    }
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[EKDayViewController _relayoutDaysDuringScrolling](self, "_relayoutDaysDuringScrolling");
  -[EKDayViewController _cleanUpTargetDateComponents](self, "_cleanUpTargetDateComponents");
  -[EKDayViewController _setNextAndPreviousFirstVisibleSecondToCurrent](self, "_setNextAndPreviousFirstVisibleSecondToCurrent");
  *((_BYTE *)self + 1032) &= ~1u;
  -[EKDayViewController reloadData](self, "reloadData");
  -[EKEventGestureController updateDraggingOccurrence](self->_eventGestureController, "updateDraggingOccurrence");
  -[EKEventGestureController setCommitBlocked:](self->_eventGestureController, "setCommitBlocked:", 0);
  -[EKDayViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[EKDayViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dayViewControllerDidEndScrolling:", self);

  }
  -[EKDayViewController _scrollToNowOnScrollViewDidEndScrollingAnimation:](self, "_scrollToNowOnScrollViewDidEndScrollingAnimation:", v8);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("EKDayViewController_ScrollDidEndAnimationNotification"), 0);

}

- (void)_scrollToNowOnScrollViewDidEndScrollingAnimation:(id)a3
{
  -[EKDayViewController scrollToNow:](self, "scrollToNow:", -[EKDayViewController _shouldRespondToApplicationDidBecomeActiveStateChange](self, "_shouldRespondToApplicationDidBecomeActiveStateChange", a3) ^ 1);
  if (-[EKDayViewController _shouldRespondToApplicationDidBecomeActiveStateChange](self, "_shouldRespondToApplicationDidBecomeActiveStateChange"))
  {
    -[EKDayViewController _didRespondToApplicationDidBecomeActiveStateChange](self, "_didRespondToApplicationDidBecomeActiveStateChange");
  }
}

- (BOOL)_shouldRespondToApplicationDidBecomeActiveStateChange
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[EKDayViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[EKDayViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dayViewControllerShouldRespondToApplicationDidBecomeActiveStateChange:", self);

  return v6;
}

- (void)_didRespondToApplicationDidBecomeActiveStateChange
{
  void *v3;
  char v4;
  id v5;

  -[EKDayViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[EKDayViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dayViewControllerDidRespondToApplicationDidBecomeActiveStateChange:", self);

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  uint64_t v4;
  void *v5;
  BOOL v6;

  -[EKDayViewController _completeScrollingAnimationIfNeeded](self, "_completeScrollingAnimationIfNeeded", a3);
  *((_BYTE *)self + 1032) &= ~1u;
  -[EKDayViewController _completeDecelerationIfNeeded](self, "_completeDecelerationIfNeeded");
  -[EKEventGestureController event](self->_eventGestureController, "event");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[EKEventGestureController dragGestureInProgress](self->_eventGestureController, "dragGestureInProgress");

    if (!v6)
    {
      -[EKEventGestureController endForcedStart](self->_eventGestureController, "endForcedStart");
      -[EKDayView setDimmedOccurrence:](self->_currentDay, "setDimmedOccurrence:", 0);
    }
  }
  self->_fingerDown = 1;
  -[EKDayViewController _setNextAndPreviousFirstVisibleSecondToCurrent](self, "_setNextAndPreviousFirstVisibleSecondToCurrent");
  if (-[EKDayViewController _isCurrentDayToday](self, "_isCurrentDayToday"))
  {
    -[EKDayViewController _stopShowNowTimer](self, "_stopShowNowTimer");
    -[EKDayView stopScrolling](self->_currentDay, "stopScrolling");
  }
}

- (void)_stopShowNowTimer
{
  void *v3;

  -[EKDayViewController showNowTimer](self, "showNowTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[EKDayViewController setShowNowTimer:](self, "setShowNowTimer:", 0);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    self->_fingerDown = 0;
    -[EKDayViewController _notifyDelegateOfSelectedDateChange](self, "_notifyDelegateOfSelectedDateChange", a3);
  }
}

- (BOOL)blockableScrollViewShouldAllowScrolling
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[EKDayViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[EKDayViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dayviewControllerShouldAllowSwipeToChangeDays:", self);

  return v6;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  EKDayViewController *v16;
  BOOL v17;
  objc_super v18;

  height = a3.height;
  width = a3.width;
  ++self->_sizeTransitionsInProgress;
  v18.receiver = self;
  v18.super_class = (Class)EKDayViewController;
  v7 = a4;
  -[EKDayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (-[EKDayViewController isViewLoaded](self, "isViewLoaded"))
  {
    v8 = -[EKDayViewController _effectiveInterfaceOrientationForSize:](self, "_effectiveInterfaceOrientationForSize:", width, height);
    -[EKDayView setOrientation:](self->_previousDay, "setOrientation:", v8);
    -[EKDayView setOrientation:](self->_currentDay, "setOrientation:", v8);
    -[EKDayView setOrientation:](self->_nextDay, "setOrientation:", v8);
  }
  if (-[EKDayViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[EKDayViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    v11 = 0;
  }
  -[EKDayViewController gestureController](self, "gestureController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__EKDayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v14[3] = &unk_1E601B068;
  v17 = v11;
  v15 = v12;
  v16 = self;
  v13 = v12;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v14);

}

uint64_t __74__EKDayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 48))
  {
    objc_msgSend(*(id *)(result + 32), "updateDraggingOccurrenceFrameFromSource");
    result = objc_msgSend(*(id *)(v1 + 32), "updateDraggingOccurrenceOrigin");
  }
  --*(_DWORD *)(*(_QWORD *)(v1 + 40) + 1148);
  return result;
}

- (void)applicationDidBecomeActive
{
  -[EKDayViewController scrollDayViewAppropriatelyWithAnimation:](self, "scrollDayViewAppropriatelyWithAnimation:", 1);
}

- (void)_setHorizontalContentOffsetUsingSpringAnimation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  _QWORD v10[7];

  y = a3.y;
  x = a3.x;
  if (!-[EKDayViewController _isResizing](self, "_isResizing"))
  {
    self->_needToCompleteScrollingAnimation = 0;
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v7 = springAnimationDuration();
    +[SpringFactory sharedFactory](SpringFactory, "sharedFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__EKDayViewController__setHorizontalContentOffsetUsingSpringAnimation___block_invoke;
    v10[3] = &unk_1E601AA30;
    v10[4] = self;
    *(CGFloat *)&v10[5] = x;
    *(CGFloat *)&v10[6] = y;
    dayViewScrollAnimationsPreferringFRR(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_animateWithDuration:delay:options:factory:animations:completion:", 393222, v8, v9, 0, v7, 0.0);

    -[EKDayViewController _cutAnimationTailAfterDelayForScrollAnimationFromExternalSource](self, "_cutAnimationTailAfterDelayForScrollAnimationFromExternalSource");
  }
}

uint64_t __71__EKDayViewController__setHorizontalContentOffsetUsingSpringAnimation___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1032) |= 1u;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setContentOffset:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1168) = 1;
  return result;
}

- (void)_cutAnimationTailAfterDelayForDecelerationFromUserInput
{
  -[EKDayViewController _cancelAllLongTailCuttingCallbacks](self, "_cancelAllLongTailCuttingCallbacks");
  -[EKDayViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel___cutLongCallbackTailForDecelerationFromUserInput, 0, springAnimationDuration() * 0.5);
}

- (void)_cutAnimationTailAfterDelayForScrollAnimationFromExternalSource
{
  -[EKDayViewController _cancelAllLongTailCuttingCallbacks](self, "_cancelAllLongTailCuttingCallbacks");
  -[EKDayViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel___cutLongTailCallbackForScrollAnimationFromExternalSource, 0, springAnimationDuration() * 0.5);
}

- (void)_cancelAllLongTailCuttingCallbacks
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___cutLongCallbackTailForDecelerationFromUserInput, 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___cutLongTailCallbackForScrollAnimationFromExternalSource, 0);
}

- (void)__cutLongTailCallbackForScrollAnimationFromExternalSource
{
  self->_needToCompleteScrollingAnimation = 0;
  -[EKDayViewController scrollViewDidEndScrollingAnimation:](self, "scrollViewDidEndScrollingAnimation:", self->_horizontalScrollingView);
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[EKDayViewController currentPresentationController](self, "currentPresentationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentFromSource:", v6);

}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "dayViewController:beginEditingOccurrence:creationMethod:", self, v8, 3);

  }
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4 && !a5)
    -[EKDayViewController attemptDisplayReviewPrompt](self, "attemptDisplayReviewPrompt", a3);
}

- (void)_logUserStateDiagnostics:(id)a3
{
  NSObject *protectionQueue;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  id v39;
  id obj;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD block[6];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  _QWORD v65[10];
  _QWORD v66[10];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__12;
  v59 = __Block_byref_object_dispose__12;
  v60 = 0;
  protectionQueue = self->_protectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__EKDayViewController__logUserStateDiagnostics___block_invoke;
  block[3] = &unk_1E601B090;
  block[4] = self;
  block[5] = &v55;
  dispatch_sync(protectionQueue, block);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)v56[5];
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
  if (v4)
  {
    v43 = *(_QWORD *)v51;
    do
    {
      v5 = 0;
      v44 = v4;
      do
      {
        if (*(_QWORD *)v51 != v43)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v5);
        objc_msgSend(v6, "UUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7 == 0;

        if (!v8)
        {
          v65[0] = CFSTR("startDate");
          objc_msgSend(v6, "startDate");
          v9 = objc_claimAutoreleasedReturnValue();
          v49 = (void *)v9;
          v10 = &stru_1E601DFA8;
          if (v9)
            v10 = (const __CFString *)v9;
          v66[0] = v10;
          v65[1] = CFSTR("duration");
          v11 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v6, "duration");
          objc_msgSend(v11, "numberWithDouble:");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v66[1] = v48;
          v65[2] = CFSTR("allDay");
          v12 = objc_msgSend(v6, "isAllDay");
          v13 = CFSTR("NO");
          if (v12)
            v13 = CFSTR("YES");
          v66[2] = v13;
          v65[3] = CFSTR("UUID");
          objc_msgSend(v6, "UUID");
          v14 = objc_claimAutoreleasedReturnValue();
          v47 = (void *)v14;
          v15 = &stru_1E601DFA8;
          if (v14)
            v15 = (const __CFString *)v14;
          v66[3] = v15;
          v65[4] = CFSTR("uniqueID");
          objc_msgSend(v6, "uniqueID");
          v16 = objc_claimAutoreleasedReturnValue();
          v46 = (void *)v16;
          v17 = &stru_1E601DFA8;
          if (v16)
            v17 = (const __CFString *)v16;
          v66[4] = v17;
          v65[5] = CFSTR("externalURL");
          objc_msgSend(v6, "externalURL");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          v20 = &stru_1E601DFA8;
          if (v18)
            v20 = (const __CFString *)v18;
          v66[5] = v20;
          v65[6] = CFSTR("alarms");
          objc_msgSend(v6, "alarms");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          v23 = &stru_1E601DFA8;
          if (v21)
            v23 = (const __CFString *)v21;
          v66[6] = v23;
          v65[7] = CFSTR("hasLocation");
          objc_msgSend(v6, "location");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = CFSTR("NO");
          if (v24)
            v25 = CFSTR("YES");
          v66[7] = v25;
          v65[8] = CFSTR("calendarIdentifier");
          objc_msgSend(v6, "calendar");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "calendarIdentifier");
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v27;
          v29 = &stru_1E601DFA8;
          if (v27)
            v29 = (const __CFString *)v27;
          v66[8] = v29;
          v65[9] = CFSTR("sourceIdentifier");
          objc_msgSend(v6, "calendar");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "source");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "sourceIdentifier");
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          v34 = &stru_1E601DFA8;
          if (v32)
            v34 = (const __CFString *)v32;
          v66[9] = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 10);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "UUID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v45, v35);

        }
        ++v5;
      }
      while (v44 != v5);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
    }
    while (v4);
  }

  v36 = (id)kEKUILogHandle;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v62 = v38;
    v63 = 2114;
    v64 = v42;
    _os_log_impl(&dword_1AF84D000, v36, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ Visible Events when viewDidAppear. %{public}@", buf, 0x16u);

  }
  _Block_object_dispose(&v55, 8);

}

void __48__EKDayViewController__logUserStateDiagnostics___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "occurrences");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)_dateModeForAllDay:(BOOL)a3
{
  return !a3;
}

- (BOOL)interaction:(id)a3 shouldShowMenuAtPoint:(CGPoint)a4 inView:(id)a5
{
  return 1;
}

- (BOOL)interaction:(id)a3 canPasteEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  id WeakRetained;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "pasteboardManagerForDayViewController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(WeakRetained) = objc_msgSend(v7, "canPerformPaste");
  return (char)WeakRetained;
}

- (BOOL)interaction:(id)a3 canCreateEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  id WeakRetained;
  void *v6;
  BOOL v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "defaultCalendarForNewEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (BOOL)interaction:(id)a3 canCreateReminderAtPoint:(CGPoint)a4 inView:(id)a5
{
  id WeakRetained;
  void *v6;
  BOOL v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "calendarForNewIntegrationReminders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)interaction:(id)a3 createEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  -[EKDayViewController createEvent:atPoint:inView:](self, "createEvent:atPoint:inView:", 1, a5, a4.x, a4.y);
}

- (void)interaction:(id)a3 createReminderAtPoint:(CGPoint)a4 inView:(id)a5
{
  -[EKDayViewController createEvent:atPoint:inView:](self, "createEvent:atPoint:inView:", 0, a5, a4.x, a4.y);
}

- (void)createEvent:(BOOL)a3 atPoint:(CGPoint)a4 inView:(id)a5
{
  _BOOL4 v5;
  double v7;
  double v8;
  void *v9;
  id WeakRetained;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;

  v5 = a3;
  -[EKDayView convertPoint:fromView:](self->_currentDay, "convertPoint:fromView:", a5, a4.x, a4.y);
  v21 = 0;
  -[EKDayView dateAtPoint:isAllDay:](self->_currentDay, "dateAtPoint:isAllDay:", &v21);
  v8 = CalSnapDateTo15MinuteInterval(0, v7);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = WeakRetained;
  v12 = v21 != 0;
  if (v5)
    v13 = objc_msgSend(WeakRetained, "dayViewController:createEventAtDate:allDay:", self, v9, v12);
  else
    v13 = objc_msgSend(WeakRetained, "dayViewController:createReminderAtDate:allDay:", self, v9, v12);
  v14 = (void *)v13;

  v15 = (void *)MEMORY[0x1E0D0C420];
  objc_msgSend(v14, "eventStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "calendarDateWithDate:timeZone:", v9, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKDayViewController gestureController](self, "gestureController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:", v14, v18, 1, 1, 0);

  -[EKDayViewController gestureController](self, "gestureController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewController eventGestureController:didCommitOccurrence:toDate:isAllDay:span:](self, "eventGestureController:didCommitOccurrence:toDate:isAllDay:span:", v20, v14, v21, 0, v8);

}

- (void)interaction:(id)a3 pasteEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  unsigned __int8 v10;

  -[EKDayView convertPoint:fromView:](self->_currentDay, "convertPoint:fromView:", a5, a4.x, a4.y);
  v10 = 0;
  v6 = (void *)MEMORY[0x1E0C99D68];
  -[EKDayView dateAtPoint:isAllDay:](self->_currentDay, "dateAtPoint:isAllDay:", &v10);
  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "pasteboardManagerForDayViewController:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDateForPaste:", v7);
  objc_msgSend(v9, "pasteEventsWithDateMode:delegate:", -[EKDayViewController _dateModeForAllDay:](self, "_dateModeForAllDay:", v10), self);

}

- (id)interaction:(id)a3 titleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5
{
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  char v11;

  -[EKDayView convertPoint:fromView:](self->_currentDay, "convertPoint:fromView:", a5, a4.x, a4.y);
  v11 = 0;
  -[EKDayView dateAtPoint:isAllDay:](self->_currentDay, "dateAtPoint:isAllDay:", &v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "pasteboardManagerForDayViewController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "numberOfEventsToPaste");
  +[EKUIRightClickEmptySpaceInteraction localizedPasteStringForEventCount:includeHere:](EKUIRightClickEmptySpaceInteraction, "localizedPasteStringForEventCount:includeHere:", v8, v11 == 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)interaction:(id)a3 subtitleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  unsigned __int8 v14;

  -[EKDayView convertPoint:fromView:](self->_currentDay, "convertPoint:fromView:", a5, a4.x, a4.y);
  v14 = 0;
  -[EKDayView dateAtPoint:isAllDay:](self->_currentDay, "dateAtPoint:isAllDay:", &v14);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKCalendar();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0CDD0], "roundedDateForDate:dateMode:calendar:", v6, -[EKDayViewController _dateModeForAllDay:](self, "_dateModeForAllDay:", v14), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v9, "setCalendar:", v7);
  objc_msgSend(v7, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v10);

  objc_msgSend(v9, "setDoesRelativeDateFormatting:", 1);
  v11 = v14 == 0;
  objc_msgSend(v9, "setDateStyle:", 1);
  objc_msgSend(v9, "setTimeStyle:", v11);
  objc_msgSend(v9, "stringFromDate:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4
{
  EKDayViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "dayOccurrenceViewSelected:source:", v6, a4);

}

- (void)attemptDisplayReviewPrompt
{
  EKDayViewControllerDelegate **p_delegate;
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

- (EKDayViewControllerDataSource)dataSource
{
  return (EKDayViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (BOOL)showsBanner
{
  return self->_showsBanner;
}

- (BOOL)allowsSelection
{
  return self->_allowsSelection;
}

- (BOOL)alwaysAnimate
{
  return self->_alwaysAnimate;
}

- (BOOL)disableGestureDayChange
{
  return self->_disableGestureDayChange;
}

- (void)setDisableGestureDayChange:(BOOL)a3
{
  self->_disableGestureDayChange = a3;
}

- (BOOL)disableNotifyDateChangeDuringTracking
{
  return self->_disableNotifyDateChangeDuringTracking;
}

- (BOOL)shouldAutoscrollAfterAppearance
{
  return self->_shouldAutoscrollAfterAppearance;
}

- (BOOL)notifyWhenTapOtherEventDuringDragging
{
  return self->_notifyWhenTapOtherEventDuringDragging;
}

- (void)setNotifyWhenTapOtherEventDuringDragging:(BOOL)a3
{
  self->_notifyWhenTapOtherEventDuringDragging = a3;
}

- (BOOL)preloadExtraDays
{
  return self->_preloadExtraDays;
}

- (UIView)gestureOccurrenceSuperview
{
  return self->_gestureOccurrenceSuperview;
}

- (EKEventOrIntegrationEditView)currentEditor
{
  return self->_currentEditor;
}

- (void)setCurrentEditor:(id)a3
{
  objc_storeStrong((id *)&self->_currentEditor, a3);
}

- (BOOL)showWeekdayLabel
{
  return self->_showWeekdayLabel;
}

- (int)startingFirstVisibleSecond
{
  return self->_startingFirstVisibleSecond;
}

- (CGPoint)normalizedContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_normalizedContentOffset.x;
  y = self->_normalizedContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setNormalizedContentOffset:(CGPoint)a3
{
  self->_normalizedContentOffset = a3;
}

- (NSDateComponents)pendingNextDate
{
  return self->_pendingNextDate;
}

- (void)setPendingNextDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NSDateComponents)pendingPreviousDate
{
  return self->_pendingPreviousDate;
}

- (void)setPendingPreviousDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (NSTimer)showNowTimer
{
  return self->_showNowTimer;
}

- (void)setShowNowTimer:(id)a3
{
  objc_storeStrong((id *)&self->_showNowTimer, a3);
}

- (BOOL)transitionedToSameDay
{
  return self->_transitionedToSameDay;
}

- (void)setTransitionedToSameDay:(BOOL)a3
{
  self->_transitionedToSameDay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showNowTimer, 0);
  objc_storeStrong((id *)&self->_currentEditor, 0);
  objc_storeStrong((id *)&self->_gestureOccurrenceSuperview, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_protectionQueue, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_targetDateComponents, 0);
  objc_storeStrong((id *)&self->_originalDisplayDate, 0);
  objc_storeStrong((id *)&self->_decelerationSpringFactory, 0);
  objc_storeStrong((id *)&self->_eventGestureController, 0);
  objc_storeStrong((id *)&self->_nextDayOccurrences, 0);
  objc_storeStrong((id *)&self->_previousDayOccurrences, 0);
  objc_storeStrong((id *)&self->_occurrences, 0);
  objc_storeStrong((id *)&self->_pendingPreviousDate, 0);
  objc_storeStrong((id *)&self->_pendingNextDate, 0);
  objc_storeStrong((id *)&self->_nextDayWithGutter, 0);
  objc_storeStrong((id *)&self->_currentDayWithGutter, 0);
  objc_storeStrong((id *)&self->_previousDayWithGutter, 0);
  objc_storeStrong((id *)&self->_nextDay, 0);
  objc_storeStrong((id *)&self->_currentDay, 0);
  objc_storeStrong((id *)&self->_previousDay, 0);
  objc_storeStrong((id *)&self->_horizontalScrollingView, 0);
  objc_storeStrong((id *)&self->_clipView, 0);
}

@end
