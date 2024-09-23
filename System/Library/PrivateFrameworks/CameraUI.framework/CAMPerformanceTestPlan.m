@implementation CAMPerformanceTestPlan

- (CAMPerformanceTestPlan)initWithTestName:(id)a3
{
  id v4;
  CAMPerformanceTestPlan *v5;
  uint64_t v6;
  NSString *testName;
  NSMutableArray *v8;
  NSMutableArray *harnesses;
  CAMPerformanceTestPlan *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMPerformanceTestPlan;
  v5 = -[CAMPerformanceTestPlan init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    testName = v5->_testName;
    v5->_testName = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    harnesses = v5->__harnesses;
    v5->__harnesses = v8;

    v10 = v5;
  }

  return v5;
}

- (void)queueHarness:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CAMPerformanceTestPlan _harnesses](self, "_harnesses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v5, "setDelegate:", self);
}

- (void)run
{
  -[CAMPerformanceTestPlan runWithSecondsDelay:](self, "runWithSecondsDelay:", 0);
}

- (void)runWithSecondsDelay:(unint64_t)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  if (a3)
  {
    v4 = dispatch_time(0, 1000000000 * a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__CAMPerformanceTestPlan_runWithSecondsDelay___block_invoke;
    block[3] = &unk_1EA328868;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[CAMPerformanceTestPlan _runHarnessAfter:](self, "_runHarnessAfter:");
  }
}

uint64_t __46__CAMPerformanceTestPlan_runWithSecondsDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runHarnessAfter:", 0);
}

- (void)runHarness:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_msgSend(v3, "isRunningTest") & 1) == 0)
    objc_msgSend(v3, "startTesting");

}

- (void)_startTesting
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[CAMPerformanceTestPlan testName](self, "testName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startedTest:", v6);

  -[CAMPerformanceTestPlan startHandler](self, "startHandler");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t))(v4 + 16))(v4);

}

- (void)_stopTesting
{
  void *v3;
  NSString *testName;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  testName = self->_testName;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__CAMPerformanceTestPlan__stopTesting__block_invoke;
  v5[3] = &unk_1EA328868;
  v5[4] = self;
  objc_msgSend(v3, "finishedTest:extraResults:withTeardownBlock:", testName, 0, v5);

}

void __38__CAMPerformanceTestPlan__stopTesting__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "settlingDelaySeconds"))
    sleep(objc_msgSend(*(id *)(a1 + 32), "settlingDelaySeconds"));
  v2 = v3;
  if (v3)
  {
    (*((void (**)(id))v3 + 2))(v3);
    v2 = v3;
  }

}

- (void)_failedTestWithReason:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0DC3470];
  v5 = a3;
  objc_msgSend(v4, "sharedApplication");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMPerformanceTestPlan testName](self, "testName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "failedTest:withFailure:", v6, v5);

}

- (void)_runHarnessAfter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    -[CAMPerformanceTestPlan _findHarnessAfter:](self, "_findHarnessAfter:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_7;
  }
  else
  {
    -[CAMPerformanceTestPlan _harnesses](self, "_harnesses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_7;
  }
  if ((objc_msgSend(v5, "isRunningTest") & 1) == 0)
    objc_msgSend(v5, "startTesting");
LABEL_7:

}

- (id)_findHarnessAfter:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CAMPerformanceTestPlan _harnesses](self, "_harnesses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (-[CAMPerformanceTestPlan _harnesses](self, "_harnesses"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count") - 1,
        v7,
        v6 >= v8))
  {
    v10 = 0;
  }
  else
  {
    -[CAMPerformanceTestPlan _harnesses](self, "_harnesses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v6 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)startSubtestWithName:(id)a3 withMetrics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CAMPerformanceTestPlan testName](self, "testName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startedSubTest:forTest:withMetrics:", v7, v9, v6);

}

- (void)stopSubtestWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CAMPerformanceTestPlan testName](self, "testName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishedSubTest:forTest:", v4, v6);

}

- (void)willStartTestHarness:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[CAMPerformanceTestPlan _hasTriggeredTestStart](self, "_hasTriggeredTestStart")
    && (objc_msgSend(v4, "isSetupHarness") & 1) == 0)
  {
    -[CAMPerformanceTestPlan set_hasTriggeredTestStart:](self, "set_hasTriggeredTestStart:", 1);
    -[CAMPerformanceTestPlan _startTesting](self, "_startTesting");
  }
  -[CAMPerformanceTestPlan set_startedHarnesses:](self, "set_startedHarnesses:", -[CAMPerformanceTestPlan _startedHarnesses](self, "_startedHarnesses") + 1);

}

- (void)willEndTestHarness:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  id v7;

  v7 = a3;
  -[CAMPerformanceTestPlan set_completedHarnesses:](self, "set_completedHarnesses:", -[CAMPerformanceTestPlan _completedHarnesses](self, "_completedHarnesses") + 1);
  v4 = -[CAMPerformanceTestPlan _completedHarnesses](self, "_completedHarnesses");
  -[CAMPerformanceTestPlan _harnesses](self, "_harnesses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 >= v6)
  {
    if (-[CAMPerformanceTestPlan _hasTriggeredTestStart](self, "_hasTriggeredTestStart"))
      -[CAMPerformanceTestPlan _stopTesting](self, "_stopTesting");
  }
  else
  {
    -[CAMPerformanceTestPlan _runHarnessAfter:](self, "_runHarnessAfter:", v7);
  }

}

- (void)didFailTestHarness:(id)a3 withReason:(id)a4
{
  -[CAMPerformanceTestPlan _failedTestWithReason:](self, "_failedTestWithReason:", a4);
}

- (void)didStartSubtest:(id)a3 withName:(id)a4 withMetrics:(id)a5
{
  -[CAMPerformanceTestPlan startSubtestWithName:withMetrics:](self, "startSubtestWithName:withMetrics:", a4, a5);
}

- (void)didStopSubtest:(id)a3 withName:(id)a4
{
  -[CAMPerformanceTestPlan stopSubtestWithName:](self, "stopSubtestWithName:", a4);
}

- (BOOL)isRunningTest
{
  return self->_runningTest;
}

- (id)startHandler
{
  return self->_startHandler;
}

- (void)setStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)testName
{
  return self->_testName;
}

- (unsigned)settlingDelaySeconds
{
  return self->_settlingDelaySeconds;
}

- (void)setSettlingDelaySeconds:(unsigned int)a3
{
  self->_settlingDelaySeconds = a3;
}

- (NSMutableArray)_harnesses
{
  return self->__harnesses;
}

- (void)set_harnesses:(id)a3
{
  objc_storeStrong((id *)&self->__harnesses, a3);
}

- (unint64_t)_completedHarnesses
{
  return self->__completedHarnesses;
}

- (void)set_completedHarnesses:(unint64_t)a3
{
  self->__completedHarnesses = a3;
}

- (unint64_t)_startedHarnesses
{
  return self->__startedHarnesses;
}

- (void)set_startedHarnesses:(unint64_t)a3
{
  self->__startedHarnesses = a3;
}

- (BOOL)_hasTriggeredTestStart
{
  return self->__hasTriggeredTestStart;
}

- (void)set_hasTriggeredTestStart:(BOOL)a3
{
  self->__hasTriggeredTestStart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__harnesses, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_startHandler, 0);
}

@end
