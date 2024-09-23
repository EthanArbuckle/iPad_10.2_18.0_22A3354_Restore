@implementation ScrollPerfTestRunner

- (ScrollPerfTestRunner)initWithTestName:(id)a3 browserController:(id)a4
{
  ScrollPerfTestRunner *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *eventGeneratorQueue;
  uint64_t v7;
  NSMutableDictionary *outputData;
  ScrollPerfTestRunner *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ScrollPerfTestRunner;
  v4 = -[PurplePageLoadTestRunner initWithTestName:browserController:](&v11, sel_initWithTestName_browserController_, a3, a4);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.mobilesafari.EventGenerator", 0);
    eventGeneratorQueue = v4->_eventGeneratorQueue;
    v4->_eventGeneratorQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    outputData = v4->_outputData;
    v4->_outputData = (NSMutableDictionary *)v7;

    -[PageLoadTestRunner setFailFast:](v4, "setFailFast:", 0);
    -[PageLoadTestRunner setResetsZoomBetweenPages:](v4, "setResetsZoomBetweenPages:", 0);
    v9 = v4;
  }

  return v4;
}

- (id)pageWebView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PageLoadTestRunner browserController](self, "browserController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTabDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pageScrollView
{
  void *v2;
  void *v3;

  -[ScrollPerfTestRunner pageWebView](self, "pageWebView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)writeOutputData
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[ScrollPerfTestRunner pageScrollView](self, "pageScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = self->_outputData;
  v25[0] = CFSTR("runs");
  v25[1] = CFSTR("suiteName");
  -[PageLoadTestRunner suiteName](self, "suiteName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PageLoadTestRunner suiteName](self, "suiteName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("<no suite name>");
  }
  v26[1] = v5;
  v25[2] = CFSTR("frameWidth");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "bounds");
  objc_msgSend(v6, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v8;
  v25[3] = CFSTR("frameHeight");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "bounds");
  objc_msgSend(v9, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v11;
  v25[4] = CFSTR("scrollViewDecelerationRate");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "decelerationRate");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v13;
  v25[5] = CFSTR("machineConfiguration");
  -[ScrollPerfTestRunner machineConfigInfo](self, "machineConfigInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  -[PageLoadTestRunner outputFilename](self, "outputFilename");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v16, 0, &v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v24;
    if (v19)
    {
      v20 = v19;
      NSLog((NSString *)CFSTR("Error while serializing Scrolling Performance Test results: %@"), v19);
    }
    else
    {
      -[PageLoadTestRunner outputFilename](self, "outputFilename");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v18, "writeToFile:options:error:", v21, 0, &v23);
      v20 = v23;

      if (!v20)
      {

        goto LABEL_13;
      }
      -[PageLoadTestRunner outputFilename](self, "outputFilename");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog((NSString *)CFSTR("Error writing output to file %@: %@"), v22, v20);

    }
  }
  else
  {
    NSLog((NSString *)CFSTR("%@"), v16);
  }
LABEL_13:

}

- (void)finishedTestRunner
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ScrollPerfTestRunner;
  -[PurplePageLoadTestRunner finishedTestRunner](&v4, sel_finishedTestRunner);
  -[PageLoadTestRunner outputFilename](self, "outputFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PageLoadTestRunner log:](self, "log:", CFSTR("ScrollPerf Complete. Wrote data to %@"), v3);

}

- (void)startingTestPage:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[ScrollPerfTestRunner pageWebView](self, "pageWebView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setScrollPerformanceDataCollectionEnabled:", 1);

  v6.receiver = self;
  v6.super_class = (Class)ScrollPerfTestRunner;
  -[PageLoadTestRunner startingTestPage:](&v6, sel_startingTestPage_, v4);

  ++self->_pageIndex;
  self->_startLoadTime = CFAbsoluteTimeGetCurrent();
}

- (BOOL)performActionForPage:(id)a3
{
  id v4;
  unsigned int scrollGestureCount;
  BOOL v6;

  v4 = a3;
  scrollGestureCount = self->_scrollGestureCount;
  if (!scrollGestureCount)
  {
    if (!self->_gestureState)
      self->_startScrollingTime = CFAbsoluteTimeGetCurrent();
    goto LABEL_7;
  }
  if (scrollGestureCount != 20 || self->_gestureState)
  {
LABEL_7:
    -[ScrollPerfTestRunner appendToFramerateHistory](self, "appendToFramerateHistory");
    -[ScrollPerfTestRunner advanceGesture](self, "advanceGesture");
    v6 = 1;
    goto LABEL_8;
  }
  v6 = 0;
  self->_endScrollingTime = CFAbsoluteTimeGetCurrent();
LABEL_8:

  return v6;
}

- (void)appendToFramerateHistory
{
  CFAbsoluteTime Current;
  double lastFramerateTime;
  unsigned int FrameCounter;
  double v6;
  NSMutableArray *framerateHistory;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  lastFramerateTime = self->_lastFramerateTime;
  if (lastFramerateTime == 0.0)
  {
    self->_lastFramerateTime = Current;
    self->_lastFrameCounter = CARenderServerGetFrameCounter();
  }
  else if (Current - lastFramerateTime >= 0.0666666667)
  {
    FrameCounter = CARenderServerGetFrameCounter();
    v6 = (double)(FrameCounter - self->_lastFrameCounter) / (Current - self->_lastFramerateTime);
    framerateHistory = self->_framerateHistory;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Current);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](framerateHistory, "addObject:", v10);

    self->_lastFrameCounter = FrameCounter;
    self->_lastFramerateTime = Current;
  }
}

- (CGPoint)touchPointForMoveIndex:(unint64_t)a3
{
  double v3;
  int64_t scrollDirection;
  double v5;
  double v6;
  CGPoint result;

  v3 = gestureOffsets[a3];
  scrollDirection = self->_scrollDirection;
  if (scrollDirection == 1)
  {
    v5 = v3 + 80.0;
  }
  else
  {
    v5 = 0.0;
    if (!scrollDirection)
      v5 = 500.0 - v3;
  }
  v6 = 100.0;
  result.y = v5;
  result.x = v6;
  return result;
}

- (void)advanceGesture
{
  int64_t v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  NSObject *eventGeneratorQueue;
  double Current;
  double gestureStartTime;
  int IsPad;
  double v11;
  unsigned int v12;
  void *v13;
  char v14;
  _QWORD block[5];

  switch(self->_gestureState)
  {
    case 0:
      v3 = 1;
      goto LABEL_9;
    case 1:
      -[ScrollPerfTestRunner determineScrollDirection](self, "determineScrollDirection");
      -[ScrollPerfTestRunner pageScrollView](self, "pageScrollView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentOffset");
      self->_scrollOffsetAtGestureStart.x = v5;
      self->_scrollOffsetAtGestureStart.y = v6;

      self->_gestureStartTime = CFAbsoluteTimeGetCurrent();
      eventGeneratorQueue = self->_eventGeneratorQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__ScrollPerfTestRunner_advanceGesture__block_invoke;
      block[3] = &unk_1E9CF1900;
      block[4] = self;
      dispatch_async(eventGeneratorQueue, block);
      v3 = 2;
      goto LABEL_9;
    case 3:
      Current = CFAbsoluteTimeGetCurrent();
      gestureStartTime = self->_gestureStartTime;
      IsPad = _SFDeviceIsPad();
      v11 = 0.95;
      if (!IsPad)
        v11 = 0.5;
      if (Current <= gestureStartTime + v11)
        return;
      self->_gestureState = 0;
      v12 = self->_scrollGestureCount + 1;
      self->_scrollGestureCount = v12;
      if (v12 != 20)
        return;
      v3 = 4;
LABEL_9:
      self->_gestureState = v3;
      return;
    case 4:
      -[ScrollPerfTestRunner pageScrollView](self, "pageScrollView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isDecelerating");

      if ((v14 & 1) == 0)
        self->_gestureState = 0;
      return;
    default:
      return;
  }
}

void __38__ScrollPerfTestRunner_advanceGesture__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t i;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  _QWORD block[5];
  double v17;
  double v18;

  objc_msgSend(*(id *)(a1 + 32), "touchPointForMoveIndex:", 0);
  v3 = v2;
  v5 = v4;
  v17 = v2;
  v18 = v4;
  +[TouchEventGenerator sharedTouchEventGenerator](TouchEventGenerator, "sharedTouchEventGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "touchDown:", v3, v5);

  for (i = 1; i != 7; ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "touchPointForMoveIndex:", i);
    v17 = v8;
    v18 = v9;
    +[TouchEventGenerator sharedTouchEventGenerator](TouchEventGenerator, "sharedTouchEventGenerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (i == 1)
      v12 = 0.0;
    else
      v12 = 0.017;
    objc_msgSend(v10, "moveToPoints:touchCount:duration:", &v17, 1, v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "touchPointForMoveIndex:", 6);
  v17 = v13;
  v18 = v14;
  +[TouchEventGenerator sharedTouchEventGenerator](TouchEventGenerator, "sharedTouchEventGenerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "liftUp:", v17, v18);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ScrollPerfTestRunner_advanceGesture__block_invoke_2;
  block[3] = &unk_1E9CF1900;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __38__ScrollPerfTestRunner_advanceGesture__block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 216) = 3;
  return result;
}

- (void)determineScrollDirection
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  id v11;

  -[ScrollPerfTestRunner pageScrollView](self, "pageScrollView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentOffset");
  v4 = v3;
  objc_msgSend(v11, "bounds");
  v6 = v5;
  objc_msgSend(v11, "contentInset");
  v8 = v6 - v7;
  objc_msgSend(v11, "contentSize");
  if (v4 < v8)
  {
    v10 = 0;
LABEL_5:
    self->_scrollDirection = v10;
    goto LABEL_6;
  }
  if (v4 > v9 + v6 * -2.0)
  {
    v10 = 1;
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)isPageTooShortToScroll
{
  void *v2;
  double v3;
  double v4;
  double v5;
  BOOL v6;

  -[ScrollPerfTestRunner pageScrollView](self, "pageScrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  objc_msgSend(v2, "contentSize");
  v6 = v5 / v4 < 2.5;

  return v6;
}

- (BOOL)startPageAction:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *framerateHistory;
  void *v8;
  NSMutableDictionary *outputData;
  void *v10;
  void *v11;
  BOOL v12;
  objc_super v14;

  v4 = a3;
  -[ScrollPerfTestRunner pageScrollView](self, "pageScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  objc_msgSend(v4, "setContentSizeAtPageLoad:");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 142);
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  framerateHistory = self->_framerateHistory;
  self->_framerateHistory = v6;

  self->_lastFramerateTime = 0.0;
  if (-[ScrollPerfTestRunner isPageTooShortToScroll](self, "isPageTooShortToScroll"))
  {
    objc_msgSend(v4, "setTooShortToScroll:", 1);
    -[ScrollPerfTestRunner outputDataForPage:](self, "outputDataForPage:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    outputData = self->_outputData;
    objc_msgSend(v4, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](outputData, "setObject:forKeyedSubscript:", v8, v11);

    v12 = 0;
  }
  else
  {
    self->_scrollGestureCount = 0;
    v14.receiver = self;
    v14.super_class = (Class)ScrollPerfTestRunner;
    v12 = -[PageLoadTestRunner startPageAction:](&v14, sel_startPageAction_, v4);
  }

  return v12;
}

- (void)finishPage:(id)a3 stats:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  self->_endLoadTime = CFAbsoluteTimeGetCurrent();
  v11.receiver = self;
  v11.super_class = (Class)ScrollPerfTestRunner;
  -[PageLoadTestRunner finishPage:stats:error:](&v11, sel_finishPage_stats_error_, v10, v9, v8);

}

- (void)finishedTestPage:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *outputData;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[ScrollPerfTestRunner outputDataForPage:](self, "outputDataForPage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  outputData = self->_outputData;
  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](outputData, "setObject:forKeyedSubscript:", v5, v8);

  -[ScrollPerfTestRunner writeOutputData](self, "writeOutputData");
  -[ScrollPerfTestRunner pageWebView](self, "pageWebView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setScrollPerformanceDataCollectionEnabled:", 0);

  v10.receiver = self;
  v10.super_class = (Class)ScrollPerfTestRunner;
  -[PageLoadTestRunner finishedTestPage:](&v10, sel_finishedTestPage_, v4);

}

- (id)finalStatusForPage:(id)a3
{
  id v4;
  const __CFString *v5;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  if ((objc_msgSend(v4, "isTooShortToScroll") & 1) != 0)
  {
    v5 = CFSTR("PageTooShortToScroll");
  }
  else
  {
    v6 = objc_msgSend(v4, "status");
    if (v6 < 7 && ((0x4Fu >> v6) & 1) != 0)
    {
      v5 = off_1E9CF5E10[v6];
    }
    else
    {
      objc_msgSend(v4, "contentSizeAtPageLoad");
      v8 = v7;
      v10 = v9;
      -[ScrollPerfTestRunner pageScrollView](self, "pageScrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contentSize");
      v13 = v12;
      v15 = v14;

      if (v15 < v10 || v13 < v8)
        v5 = CFSTR("PageChangedSizeDuringScroll");
      else
        v5 = CFSTR("FinishedScrolling");
    }
  }

  return (id)v5;
}

- (id)machineConfigInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("model");
  mobileGestaltStringForQuery();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("device");
  mobileGestaltStringForQuery();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("operatingSystem");
  mobileGestaltStringForQuery();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputDataForPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  NSMutableArray *framerateHistory;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[13];
  _QWORD v31[15];

  v31[13] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ScrollPerfTestRunner pageScrollView](self, "pageScrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ScrollPerfTestRunner pageWebView](self, "pageWebView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scrollPerformanceData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = CFSTR("url");
  objc_msgSend(v4, "URL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "absoluteString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v28;
  v30[1] = CFSTR("order");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pageIndex);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v27;
  v30[2] = CFSTR("contentHeight");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v26, "contentSize");
  objc_msgSend(v7, "numberWithDouble:", v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v25;
  v30[3] = CFSTR("visibleContentHeight");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v26, "bounds");
  objc_msgSend(v9, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v11;
  v30[4] = CFSTR("state");
  -[ScrollPerfTestRunner finalStatusForPage:](self, "finalStatusForPage:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v12;
  v30[5] = CFSTR("startLoadTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startLoadTime);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v13;
  v30[6] = CFSTR("endLoadTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endLoadTime);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v14;
  v30[7] = CFSTR("startScrollingTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startScrollingTime);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v15;
  v30[8] = CFSTR("endScrollingTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endScrollingTime);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v16;
  v30[9] = CFSTR("framerate");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "framesPerSecond");
  v19 = v18;

  objc_msgSend(v17, "numberWithDouble:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v20;
  v31[10] = MEMORY[0x1E0C9AAA0];
  v30[10] = CFSTR("watchdogTimerFired");
  v30[11] = CFSTR("scrollingEvents");
  framerateHistory = (NSMutableArray *)MEMORY[0x1E0C9AA60];
  v30[12] = CFSTR("framerateHistory");
  if (v6)
    v22 = v6;
  else
    v22 = (void *)MEMORY[0x1E0C9AA60];
  if (self->_framerateHistory)
    framerateHistory = self->_framerateHistory;
  v31[11] = v22;
  v31[12] = framerateHistory;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_framerateHistory, 0);
  objc_storeStrong((id *)&self->_eventGeneratorQueue, 0);
}

@end
