@implementation IMRuntimeTestRun

- (IMRuntimeTestRun)initWithTest:(id)a3
{
  id v5;
  IMRuntimeTestRun *v6;
  IMRuntimeTestRun *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMRuntimeTestRun;
  v6 = -[IMRuntimeTestRun init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_test, a3);

  return v7;
}

- (void)recordFailureWithDescription:(id)a3 inFile:(id)a4 atLine:(unint64_t)a5 expected:(BOOL)a6
{
  MEMORY[0x1E0DE7D20](self, sel_setSucceeded_);
}

- (IMRuntimeTest)test
{
  return (IMRuntimeTest *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)hasSucceeded
{
  return self->_succeeded;
}

- (void)setSucceeded:(BOOL)a3
{
  self->_succeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_test, 0);
}

@end
