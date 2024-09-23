@implementation ContentInteractionTestRunner

- (ContentInteractionTestRunner)initWithTestName:(id)a3 browserController:(id)a4
{
  ContentInteractionTestRunner *v4;
  ContentInteractionTestRunner *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ContentInteractionTestRunner;
  v4 = -[PageLoadTestRunner initWithTestName:browserController:](&v7, sel_initWithTestName_browserController_, a3, a4);
  v5 = v4;
  if (v4)
    -[PageLoadTestRunner setPageActionInterval:](v4, "setPageActionInterval:", 0.0166666667);
  return v5;
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

- (BOOL)startPageAction:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (!-[ContentInteractionTestRunner iterations](self, "iterations"))
    -[ContentInteractionTestRunner setIterations:](self, "setIterations:", 5);
  v7.receiver = self;
  v7.super_class = (Class)ContentInteractionTestRunner;
  v5 = -[PageLoadTestRunner startPageAction:](&v7, sel_startPageAction_, v4);

  return v5;
}

- (void)startTrackingFrameRate
{
  void *v2;
  id v3;

  v2 = (void *)*MEMORY[0x1E0DC4730];
  -[PageLoadTestRunner testName](self, "testName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startedTest:", v3);

}

- (void)endTrackingFrameRate
{
  void *v2;
  id v3;

  v2 = (void *)*MEMORY[0x1E0DC4730];
  -[PageLoadTestRunner testName](self, "testName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishedTest:", v3);

}

- (void)startSubtest:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)*MEMORY[0x1E0DC4730];
  v5 = a3;
  -[PageLoadTestRunner testName](self, "testName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedSubTest:forTest:", v5, v6);

}

- (void)stopSubtest:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)*MEMORY[0x1E0DC4730];
  v5 = a3;
  -[PageLoadTestRunner testName](self, "testName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishedSubTest:forTest:", v5, v6);

}

- (int)iterations
{
  return self->_iterations;
}

- (void)setIterations:(int)a3
{
  self->_iterations = a3;
}

@end
