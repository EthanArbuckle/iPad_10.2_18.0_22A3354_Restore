@implementation CAMPerformanceTestHarness

- (CAMPerformanceTestHarness)initWithTestName:(id)a3
{
  id v4;
  CAMPerformanceTestHarness *v5;
  uint64_t v6;
  NSString *testName;
  CAMPerformanceTestHarness *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMPerformanceTestHarness;
  v5 = -[CAMPerformanceTestHarness init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    testName = v5->_testName;
    v5->_testName = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)startTesting
{
  void *v3;
  void (**v4)(void);
  void (**v5)(void);

  -[CAMPerformanceTestHarness setRunningTest:](self, "setRunningTest:", 1);
  -[CAMPerformanceTestHarness delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willStartTestHarness:", self);

  -[CAMPerformanceTestHarness startHandler](self, "startHandler");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v4[2]();
    v4 = v5;
  }

}

- (void)stopTesting
{
  void *v3;
  void (**v4)(void);
  void (**v5)(void);

  -[CAMPerformanceTestHarness setRunningTest:](self, "setRunningTest:", 0);
  -[CAMPerformanceTestHarness delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willEndTestHarness:", self);

  -[CAMPerformanceTestHarness completionHandler](self, "completionHandler");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v4[2]();
    v4 = v5;
  }

}

- (void)failedTestWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMPerformanceTestHarness delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didFailTestHarness:withReason:", self, v4);

}

- (void)startSubtestWithName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMPerformanceTestHarness delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didStartSubtest:withName:withMetrics:", self, v4, 0);

}

- (void)startSubtestWithName:(id)a3 withMetrics:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CAMPerformanceTestHarness delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didStartSubtest:withName:withMetrics:", self, v7, v6);

}

- (void)stopSubtestWithName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMPerformanceTestHarness delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didStopSubtest:withName:", self, v4);

}

- (NSString)testName
{
  return self->_testName;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)startHandler
{
  return self->_startHandler;
}

- (void)setStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CAMPerformanceTestHarnessDelegate)delegate
{
  return (CAMPerformanceTestHarnessDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isSetupHarness
{
  return self->_isSetupHarness;
}

- (void)setIsSetupHarness:(BOOL)a3
{
  self->_isSetupHarness = a3;
}

- (BOOL)isRunningTest
{
  return self->_runningTest;
}

- (void)setRunningTest:(BOOL)a3
{
  self->_runningTest = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_startHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
