@implementation __HMDRequestedCapabilitiesContext

- (__HMDRequestedCapabilitiesContext)initWithTransactionID:(id)a3 requestedCapabilities:(id)a4 destinationAddress:(id)a5 responseQueue:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  __HMDRequestedCapabilitiesContext *v17;
  __HMDRequestedCapabilitiesContext *v18;
  void *v19;
  id completionHandler;
  NSMutableArray *v21;
  NSMutableArray *receivedResponses;
  id v24;
  objc_super v25;

  v24 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)__HMDRequestedCapabilitiesContext;
  v17 = -[__HMDRequestedCapabilitiesContext init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_transactionID, a3);
    objc_storeStrong((id *)&v18->_requestedCapabilities, a4);
    objc_storeStrong((id *)&v18->_destinationAddress, a5);
    objc_storeStrong((id *)&v18->_responseQueue, a6);
    v19 = _Block_copy(v16);
    completionHandler = v18->_completionHandler;
    v18->_completionHandler = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    receivedResponses = v18->_receivedResponses;
    v18->_receivedResponses = v21;

  }
  return v18;
}

- (NSUUID)transactionID
{
  return self->_transactionID;
}

- (NSDictionary)requestedCapabilities
{
  return self->_requestedCapabilities;
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSMutableArray)receivedResponses
{
  return self->_receivedResponses;
}

- (HMFTimerManagerTimerContext)timerContext
{
  return self->_timerContext;
}

- (void)setTimerContext:(id)a3
{
  objc_storeStrong((id *)&self->_timerContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerContext, 0);
  objc_storeStrong((id *)&self->_receivedResponses, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_requestedCapabilities, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
}

@end
