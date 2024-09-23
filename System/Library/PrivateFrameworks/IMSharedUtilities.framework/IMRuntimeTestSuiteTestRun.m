@implementation IMRuntimeTestSuiteTestRun

- (IMRuntimeTestSuiteTestRun)init
{
  IMRuntimeTestSuiteTestRun *v2;
  NSMutableArray *v3;
  NSMutableArray *testRuns;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMRuntimeTestSuiteTestRun;
  v2 = -[IMRuntimeTestSuiteTestRun init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    testRuns = v2->_testRuns;
    v2->_testRuns = v3;

  }
  return v2;
}

- (void)addTestRun:(id)a3
{
  -[NSMutableArray addObject:](self->_testRuns, "addObject:", a3);
}

- (NSArray)testRuns
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testRun, 0);
  objc_storeStrong((id *)&self->_testRuns, 0);
}

@end
