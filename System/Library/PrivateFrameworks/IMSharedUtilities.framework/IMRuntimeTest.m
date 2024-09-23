@implementation IMRuntimeTest

+ (id)logHandle
{
  if (qword_1EE503F00 != -1)
    dispatch_once(&qword_1EE503F00, &unk_1E3FB36C8);
  return (id)qword_1EE503EF8;
}

- (id)logHandle
{
  return (id)objc_msgSend((id)objc_opt_class(), "logHandle");
}

- (void)finishTest
{
  void *v3;
  void *v4;
  void (**v5)(id, void *);

  -[IMRuntimeTest tearDown](self, "tearDown");
  -[IMRuntimeTest testRun](self, "testRun");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[IMRuntimeTest completion](self, "completion");
  v5 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  -[IMRuntimeTest setCompletion:](self, "setCompletion:", 0);
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Finished test"));
  if (v5)
  {
    -[IMRuntimeTest testRun](self, "testRun");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v4);

  }
}

- (Class)testRunClass
{
  return (Class)objc_opt_class();
}

- (void)runTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Starting test"));
  -[IMRuntimeTest setCompletion:](self, "setCompletion:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(-[IMRuntimeTest testRunClass](self, "testRunClass")), "initWithTest:", self);
  -[IMRuntimeTest setTestRun:](self, "setTestRun:", v5);

  -[IMRuntimeTest setUp](self, "setUp");
  -[IMRuntimeTest testRun](self, "testRun");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "start");

  MEMORY[0x1E0DE7D20](self, sel_startTest);
}

- (id)testName
{
  return (id)objc_msgSend((id)objc_opt_class(), "testName");
}

+ (id)testName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)dispatchAfter:(double)a3 block:(id)a4
{
  dispatch_time_t v6;
  dispatch_block_t block;

  block = a4;
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Scheduling test block for %f seconds"), *(_QWORD *)&a3);
  v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);

}

- (void)finishTestAfterInterval:(double)a3
{
  _QWORD v5[5];

  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Will finish test in %f seconds"), *(_QWORD *)&a3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_19E2AA688;
  v5[3] = &unk_1E3FB6B98;
  v5[4] = self;
  -[IMRuntimeTest dispatchAfter:block:](self, "dispatchAfter:block:", v5, a3);
}

- (void)testLog:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:arguments:", v4, &v6);

  objc_msgSend((id)objc_opt_class(), "testLog:", CFSTR("%@"), v5);
}

+ (void)testLog:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v14);

  objc_msgSend(a1, "logHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "testName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "%@: %@", buf, 0x16u);

  }
}

- (IMRuntimeTestRun)testRun
{
  return (IMRuntimeTestRun *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTestRun:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)completion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_testRun, 0);
}

@end
