@implementation HKFetchOperation

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
  -[HKFetchOperation _alertDelegateDidUpdatePriority](self, "_alertDelegateDidUpdatePriority");
}

- (void)_alertDelegateDidUpdatePriority
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "fetchOperationDidUpdatePriority:", self);

}

- (double)executionTime
{
  return self->_executionTime;
}

- (HKFetchOperationDelegate)_delegate
{
  return (HKFetchOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (void)setQueueTime:(double)a3
{
  self->_queueTime = a3;
}

- (void)setExecutionTime:(double)a3
{
  self->_executionTime = a3;
}

- (double)queueTime
{
  return self->_queueTime;
}

- (HKFetchOperation)initWithOperationDescription:(id)a3
{
  id v5;
  HKFetchOperation *v6;
  uint64_t v7;
  NSUUID *UUID;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKFetchOperation;
  v6 = -[HKFetchOperation init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

    v6->_highPriority = 0;
    objc_storeStrong((id *)&v6->_operationDescription, a3);
    v6->_queueTime = 0.0;
    v6->_executionTime = 0.0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operationDescription, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)operationDescription
{
  return self->_operationDescription;
}

- (void)startOperationWithCompletion:(id)a3
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_12();
}

- (void)stopOperation
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_12();
}

@end
