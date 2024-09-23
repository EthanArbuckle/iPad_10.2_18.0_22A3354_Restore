@implementation IMUnitTestRunner

- (IMUnitTestRunner)initWithLogger:(id)a3 bundleLoader:(id)a4
{
  id v7;
  id v8;
  IMUnitTestRunner *v9;
  IMUnitTestRunner *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMUnitTestRunner;
  v9 = -[IMUnitTestRunner init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logger, a3);
    objc_storeStrong((id *)&v10->_bundleLoader, a4);
  }

  return v10;
}

- (IMUnitTestRunner)initWithLogger:(id)a3 bundleLoader:(id)a4 frameworkLoader:(id)a5
{
  id v9;
  IMUnitTestRunner *v10;
  IMUnitTestRunner *v11;

  v9 = a5;
  v10 = -[IMUnitTestRunner initWithLogger:bundleLoader:](self, "initWithLogger:bundleLoader:", a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_frameworkLoader, a5);

  return v11;
}

- (IMUnitTestRunner)init
{
  IMUnitTestLogger *v3;
  IMUnitTestBundleLoader *v4;
  IMUnitTestFrameworkLoader *v5;
  IMUnitTestRunner *v6;

  v3 = objc_alloc_init(IMUnitTestLogger);
  v4 = -[IMUnitTestBundleLoader initWithLogger:]([IMUnitTestBundleLoader alloc], "initWithLogger:", v3);
  v5 = -[IMUnitTestFrameworkLoader initWithLogger:bundleLoader:]([IMUnitTestFrameworkLoader alloc], "initWithLogger:bundleLoader:", v3, v4);
  v6 = -[IMUnitTestRunner initWithLogger:bundleLoader:frameworkLoader:](self, "initWithLogger:bundleLoader:frameworkLoader:", v3, v4, v5);

  return v6;
}

- (void)testLogWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v10);

  -[IMUnitTestRunner delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[IMUnitTestRunner delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unitTestRunner:didReceiveOutput:", self, v6);
  }
  else
  {
    -[IMUnitTestRunner logger](self, "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeOutputToStdout:", v6);
  }

}

- (BOOL)_loadFrameworksIfNeeded:(id *)a3
{
  char v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  if (MEMORY[0x1A1AE7D4C](CFSTR("XCTestSuite"), CFSTR("/Developer/Library/Frameworks/XCTest.framework")))
  {
    -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("XCTest classes already loaded, no need to load frameworks..."));
    return 1;
  }
  else
  {
    -[IMUnitTestRunner frameworkLoader](self, "frameworkLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Attempting to load XCTest frameworks..."));
      -[IMUnitTestRunner frameworkLoader](self, "frameworkLoader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v5 = objc_msgSend(v7, "loadTestFrameworks:", &v10);
      v8 = v10;

      if ((v5 & 1) != 0)
      {
        -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Frameworks loaded ok..."));
      }
      else
      {
        if (!v8)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMUnitTestRunnerErrorDomain"), 1, 0);
          v8 = (id)objc_claimAutoreleasedReturnValue();
        }
        -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Failed to load test frameworks with error: %@"), v8);
        if (a3)
        {
          v8 = objc_retainAutorelease(v8);
          *a3 = v8;
        }
      }

    }
    else
    {
      -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Framework loader is nil, unable to proceed"));
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMUnitTestRunnerErrorDomain"), 1, 0);
        v5 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        return 0;
      }
    }
  }
  return v5;
}

- (id)runTestsInBundleAtPath:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  void *v32;
  char v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  id v51[3];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Starting tests for bundle at path: %@"), v6);
  v51[0] = 0;
  v7 = -[IMUnitTestRunner _loadFrameworksIfNeeded:](self, "_loadFrameworksIfNeeded:", v51);
  v8 = v51[0];
  if (v7)
  {
    v9 = (void *)MEMORY[0x1A1AE7D4C](CFSTR("XCTestSuite"), CFSTR("/Developer/Library/Frameworks/XCTest.framework"));
    v10 = MEMORY[0x1A1AE7D4C](CFSTR("XCTestObservationCenter"), CFSTR("/Developer/Library/Frameworks/XCTest.framework"));
    if (v9)
    {
      v11 = (void *)v10;
      -[IMUnitTestRunner bundleLoader](self, "bundleLoader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v8;
      v13 = objc_msgSend(v12, "loadTestBundle:bundle:error:", v6, 0, &v50);
      v14 = v50;

      if ((v13 & 1) != 0)
      {
        -[IMUnitTestRunner delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          -[IMUnitTestRunner delegate](self, "delegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "unitTestRunner:willRunTestsInBundleAtPath:", self, v6);

        }
        objc_msgSend(v9, "testSuiteForBundlePath:", v6);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45)
        {
          if (v11)
          {
            objc_msgSend(v11, "sharedTestObservationCenter");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addTestObserver:", self);

            objc_msgSend(v45, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Starting test suite %@:"), v19);

            objc_msgSend(v45, "tests");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Found %ld tests"), objc_msgSend(v20, "count"));
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            v21 = v20;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
            if (v22)
            {
              v23 = *(_QWORD *)v47;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v47 != v23)
                    objc_enumerationMutation(v21);
                  objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "name");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Test: %@"), v25);

                }
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
              }
              while (v22);
            }

            NSStringFromClass((Class)objc_msgSend(v45, "testRunClass"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("XCTestSuite testRun class: %@"), v26);

            objc_msgSend(v45, "runTest");
            objc_msgSend(v45, "testRun");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              -[IMUnitTestRunner descriptionFromResult:](self, "descriptionFromResult:", v9);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Finished tests for bundle at path: %@, with result: %@"), v6, v27);

              -[IMUnitTestRunner delegate](self, "delegate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_opt_respondsToSelector();

              if ((v29 & 1) != 0)
              {
                -[IMUnitTestRunner delegate](self, "delegate");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "unitTestRunner:didRunTestsInBundleAtPath:results:", self, v6, v9);

              }
              v31 = v9;
            }
            else
            {
              -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("XCTest suite returned a nil test run, all tests failed"));
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMUnitTestRunnerErrorDomain"), 5, 0);
              v42 = objc_claimAutoreleasedReturnValue();

              v14 = (id)v42;
            }

          }
          else
          {
            -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("XCTestObservationCenter is unavailable, all tests failed."));
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMUnitTestRunnerErrorDomain"), 2, 0);
            v9 = 0;
            v21 = v14;
            v14 = (id)objc_claimAutoreleasedReturnValue();
          }

          v35 = 1;
        }
        else
        {
          v35 = 0;
        }

LABEL_34:
        v8 = v14;
        if (!a4)
          goto LABEL_36;
        goto LABEL_35;
      }
      -[IMUnitTestRunner delegate](self, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_opt_respondsToSelector();

      if ((v40 & 1) != 0)
      {
        -[IMUnitTestRunner delegate](self, "delegate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "unitTestRunner:runningTestsInBundleAtPath:failedWithError:", self, v6, v14);

      }
    }
    else
    {
      -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("XCTest classes not found, tests will not be run"));
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMUnitTestRunnerErrorDomain"), 2, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      -[IMUnitTestRunner delegate](self, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_opt_respondsToSelector();

      if ((v37 & 1) != 0)
      {
        -[IMUnitTestRunner delegate](self, "delegate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "unitTestRunner:runningTestsInBundleAtPath:failedWithError:", self, v6, v14);

      }
    }
    v9 = 0;
    v35 = 1;
    goto LABEL_34;
  }
  -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Unable to run tests at path: %@"), v6);
  -[IMUnitTestRunner delegate](self, "delegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_opt_respondsToSelector();

  if ((v33 & 1) != 0)
  {
    -[IMUnitTestRunner delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "unitTestRunner:runningTestsInBundleAtPath:failedWithError:", self, v6, v8);

  }
  v9 = 0;
  v35 = 1;
  if (a4)
LABEL_35:
    *a4 = objc_retainAutorelease(v8);
LABEL_36:
  if ((v35 | 2) == 2)
    v43 = 0;
  else
    v43 = v9;

  return v43;
}

- (void)logBanner:(id)a3
{
  -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("------ [ %@ ] ------------------------------------------------\n"), a3);
}

- (int64_t)runTestsInBundleAtPath:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int64_t v13;
  id v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  -[IMUnitTestRunner runTestsInBundleAtPath:error:](self, "runTestsInBundleAtPath:error:", a3, &v22);
  v4 = objc_claimAutoreleasedReturnValue();
  v15 = v22;
  -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", &stru_1E3FBBA48);
  -[IMUnitTestRunner logBanner:](self, "logBanner:", CFSTR("Messages Test Results"));
  v16 = (void *)v4;
  -[IMUnitTestRunner descriptionFromResult:](self, "descriptionFromResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("%@"), v5);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[IMUnitTestRunner failedTests](self, "failedTests");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failure #%ld"), v8 + v10 + 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMUnitTestRunner logBanner:](self, "logBanner:", v12);

        -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("%@\n"), v11);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      v8 += v10;
    }
    while (v7);
  }

  v13 = objc_msgSend(v16, "totalFailureCount");
  return v13;
}

- (id)pathToPluginBundle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("/Contents/Plugins/"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingPathComponent:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)runTestsInBundleNamed:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[IMUnitTestRunner pathToPluginBundle:](self, "pathToPluginBundle:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMUnitTestRunner runTestsInBundleAtPath:error:](self, "runTestsInBundleAtPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dateFormatter
{
  if (qword_1EE503ED0 != -1)
    dispatch_once(&qword_1EE503ED0, &unk_1E3FB3648);
  return (id)qword_1EE503EC8;
}

- (id)descriptionFromResult:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v20;

  if (a3)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    v4 = a3;
    if (objc_msgSend(v4, "hasSucceeded"))
      v5 = "passed";
    else
      v5 = "failed";
    -[IMUnitTestRunner dateFormatter](self, "dateFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "executionCount");
    v10 = "";
    if (objc_msgSend(v4, "executionCount") == 1)
      v11 = "";
    else
      v11 = "s";
    v12 = objc_msgSend(v4, "totalFailureCount");
    if (objc_msgSend(v4, "totalFailureCount") != 1)
      v10 = "s";
    v13 = objc_msgSend(v4, "unexpectedExceptionCount");
    objc_msgSend(v4, "testDuration");
    v15 = v14;
    objc_msgSend(v4, "totalDuration");
    v17 = v16;

    objc_msgSend(v20, "stringWithFormat:", CFSTR("Tests %s at %@.\n\t Executed %lu test%s, with %lu failure%s (%lu unexpected) in %.3f (%.3f) seconds\n"), v5, v8, v9, v11, v12, v10, v13, v15, v17);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = CFSTR("*** TESTS FAILED: No results to report on (XCTestResult is nil)...");
  }
  return v18;
}

- (void)testSuiteWillStart:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMUnitTestRunner dateFormatter](self, "dateFormatter");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Test Suite '%@' started at %@\n"), v4, v7);

  -[IMUnitTestRunner delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[IMUnitTestRunner delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unitTestRunner:testSuiteWillStart:", self, v10);

  }
}

- (void)testSuite:(id)a3 didFailWithDescription:(id)a4 inFile:(id)a5 atLine:(unint64_t)a6
{
  id v10;
  const __CFString *v11;
  __CFString *v12;
  void *v13;
  const __CFString *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  NSMutableArray *failedTests;
  NSMutableArray *v19;
  NSMutableArray *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v10 = a4;
  v11 = (const __CFString *)a5;
  v12 = (__CFString *)v11;
  v13 = (void *)MEMORY[0x1E0CB3940];
  if (v11)
    v14 = v11;
  else
    v14 = CFSTR("<unknown>");
  if (v11)
    v15 = a6;
  else
    v15 = 0;
  objc_msgSend(v25, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@:%lu: error: %@ : %@\n"), v14, v15, v16, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  failedTests = self->_failedTests;
  if (!failedTests)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v20 = self->_failedTests;
    self->_failedTests = v19;

    failedTests = self->_failedTests;
  }
  -[NSMutableArray addObject:](failedTests, "addObject:", v17);
  -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("%@"), v17);
  -[IMUnitTestRunner delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    -[IMUnitTestRunner delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "unitTestRunner:testSuite:didFailWithDescription:inFile:atLine:", self, v24, v10, v12, a6);

  }
}

- (void)testSuiteDidFinish:(id)a3
{
  void *v4;
  int v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "testRun");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSucceeded");
  v6 = "failed";
  if (v5)
    v6 = "passed";
  v22 = v6;
  -[IMUnitTestRunner dateFormatter](self, "dateFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "executionCount");
  v11 = "";
  if (objc_msgSend(v4, "executionCount") == 1)
    v12 = "";
  else
    v12 = "s";
  v13 = objc_msgSend(v4, "totalFailureCount");
  if (objc_msgSend(v4, "totalFailureCount") != 1)
    v11 = "s";
  v14 = objc_msgSend(v4, "unexpectedExceptionCount");
  objc_msgSend(v4, "testDuration");
  v16 = v15;
  objc_msgSend(v4, "totalDuration");
  -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Test Suite '%@' %s at %@.\n\t Executed %lu test%s, with %lu failure%s (%lu unexpected) in %.3f (%.3f) seconds\n"), v23, v22, v9, v10, v12, v13, v11, v14, v16, v17);

  -[IMUnitTestRunner delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[IMUnitTestRunner delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unitTestRunner:testSuiteDidFinish:withResult:", self, v21, v4);

  }
}

- (void)testCaseWillStart:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Test Case '%@' started.\n"), v4);

  -[IMUnitTestRunner delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[IMUnitTestRunner delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unitTestRunner:testCaseWillStart:", self, v8);

  }
}

- (void)testCase:(id)a3 didFailWithDescription:(id)a4 inFile:(id)a5 atLine:(unint64_t)a6
{
  id v10;
  const __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v10 = a4;
  v11 = (const __CFString *)a5;
  v12 = (__CFString *)v11;
  if (v11)
    v13 = v11;
  else
    v13 = CFSTR("<unknown>");
  if (v11)
    v14 = a6;
  else
    v14 = 0;
  objc_msgSend(v20, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("%@:%lu: error: %@ : %@\n"), v13, v14, v15, v10);

  -[IMUnitTestRunner delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[IMUnitTestRunner delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unitTestRunner:testCase:didFailWithDescription:inFile:atLine:", self, v19, v10, v12, a6);

  }
}

- (void)testCaseDidFinish:(id)a3
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "testRun");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasSucceeded"))
    v6 = "passed";
  else
    v6 = "failed";
  objc_msgSend(v4, "totalDuration");
  -[IMUnitTestRunner testLogWithFormat:](self, "testLogWithFormat:", CFSTR("Test Case '%@' %s (%.3f seconds).\n"), v5, v6, v7);

  -[IMUnitTestRunner delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[IMUnitTestRunner delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unitTestRunner:testCaseDidFinish:withResult:", self, v11, v4);

  }
}

- (void)log:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v8);

  -[IMUnitTestRunner logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeOutputToStdout:", v6);

}

- (NSArray)failedTests
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (IMUnitTestRunnerDelegate)delegate
{
  return (IMUnitTestRunnerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IMUnitTestBundleLoader)bundleLoader
{
  return (IMUnitTestBundleLoader *)objc_getProperty(self, a2, 24, 1);
}

- (IMUnitTestLogger)logger
{
  return (IMUnitTestLogger *)objc_getProperty(self, a2, 32, 1);
}

- (IMUnitTestFrameworkLoader)frameworkLoader
{
  return (IMUnitTestFrameworkLoader *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkLoader, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_bundleLoader, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_failedTests, 0);
}

@end
