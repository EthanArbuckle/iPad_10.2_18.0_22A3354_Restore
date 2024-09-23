@implementation CATOperation(Timeout)

- (CRKTimeoutHarnessOperation)crk_operationWithTimeout:()Timeout
{
  CRKTimeoutHarnessOperation *v4;
  void *v5;
  CRKTimeoutHarnessOperation *v6;

  v4 = [CRKTimeoutHarnessOperation alloc];
  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKTimeoutHarnessOperation initWithOperationQueue:operation:timout:](v4, "initWithOperationQueue:operation:timout:", v5, a1, a2);

  return v6;
}

- (CRKTimeoutHarnessOperation)crk_timingOutOperationWithTimerPrimitives:()Timeout operationQueue:timerIdentifier:timeout:
{
  id v10;
  id v11;
  id v12;
  CRKTimeoutHarnessOperation *v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = -[CRKTimeoutHarnessOperation initWithTimerPrimitives:operationQueue:operation:timerIdentifier:timeout:]([CRKTimeoutHarnessOperation alloc], "initWithTimerPrimitives:operationQueue:operation:timerIdentifier:timeout:", v12, v11, a1, v10, a2);

  return v13;
}

@end
