@implementation ScrollTestProcessor

- (ScrollTestProcessor)initWithTestName:(id)a3 browserController:(id)a4
{
  ScrollTestProcessor *v4;
  ScrollTestProcessor *v5;
  ScrollTestProcessor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ScrollTestProcessor;
  v4 = -[ContentInteractionTestRunner initWithTestName:browserController:](&v8, sel_initWithTestName_browserController_, a3, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (BOOL)startPageAction:(id)a3
{
  id v4;
  objc_super v6;

  v4 = a3;
  -[ScrollTestProcessor setStartedScrollTest:](self, "setStartedScrollTest:", 0);
  v6.receiver = self;
  v6.super_class = (Class)ScrollTestProcessor;
  LOBYTE(self) = -[ContentInteractionTestRunner startPageAction:](&v6, sel_startPageAction_, v4);

  return (char)self;
}

- (BOOL)performActionForPage:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  -[ContentInteractionTestRunner pageWebView](self, "pageWebView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[ScrollTestProcessor startedScrollTest](self, "startedScrollTest"))
  {
    -[ContentInteractionTestRunner startTrackingFrameRate](self, "startTrackingFrameRate");
    v6 = -[ContentInteractionTestRunner iterations](self, "iterations");
    if (-[ScrollTestProcessor scrollDelta](self, "scrollDelta"))
      v7 = -[ScrollTestProcessor scrollDelta](self, "scrollDelta");
    else
      v7 = 10;
    objc_msgSend(v5, "_performScrollTest:iterations:delta:", &stru_1E9CFDBB0, v6, v7);
    -[ScrollTestProcessor setStartedScrollTest:](self, "setStartedScrollTest:", 1);
  }
  v8 = objc_msgSend(v5, "_isAnimatingScrollTest");
  if ((v8 & 1) == 0)
    -[ContentInteractionTestRunner endTrackingFrameRate](self, "endTrackingFrameRate");

  return v8;
}

- (int)scrollDelta
{
  return *(_DWORD *)&self->_startedScrollTest;
}

- (void)setScrollDelta:(int)a3
{
  *(_DWORD *)&self->_startedScrollTest = a3;
}

- (BOOL)startedScrollTest
{
  return *((_BYTE *)&self->super._iterations + 4);
}

- (void)setStartedScrollTest:(BOOL)a3
{
  *((_BYTE *)&self->super._iterations + 4) = a3;
}

@end
