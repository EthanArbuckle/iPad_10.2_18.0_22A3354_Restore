@implementation PageLoadTestStatistics

+ (void)setRestInterval:(double)a3
{
  s_pageLoadRestInterval = *(_QWORD *)&a3;
}

- (PageLoadTestStatistics)initWithCallback:(id)a3
{
  id v4;
  PageLoadTestStatistics *v5;
  PageLoadTestStatistics *v6;
  uint64_t v7;
  id callbackBlock;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PageLoadTestStatistics;
  v5 = -[PageLoadTestStatistics init](&v10, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_msgSend(v4, "copy");
    callbackBlock = v6->_callbackBlock;
    v6->_callbackBlock = (id)v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[PageLoadTestStatistics _cancelWaitForNewPageLoadEventsTimer](self, "_cancelWaitForNewPageLoadEventsTimer");
  -[PageLoadTestStatistics _cancelPageLoadingTimeoutTimerIfNeeded](self, "_cancelPageLoadingTimeoutTimerIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)PageLoadTestStatistics;
  -[PageLoadTestStatistics dealloc](&v3, sel_dealloc);
}

- (void)handledOnloadEvents
{
  NSDate *v3;
  NSDate *lastOnloadEventDate;

  ++self->_onloadEventsHandled;
  v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  lastOnloadEventDate = self->_lastOnloadEventDate;
  self->_lastOnloadEventDate = v3;

  -[PageLoadTestStatistics _maybePageLoadFinishedForTests](self, "_maybePageLoadFinishedForTests");
}

- (void)startedPageLoad
{
  NSDate *v3;
  NSDate *loadStartDate;

  v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  loadStartDate = self->_loadStartDate;
  self->_loadStartDate = v3;

}

- (void)startedNavigation:(id)a3
{
  WKNavigation *navigation;
  BOOL v4;

  navigation = self->_navigation;
  if (navigation)
    v4 = navigation == a3;
  else
    v4 = 1;
  if (v4)
    ++self->_framesToLoad;
}

- (void)finishedLoadingResources
{
  NSDate *v3;
  NSDate *lastResourceLoadDate;

  self->_pendingResourceLoad = 0;
  if (!self->_lastPageLoadEventDate)
  {
    v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    lastResourceLoadDate = self->_lastResourceLoadDate;
    self->_lastResourceLoadDate = v3;

    -[PageLoadTestStatistics _maybePageLoadFinishedForTests](self, "_maybePageLoadFinishedForTests");
  }
}

- (void)startedLoadingResources
{
  self->_pendingResourceLoad = 1;
  if (self->_waitForNewPageLoadEventsTimer)
    -[PageLoadTestStatistics _cancelWaitForNewPageLoadEventsTimer](self, "_cancelWaitForNewPageLoadEventsTimer");
}

- (void)finishedFirstVisualLayout
{
  NSDate *v3;
  NSDate *firstVisualLayoutDate;

  v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  firstVisualLayoutDate = self->_firstVisualLayoutDate;
  self->_firstVisualLayoutDate = v3;

  -[PageLoadTestStatistics _maybePageLoadFinishedForTests](self, "_maybePageLoadFinishedForTests");
}

- (void)failedNavigation:(id)a3 withError:(id)a4
{
  WKNavigation *navigation;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  NSDate *v12;
  NSDate *lastPageLoadEventDate;
  id v14;

  v14 = a4;
  navigation = self->_navigation;
  if (navigation)
    v8 = navigation == a3;
  else
    v8 = 1;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", self->_loadStartDate);
    v11 = v10;

    if (v11 >= 0.05)
    {
      v12 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
      lastPageLoadEventDate = self->_lastPageLoadEventDate;
      self->_lastPageLoadEventDate = v12;

      objc_storeStrong((id *)&self->_loadError, a4);
      -[PageLoadTestStatistics _pageLoadFinishedForTests](self, "_pageLoadFinishedForTests");
    }
    else
    {
      NSLog((NSString *)CFSTR("PageLoadTestStatistics ignoring error due to 'load duration < 50ms' heuristic: %@"), v14);
    }
  }

}

- (void)finishedNavigation:(id)a3
{
  WKNavigation *navigation;
  BOOL v4;
  NSDate *v6;
  NSDate *mainFrameLoadDate;

  navigation = self->_navigation;
  if (navigation)
    v4 = navigation == a3;
  else
    v4 = 1;
  if (v4)
  {
    v6 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    mainFrameLoadDate = self->_mainFrameLoadDate;
    self->_mainFrameLoadDate = v6;

    -[PageLoadTestStatistics _maybePageLoadFinishedForTests](self, "_maybePageLoadFinishedForTests");
  }
}

- (void)pageLoadFinishedForTestsWK2WithLoadData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSError *loadError;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDate *v19;
  NSDate *domContentLoadedDate;
  void *v21;
  void *v22;
  NSDate *v23;
  NSDate *firstMeaningfulPaintDate;
  void *v25;
  void *v26;
  NSDate *v27;
  NSDate *allSubresourcesLoadedDate;
  void (**callbackBlock)(id, PageLoadTestStatistics *);
  id v30;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99D68];
  v30 = v4;
  objc_msgSend(v4, "objectForKey:", CFSTR("PageLoadStartTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v30, "objectForKey:", CFSTR("PageLoadEndTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v30, "objectForKey:", CFSTR("PageLoadFirstVisuallyNonEmptyLayoutTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  self->_framesToLoad = 0;
  self->_onloadEventsHandled = 0;
  self->_pendingResourceLoad = 0;
  objc_storeStrong((id *)&self->_firstVisualLayoutDate, v13);
  objc_storeStrong((id *)&self->_loadStartDate, v7);
  objc_storeStrong((id *)&self->_lastOnloadEventDate, v10);
  objc_storeStrong((id *)&self->_mainFrameLoadDate, v10);
  objc_storeStrong((id *)&self->_lastResourceLoadDate, v10);
  objc_storeStrong((id *)&self->_lastPageLoadEventDate, v10);
  loadError = self->_loadError;
  self->_loadError = 0;

  objc_msgSend(v30, "objectForKey:", CFSTR("PageMemoryBeforeWarning"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_memoryBeforeWarning = objc_msgSend(v15, "unsignedLongLongValue");

  objc_msgSend(v30, "objectForKey:", CFSTR("PageMemoryAfterWarning"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_memoryAfterWarning = objc_msgSend(v16, "unsignedLongLongValue");

  v17 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v30, "objectForKey:", CFSTR("PageLoadDOMContentLoadedTime"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
  v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
  domContentLoadedDate = self->_domContentLoadedDate;
  self->_domContentLoadedDate = v19;

  v21 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v30, "objectForKey:", CFSTR("PageLoadFirstMeaningfulPaintTime"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
  v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
  firstMeaningfulPaintDate = self->_firstMeaningfulPaintDate;
  self->_firstMeaningfulPaintDate = v23;

  v25 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v30, "objectForKey:", CFSTR("PageLoadAllSubresourcesLoadedTime"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
  v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
  allSubresourcesLoadedDate = self->_allSubresourcesLoadedDate;
  self->_allSubresourcesLoadedDate = v27;

  callbackBlock = (void (**)(id, PageLoadTestStatistics *))self->_callbackBlock;
  if (callbackBlock)
    callbackBlock[2](callbackBlock, self);

}

- (void)_maybePageLoadFinishedForTests
{
  -[PageLoadTestStatistics _cancelPageLoadingTimeoutTimerIfNeeded](self, "_cancelPageLoadingTimeoutTimerIfNeeded");
  if (!-[PageLoadTestStatistics _pageLoadEventsAreStillPending](self, "_pageLoadEventsAreStillPending"))
    -[PageLoadTestStatistics _scheduleWaitForNewPageLoadEventsTimer](self, "_scheduleWaitForNewPageLoadEventsTimer");
}

- (void)_waitForNewPageLoadEventsTimerFired:(id)a3
{
  -[PageLoadTestStatistics _cancelWaitForNewPageLoadEventsTimer](self, "_cancelWaitForNewPageLoadEventsTimer", a3);
  if (!-[PageLoadTestStatistics _pageLoadEventsAreStillPending](self, "_pageLoadEventsAreStillPending")
    && !self->_lastPageLoadEventDate)
  {
    -[PageLoadTestStatistics _pageLoadFinishedForTests](self, "_pageLoadFinishedForTests");
  }
}

- (void)_pageLoadFinishedForTests
{
  void *v3;
  void *v4;
  NSDate *v5;
  NSDate *lastPageLoadEventDate;
  void (**callbackBlock)(id, PageLoadTestStatistics *);

  -[PageLoadTestStatistics _cancelWaitForNewPageLoadEventsTimer](self, "_cancelWaitForNewPageLoadEventsTimer");
  if (!self->_lastPageLoadEventDate)
  {
    -[NSDate laterDate:](self->_mainFrameLoadDate, "laterDate:", self->_firstVisualLayoutDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "laterDate:", self->_lastOnloadEventDate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "laterDate:", self->_lastResourceLoadDate);
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastPageLoadEventDate = self->_lastPageLoadEventDate;
    self->_lastPageLoadEventDate = v5;

  }
  callbackBlock = (void (**)(id, PageLoadTestStatistics *))self->_callbackBlock;
  if (callbackBlock)
    callbackBlock[2](callbackBlock, self);
}

- (BOOL)_pageLoadEventsAreStillPending
{
  NSDate *mainFrameLoadDate;

  mainFrameLoadDate = self->_mainFrameLoadDate;
  if (mainFrameLoadDate
    && !self->_pendingResourceLoad
    && self->_firstVisualLayoutDate
    && self->_onloadEventsHandled == self->_framesToLoad)
  {
    return 0;
  }
  return *(double *)&s_pageLoadRestInterval != 0.0 || mainFrameLoadDate == 0;
}

- (void)_cancelWaitForNewPageLoadEventsTimer
{
  NSTimer *waitForNewPageLoadEventsTimer;

  -[NSTimer invalidate](self->_waitForNewPageLoadEventsTimer, "invalidate");
  waitForNewPageLoadEventsTimer = self->_waitForNewPageLoadEventsTimer;
  self->_waitForNewPageLoadEventsTimer = 0;

}

- (void)_scheduleWaitForNewPageLoadEventsTimer
{
  NSTimer *v3;
  NSTimer *waitForNewPageLoadEventsTimer;

  -[PageLoadTestStatistics _cancelWaitForNewPageLoadEventsTimer](self, "_cancelWaitForNewPageLoadEventsTimer");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__waitForNewPageLoadEventsTimerFired_, 0, 0, *(double *)&s_pageLoadRestInterval);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  waitForNewPageLoadEventsTimer = self->_waitForNewPageLoadEventsTimer;
  self->_waitForNewPageLoadEventsTimer = v3;

}

- (void)_cancelPageLoadingTimeoutTimerIfNeeded
{
  NSTimer *pageLoadingTimeoutTimer;

  -[NSTimer invalidate](self->_pageLoadingTimeoutTimer, "invalidate");
  pageLoadingTimeoutTimer = self->_pageLoadingTimeoutTimer;
  self->_pageLoadingTimeoutTimer = 0;

}

- (void)_pageLoadTimeoutTimerFired:(id)a3
{
  WKNavigation *navigation;
  id v5;

  navigation = self->_navigation;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kPageLoadStatsErrorDomain, -1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PageLoadTestStatistics failedNavigation:withError:](self, "failedNavigation:withError:", navigation);

}

- (void)setPageLoadingTimeoutInterval:(double)a3
{
  NSTimer *v4;
  NSTimer *pageLoadingTimeoutTimer;

  if (self->_pageLoadingTimeoutInterval != a3)
  {
    self->_pageLoadingTimeoutInterval = a3;
    -[PageLoadTestStatistics _cancelPageLoadingTimeoutTimerIfNeeded](self, "_cancelPageLoadingTimeoutTimerIfNeeded");
    if (self->_pageLoadingTimeoutInterval > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__pageLoadTimeoutTimerFired_, 0, 0);
      v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      pageLoadingTimeoutTimer = self->_pageLoadingTimeoutTimer;
      self->_pageLoadingTimeoutTimer = v4;

    }
  }
}

- (WKNavigation)navigation
{
  return self->_navigation;
}

- (void)setNavigation:(id)a3
{
  objc_storeStrong((id *)&self->_navigation, a3);
}

- (NSDate)firstVisualLayoutDate
{
  return self->_firstVisualLayoutDate;
}

- (void)setFirstVisualLayoutDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstVisualLayoutDate, a3);
}

- (NSDate)loadStartDate
{
  return self->_loadStartDate;
}

- (void)setLoadStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_loadStartDate, a3);
}

- (NSDate)lastOnloadEventDate
{
  return self->_lastOnloadEventDate;
}

- (void)setLastOnloadEventDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastOnloadEventDate, a3);
}

- (NSDate)mainFrameLoadDate
{
  return self->_mainFrameLoadDate;
}

- (void)setMainFrameLoadDate:(id)a3
{
  objc_storeStrong((id *)&self->_mainFrameLoadDate, a3);
}

- (NSDate)lastResourceLoadDate
{
  return self->_lastResourceLoadDate;
}

- (void)setLastResourceLoadDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastResourceLoadDate, a3);
}

- (NSDate)lastPageLoadEventDate
{
  return self->_lastPageLoadEventDate;
}

- (void)setLastPageLoadEventDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPageLoadEventDate, a3);
}

- (NSDate)domContentLoadedDate
{
  return self->_domContentLoadedDate;
}

- (void)setDomContentLoadedDate:(id)a3
{
  objc_storeStrong((id *)&self->_domContentLoadedDate, a3);
}

- (NSDate)firstMeaningfulPaintDate
{
  return self->_firstMeaningfulPaintDate;
}

- (void)setFirstMeaningfulPaintDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstMeaningfulPaintDate, a3);
}

- (NSDate)allSubresourcesLoadedDate
{
  return self->_allSubresourcesLoadedDate;
}

- (void)setAllSubresourcesLoadedDate:(id)a3
{
  objc_storeStrong((id *)&self->_allSubresourcesLoadedDate, a3);
}

- (NSError)loadError
{
  return self->_loadError;
}

- (void)setLoadError:(id)a3
{
  objc_storeStrong((id *)&self->_loadError, a3);
}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (void)setCallbackBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (unint64_t)memoryBeforeWarning
{
  return self->_memoryBeforeWarning;
}

- (void)setMemoryBeforeWarning:(unint64_t)a3
{
  self->_memoryBeforeWarning = a3;
}

- (unint64_t)memoryAfterWarning
{
  return self->_memoryAfterWarning;
}

- (void)setMemoryAfterWarning:(unint64_t)a3
{
  self->_memoryAfterWarning = a3;
}

- (double)pageLoadingTimeoutInterval
{
  return self->_pageLoadingTimeoutInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callbackBlock, 0);
  objc_storeStrong((id *)&self->_loadError, 0);
  objc_storeStrong((id *)&self->_allSubresourcesLoadedDate, 0);
  objc_storeStrong((id *)&self->_firstMeaningfulPaintDate, 0);
  objc_storeStrong((id *)&self->_domContentLoadedDate, 0);
  objc_storeStrong((id *)&self->_lastPageLoadEventDate, 0);
  objc_storeStrong((id *)&self->_lastResourceLoadDate, 0);
  objc_storeStrong((id *)&self->_mainFrameLoadDate, 0);
  objc_storeStrong((id *)&self->_lastOnloadEventDate, 0);
  objc_storeStrong((id *)&self->_loadStartDate, 0);
  objc_storeStrong((id *)&self->_firstVisualLayoutDate, 0);
  objc_storeStrong((id *)&self->_navigation, 0);
  objc_storeStrong((id *)&self->_pageLoadingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_waitForNewPageLoadEventsTimer, 0);
}

@end
