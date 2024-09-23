@implementation FMPromise

- (FMPromise)init
{
  FMFuture *v3;
  FMPromise *v4;

  v3 = objc_alloc_init(FMFuture);
  v4 = -[FMPromise initWithFuture:](self, "initWithFuture:", v3);

  return v4;
}

- (FMPromise)initWithFuture:(id)a3
{
  id v5;
  FMPromise *v6;
  FMPromise *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMPromise;
  v6 = -[FMPromise init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_future, a3);

  return v7;
}

- (NSString)descriptor
{
  return -[FMFuture descriptor](self->_future, "descriptor");
}

- (void)setDescriptor:(id)a3
{
  -[FMFuture setDescriptor:](self->_future, "setDescriptor:", a3);
}

- (BOOL)finishWithResult:(id)a3
{
  return -[FMFuture finishWithResult:](self->_future, "finishWithResult:", a3);
}

- (BOOL)finishWithError:(id)a3
{
  return -[FMFuture finishWithError:](self->_future, "finishWithError:", a3);
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  return -[FMFuture finishWithResult:error:](self->_future, "finishWithResult:error:", a3, a4);
}

- (BOOL)finishWithNoResult
{
  return -[FMFuture finishWithNoResult](self->_future, "finishWithNoResult");
}

- (id)completionHandlerAdapter
{
  return -[FMFuture completionHandlerAdapter](self->_future, "completionHandlerAdapter");
}

- (id)errorOnlyCompletionHandlerAdapter
{
  return -[FMFuture errorOnlyCompletionHandlerAdapter](self->_future, "errorOnlyCompletionHandlerAdapter");
}

- (FMFuture)future
{
  return (FMFuture *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
}

@end
