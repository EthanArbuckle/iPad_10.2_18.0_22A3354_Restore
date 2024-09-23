@implementation CNInhibitor

- (void)setDebugIsInhibiting:(BOOL)a3
{
  self->_debugIsInhibiting = a3;
}

- (void)start
{
  -[CNInhibitor setDebugIsInhibiting:](self, "setDebugIsInhibiting:", 1);
}

- (void)stop
{
  -[CNInhibitor setDebugIsInhibiting:](self, "setDebugIsInhibiting:", 0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CNInhibitor;
  -[CNInhibitor dealloc](&v2, sel_dealloc);
}

+ (id)os_transactionInhibitorWithLabel:(id)a3
{
  id v3;
  _CNOSTransactionInhibitor *v4;

  v3 = a3;
  v4 = -[_CNOSTransactionInhibitor initWithLabel:]([_CNOSTransactionInhibitor alloc], "initWithLabel:", v3);

  return v4;
}

+ (id)suddenTerminationInhibitor
{
  return objc_alloc_init(_CNSuddenTerminationInhibitor);
}

+ (id)suddenTerminationInhibitorWithProcessInfo:(id)a3
{
  id v3;
  _CNSuddenTerminationInhibitor *v4;

  v3 = a3;
  v4 = -[_CNSuddenTerminationInhibitor initWithProcessInfo:]([_CNSuddenTerminationInhibitor alloc], "initWithProcessInfo:", v3);

  return v4;
}

+ (id)runningboardInhibitorWithExplanation:(id)a3
{
  id v3;
  _CNRunningBoardInhibitor *v4;

  v3 = a3;
  v4 = -[_CNRunningBoardInhibitor initWithExplanation:]([_CNRunningBoardInhibitor alloc], "initWithExplanation:", v3);

  return v4;
}

- (BOOL)debugIsInhibiting
{
  return self->_debugIsInhibiting;
}

@end
