@implementation ZoomAnimationTestProcessor

- (ZoomAnimationTestProcessor)initWithTestName:(id)a3 browserController:(id)a4
{
  ZoomAnimationTestProcessor *v4;
  ZoomAnimationTestProcessor *v5;
  void *v6;
  void *v7;
  ZoomAnimationTestProcessor *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ZoomAnimationTestProcessor;
  v4 = -[ContentInteractionTestRunner initWithTestName:browserController:](&v10, sel_initWithTestName_browserController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[ZoomAnimationTestProcessor setTestState:](v4, "setTestState:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_scrollViewWillBeginZooming_, CFSTR("ScrollViewWillBeginZoomingNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_scrollViewDidEndZooming_, CFSTR("ScrollViewDidEndZoomingNotification"), 0);

    v8 = v5;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ZoomAnimationTestProcessor;
  -[PageLoadTestRunner dealloc](&v4, sel_dealloc);
}

- (BOOL)startPageAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  -[ZoomAnimationTestProcessor setTestState:](self, "setTestState:", 1);
  -[ZoomAnimationTestProcessor setTargetIndex:](self, "setTargetIndex:", 0);
  -[ZoomAnimationTestProcessor setIterationsRemaining:](self, "setIterationsRemaining:", -[ContentInteractionTestRunner iterations](self, "iterations"));
  -[ContentInteractionTestRunner pageWebView](self, "pageWebView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "zoomScale");
  -[ZoomAnimationTestProcessor setInitialZoom:](self, "setInitialZoom:");
  v8.receiver = self;
  v8.super_class = (Class)ZoomAnimationTestProcessor;
  LOBYTE(self) = -[ContentInteractionTestRunner startPageAction:](&v8, sel_startPageAction_, v4);

  return (char)self;
}

- (void)scrollViewWillBeginZooming:(id)a3
{
  -[ContentInteractionTestRunner startSubtest:](self, "startSubtest:", CFSTR("zooming"));
}

- (void)scrollViewDidEndZooming:(id)a3
{
  -[ContentInteractionTestRunner stopSubtest:](self, "stopSubtest:", CFSTR("zooming"));
  -[ZoomAnimationTestProcessor resetZoom](self, "resetZoom");
  -[ZoomAnimationTestProcessor setTestState:](self, "setTestState:", 4);
  -[ZoomAnimationTestProcessor advanceTest](self, "advanceTest");
}

- (void)startZoom
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double *v7;
  id v8;

  -[ContentInteractionTestRunner pageWebView](self, "pageWebView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0C9D538];
  objc_msgSend(v8, "contentSize");
  v6 = v5;
  v7 = (double *)((char *)&zoomTargets + 32 * -[ZoomAnimationTestProcessor targetIndex](self, "targetIndex"));
  objc_msgSend(v8, "zoomToRect:animated:", 1, v4 + v6 * v7[1] - v6 * v7[2] * 0.5, *v7 - v6 * v7[2] / v7[3] * 0.5);

}

- (void)resetZoom
{
  void *v3;
  id v4;

  -[ContentInteractionTestRunner pageWebView](self, "pageWebView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[ZoomAnimationTestProcessor initialZoom](self, "initialZoom");
  objc_msgSend(v4, "setZoomScale:");

}

- (void)advanceTest
{
  uint64_t v3;

  if (-[ZoomAnimationTestProcessor testState](self, "testState") == 1)
  {
    -[ContentInteractionTestRunner startTrackingFrameRate](self, "startTrackingFrameRate");
LABEL_3:
    -[ZoomAnimationTestProcessor setTestState:](self, "setTestState:", 2);
    -[ZoomAnimationTestProcessor advanceTest](self, "advanceTest");
    return;
  }
  if (-[ZoomAnimationTestProcessor testState](self, "testState") == 2)
  {
    -[ZoomAnimationTestProcessor startZoom](self, "startZoom");
    -[ZoomAnimationTestProcessor setTestState:](self, "setTestState:", 3);
  }
  else if (-[ZoomAnimationTestProcessor testState](self, "testState") == 4)
  {
    -[ZoomAnimationTestProcessor setTargetIndex:](self, "setTargetIndex:", -[ZoomAnimationTestProcessor targetIndex](self, "targetIndex") + 1);
    if (-[ZoomAnimationTestProcessor targetIndex](self, "targetIndex") != 3)
      goto LABEL_3;
    -[ZoomAnimationTestProcessor setTargetIndex:](self, "setTargetIndex:", 0);
    v3 = -[ZoomAnimationTestProcessor iterationsRemaining](self, "iterationsRemaining") - 1;
    -[ZoomAnimationTestProcessor setIterationsRemaining:](self, "setIterationsRemaining:", v3);
    if ((_DWORD)v3)
      goto LABEL_3;
    -[ZoomAnimationTestProcessor setTestState:](self, "setTestState:", 5);
    -[ContentInteractionTestRunner endTrackingFrameRate](self, "endTrackingFrameRate");
  }
}

- (BOOL)performActionForPage:(id)a3
{
  if (-[ZoomAnimationTestProcessor testState](self, "testState", a3) == 1)
    -[ZoomAnimationTestProcessor advanceTest](self, "advanceTest");
  return -[ZoomAnimationTestProcessor testState](self, "testState") != 5;
}

- (int)iterationsRemaining
{
  return self->_iterationsRemaining;
}

- (void)setIterationsRemaining:(int)a3
{
  self->_iterationsRemaining = a3;
}

- (int64_t)testState
{
  return self->_testState;
}

- (void)setTestState:(int64_t)a3
{
  self->_testState = a3;
}

- (int)targetIndex
{
  return self->_targetIndex;
}

- (void)setTargetIndex:(int)a3
{
  self->_targetIndex = a3;
}

- (double)initialZoom
{
  return self->_initialZoom;
}

- (void)setInitialZoom:(double)a3
{
  self->_initialZoom = a3;
}

@end
