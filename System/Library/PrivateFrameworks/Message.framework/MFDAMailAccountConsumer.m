@implementation MFDAMailAccountConsumer

- (MFDAMailAccountConsumer)init
{
  return -[MFDAMailAccountConsumer initWithAlwaysReportFailures:](self, "initWithAlwaysReportFailures:", 0);
}

- (MFDAMailAccountConsumer)initWithAlwaysReportFailures:(BOOL)a3
{
  MFDAMailAccountConsumer *v4;
  uint64_t v5;
  NSConditionLock *doneCondition;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFDAMailAccountConsumer;
  v4 = -[MFDAMailAccountConsumer init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D46070]), "initWithName:condition:andDelegate:", CFSTR("MFDAMailAccountConsumer_doneCondition"), 0, v4);
    doneCondition = v4->_doneCondition;
    v4->_doneCondition = (NSConditionLock *)v5;

    v4->_alwaysReportFailures = a3;
  }
  return v4;
}

- (void)setDone:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[NSConditionLock lock](self->_doneCondition, "lock");
  -[NSConditionLock unlockWithCondition:](self->_doneCondition, "unlockWithCondition:", v3);
}

- (BOOL)waitUntilDoneBeforeDate:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  ECAssertNetworkActivityAllowed();
  v5 = -[NSConditionLock lockWhenCondition:beforeDate:](self->_doneCondition, "lockWhenCondition:beforeDate:", 1, v4);
  if (v5)
    -[NSConditionLock unlock](self->_doneCondition, "unlock");

  return v5;
}

- (void)waitUntilDone
{
  ECAssertNetworkActivityAllowed();
  -[NSConditionLock lockWhenCondition:](self->_doneCondition, "lockWhenCondition:", 1);
  -[NSConditionLock unlock](self->_doneCondition, "unlock");
}

- (void)actionFailed:(int64_t)a3 forTask:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  int64_t v10;
  BOOL v11;
  id v12;
  int64_t v13;

  v13 = a3;
  v7 = a4;
  v8 = a5;
  v12 = v8;
  MFWalkUpDAErrorChain(&v12, &v13);
  v9 = v12;

  v10 = v13;
  v11 = (unint64_t)(v13 + 1) > 8 || ((1 << (v13 + 1)) & 0x103) == 0;
  if (v11
    || (-[NSConditionLock lock](self->_doneCondition, "lock"),
        self->_shouldRetryRequest = 1,
        -[NSConditionLock unlock](self->_doneCondition, "unlock"),
        self->_alwaysReportFailures))
  {
    -[MFDAMailAccountConsumer taskFailed:statusCode:error:](self, "taskFailed:statusCode:error:", v7, v10, v9);
  }
  -[MFDAMailAccountConsumer setDone:](self, "setDone:", 1);

}

- (BOOL)shouldRetryRequest
{
  BOOL shouldRetryRequest;

  -[NSConditionLock lock](self->_doneCondition, "lock");
  shouldRetryRequest = self->_shouldRetryRequest;
  -[NSConditionLock unlock](self->_doneCondition, "unlock");
  return shouldRetryRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneCondition, 0);
}

@end
