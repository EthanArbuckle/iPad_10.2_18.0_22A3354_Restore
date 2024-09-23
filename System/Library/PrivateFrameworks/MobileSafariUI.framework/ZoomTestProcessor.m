@implementation ZoomTestProcessor

- (ZoomTestProcessor)initWithTestName:(id)a3 browserController:(id)a4
{
  ZoomTestProcessor *v4;
  ZoomTestProcessor *v5;
  ZoomTestProcessor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ZoomTestProcessor;
  v4 = -[ContentInteractionTestRunner initWithTestName:browserController:](&v8, sel_initWithTestName_browserController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[ZoomTestProcessor setTestState:](v4, "setTestState:", 0);
    v6 = v5;
  }

  return v5;
}

- (BOOL)startPageAction:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (!-[ZoomTestProcessor stepsPerZoom](self, "stepsPerZoom"))
    -[ZoomTestProcessor setStepsPerZoom:](self, "setStepsPerZoom:", 50);
  -[ZoomTestProcessor setTestState:](self, "setTestState:", 1);
  v7.receiver = self;
  v7.super_class = (Class)ZoomTestProcessor;
  v5 = -[ContentInteractionTestRunner startPageAction:](&v7, sel_startPageAction_, v4);

  return v5;
}

- (BOOL)updateWithNewScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  -[ContentInteractionTestRunner pageWebView](self, "pageWebView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "minimumZoomScale");
  v6 = v5;
  objc_msgSend(v4, "maximumZoomScale");
  v8 = v7;
  objc_msgSend(v4, "zoomScale");
  v10 = v9;
  v11 = (v8 - v6) / (double)-[ZoomTestProcessor stepsPerZoom](self, "stepsPerZoom");
  if (-[ZoomTestProcessor zoomingIn](self, "zoomingIn"))
  {
    v12 = v10 + v11;
    if (v10 + v11 > v8)
    {
      -[ZoomTestProcessor setZoomingIn:](self, "setZoomingIn:", 0, v12);
LABEL_7:
      v13 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v12 = v10 - v11;
    if (v10 - v11 < v6)
    {
      -[ZoomTestProcessor setZoomingIn:](self, "setZoomingIn:", 1, v12);
      -[ZoomTestProcessor setIterationsRemaining:](self, "setIterationsRemaining:", -[ZoomTestProcessor iterationsRemaining](self, "iterationsRemaining") - 1);
      goto LABEL_7;
    }
  }
  objc_msgSend(v4, "setZoomScale:", v12);
  v13 = 1;
LABEL_8:

  return v13;
}

- (void)zoomTestStep
{
  int v3;
  void *v4;
  void *v5;

  if (!-[ZoomTestProcessor didFirstZoomStep](self, "didFirstZoomStep"))
  {
    -[ContentInteractionTestRunner startTrackingFrameRate](self, "startTrackingFrameRate");
    -[ZoomTestProcessor setDidFirstZoomStep:](self, "setDidFirstZoomStep:", 1);
  }
  while (!-[ZoomTestProcessor updateWithNewScale](self, "updateWithNewScale"))
    ;
  v3 = -[ZoomTestProcessor iterationsRemaining](self, "iterationsRemaining");
  -[ZoomTestProcessor displayLink](self, "displayLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {

    if (!v5)
      -[ZoomTestProcessor performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_zoomTestStep, 0, 0.0);
  }
  else
  {
    objc_msgSend(v4, "invalidate");

    -[ZoomTestProcessor setTestState:](self, "setTestState:", 3);
    -[ContentInteractionTestRunner endTrackingFrameRate](self, "endTrackingFrameRate");
  }
}

- (void)startZoomingTest
{
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ZoomTestProcessor setIterationsRemaining:](self, "setIterationsRemaining:", -[ContentInteractionTestRunner iterations](self, "iterations"));
  -[ZoomTestProcessor setZoomingIn:](self, "setZoomingIn:", 1);
  v3 = getenv("CA_BENCHMARK");
  if (!v3 || strcmp(v3, "1"))
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_zoomTestStep);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ZoomTestProcessor setDisplayLink:](self, "setDisplayLink:", v4);

    -[ZoomTestProcessor displayLink](self, "displayLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

  }
  -[ZoomTestProcessor displayLink](self, "displayLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[ZoomTestProcessor performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_zoomTestStep, 0, 0.0);
}

- (BOOL)performActionForPage:(id)a3
{
  if (-[ZoomTestProcessor testState](self, "testState", a3) == 1)
  {
    -[ZoomTestProcessor startZoomingTest](self, "startZoomingTest");
    -[ZoomTestProcessor setTestState:](self, "setTestState:", 2);
  }
  return -[ZoomTestProcessor testState](self, "testState") != 3;
}

- (int)stepsPerZoom
{
  return self->_stepsPerZoom;
}

- (void)setStepsPerZoom:(int)a3
{
  self->_stepsPerZoom = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
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

- (BOOL)didFirstZoomStep
{
  return self->_didFirstZoomStep;
}

- (void)setDidFirstZoomStep:(BOOL)a3
{
  self->_didFirstZoomStep = a3;
}

- (BOOL)zoomingIn
{
  return self->_zoomingIn;
}

- (void)setZoomingIn:(BOOL)a3
{
  self->_zoomingIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
