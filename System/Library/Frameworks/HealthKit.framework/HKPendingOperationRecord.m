@implementation HKPendingOperationRecord

+ (id)pendingOperation:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  HKPendingOperationRecord *v7;
  uint64_t v8;
  id operationHandler;
  uint64_t v10;
  id completionHandler;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HKPendingOperationRecord);
  v8 = objc_msgSend(v6, "copy");

  operationHandler = v7->_operationHandler;
  v7->_operationHandler = (id)v8;

  v10 = objc_msgSend(v5, "copy");
  completionHandler = v7->_completionHandler;
  v7->_completionHandler = (id)v10;

  return v7;
}

- (id)operationHandler
{
  return self->_operationHandler;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (int64_t)errorCount
{
  return self->_errorCount;
}

- (void)setErrorCount:(int64_t)a3
{
  self->_errorCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_operationHandler, 0);
}

@end
