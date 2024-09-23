@implementation IMRuntimeTestSuite

- (IMRuntimeTestSuite)init
{
  IMRuntimeTestSuite *v2;
  NSMutableArray *v3;
  NSMutableArray *tests;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMRuntimeTestSuite;
  v2 = -[IMRuntimeTestSuite init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tests = v2->_tests;
    v2->_tests = v3;

  }
  return v2;
}

- (void)addTest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "testName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("added test: %@"), v4);

  -[NSMutableArray addObject:](self->_tests, "addObject:", v5);
}

- (void)removeTest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "testName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("removed test: %@"), v4);

  -[NSMutableArray removeObject:](self->_tests, "removeObject:", v5);
}

- (void)startTest
{
  NSMutableArray *v3;
  NSMutableArray *runningTests;

  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("starting test suite"));
  v3 = (NSMutableArray *)-[NSMutableArray mutableCopy](self->_tests, "mutableCopy");
  runningTests = self->_runningTests;
  self->_runningTests = v3;

  MEMORY[0x1E0DE7D20](self, sel_currentTestDidFinish);
}

- (void)_cancelTimer
{
  void *v3;
  id v4;

  -[IMRuntimeTestSuite timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "invalidate");
    -[IMRuntimeTestSuite setTimer:](self, "setTimer:", 0);
    v3 = v4;
  }

}

- (void)_startNextTest
{
  IMRuntimeTest *v3;
  IMRuntimeTest *currentTest;
  void *v5;
  IMRuntimeTest *v6;
  _QWORD v7[5];

  -[NSMutableArray objectAtIndex:](self->_runningTests, "objectAtIndex:", 0);
  v3 = (IMRuntimeTest *)objc_claimAutoreleasedReturnValue();
  currentTest = self->_currentTest;
  self->_currentTest = v3;

  -[IMRuntimeTest testName](self->_currentTest, "testName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("starting next test in suite: %@"), v5);

  -[NSMutableArray removeObjectAtIndex:](self->_runningTests, "removeObjectAtIndex:", 0);
  v6 = self->_currentTest;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19E2CAA34;
  v7[3] = &unk_1E3FB79F8;
  v7[4] = self;
  -[IMRuntimeTest runTest:](v6, "runTest:", v7);
}

- (void)_timerExpired:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__startNextTest);
}

- (void)currentTestDidFinish
{
  void *v3;
  void *v4;
  id v5;

  -[IMRuntimeTest testName](self->_currentTest, "testName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("current test in test suite did finish: %@"), v3);

  if (-[NSMutableArray count](self->_tests, "count") && -[NSMutableArray count](self->_runningTests, "count"))
  {
    -[IMRuntimeTestSuite _cancelTimer](self, "_cancelTimer");
    v4 = (void *)MEMORY[0x1E0C99E88];
    -[IMRuntimeTestSuite testStartDelay](self, "testStartDelay");
    objc_msgSend(v4, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timerExpired_, 0, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[IMRuntimeTestSuite setTimer:](self, "setTimer:", v5);

  }
  else
  {
    MEMORY[0x1E0DE7D20](self, sel_finishTest);
  }
}

+ (void)runTestsIfNeededWithRepeatCount:(int64_t)a3 withCount:(int64_t)a4
{
  id v7;
  uint64_t v8;
  double v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  int64_t v15;
  int64_t v16;

  if (a4 >= a3)
  {
    objc_msgSend(a1, "testLog:", CFSTR("Not repeating tests, all done"));
  }
  else
  {
    v7 = objc_alloc_init((Class)objc_opt_class());
    objc_msgSend(v7, "testSuiteStartDelay");
    objc_msgSend(a1, "testLog:", CFSTR("running test batch %ld of %ld in %f seconds"), a4, a3, v8);
    objc_msgSend(v7, "testSuiteStartDelay");
    v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E2CAC30;
    block[3] = &unk_1E3FB7A40;
    v15 = a4;
    v16 = a3;
    v13 = v7;
    v14 = a1;
    v11 = v7;
    dispatch_after(v10, MEMORY[0x1E0C80D38], block);

  }
}

+ (void)runTestsIfNeededWithRepeatCount:(int64_t)a3
{
  MEMORY[0x1E0DE7D20](a1, sel_runTestsIfNeededWithRepeatCount_withCount_);
}

- (NSArray)tests
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)testSuiteStartDelay
{
  return self->_testSuiteStartDelay;
}

- (void)setTestSuiteStartDelay:(double)a3
{
  self->_testSuiteStartDelay = a3;
}

- (double)testStartDelay
{
  return self->_testStartDelay;
}

- (void)setTestStartDelay:(double)a3
{
  self->_testStartDelay = a3;
}

- (NSMutableArray)runningTests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRunningTests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (IMRuntimeTest)currentTest
{
  return (IMRuntimeTest *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentTest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSTimer)timer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_timer);
}

- (void)setTimer:(id)a3
{
  objc_storeWeak((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_timer);
  objc_storeStrong((id *)&self->_currentTest, 0);
  objc_storeStrong((id *)&self->_runningTests, 0);
  objc_storeStrong((id *)&self->_tests, 0);
}

@end
