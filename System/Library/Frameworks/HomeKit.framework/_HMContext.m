@implementation _HMContext

- (HMDelegateCaller)delegateCaller
{
  return self->_delegateCaller;
}

- (HMPendingRequests)pendingRequests
{
  return self->_pendingRequests;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (HMXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (_HMContext)initWithName:(id)a3
{
  id v4;
  HMMutableXPCMessageTransportConfiguration *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  _HMContext *v10;

  v4 = a3;
  v5 = -[HMXPCMessageTransportConfiguration initWithMachServiceName:]([HMMutableXPCMessageTransportConfiguration alloc], "initWithMachServiceName:", CFSTR("com.apple.homed.xpc"));
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create(v7, v8);
  -[HMXPCMessageTransportConfiguration setQueue:](v5, "setQueue:", v9);

  v10 = -[_HMContext initWithXPCClientConfiguration:](self, "initWithXPCClientConfiguration:", v5);
  return v10;
}

- (_HMContext)initWithXPCClientConfiguration:(id)a3
{
  id v4;
  HMXPCClient *v5;
  HMDelegateCaller *v6;
  _HMContext *v7;

  v4 = a3;
  v5 = -[HMXPCClient initWithConfiguration:]([HMXPCClient alloc], "initWithConfiguration:", v4);

  v6 = -[HMDelegateCaller initWithQueue:]([HMDelegateCaller alloc], "initWithQueue:", 0);
  v7 = -[_HMContext initWithXPCClient:delegateCaller:](self, "initWithXPCClient:delegateCaller:", v5, v6);

  return v7;
}

- (_HMContext)initWithXPCClient:(id)a3 delegateCaller:(id)a4
{
  id v6;
  id v7;
  HMPendingRequests *v8;
  void *v9;
  _HMContext *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMPendingRequests);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285E0]), "initWithTransport:", v7);
  v10 = -[_HMContext initWithXPCClient:delegateCaller:messageDispatcher:pendingRequests:](self, "initWithXPCClient:delegateCaller:messageDispatcher:pendingRequests:", v7, v6, v9, v8);

  return v10;
}

- (_HMContext)initWithXPCClient:(id)a3 delegateCaller:(id)a4 messageDispatcher:(id)a5 pendingRequests:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _HMContext *v16;
  _HMContext *v17;
  void *v18;
  uint64_t v19;
  OS_dispatch_queue *queue;
  _HMContext *result;
  _HMContext *v22;
  SEL v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v22 = (_HMContext *)_HMFPreconditionFailure();
    -[_HMContext .cxx_destruct](v22, v23);
    return result;
  }
  v24.receiver = self;
  v24.super_class = (Class)_HMContext;
  v16 = -[_HMContext init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_xpcClient, a3);
    objc_storeStrong((id *)&v17->_delegateCaller, a4);
    objc_storeStrong((id *)&v17->_messageDispatcher, a5);
    objc_storeStrong((id *)&v17->_pendingRequests, a6);
    objc_msgSend(v11, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v19;

  }
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_delegateCaller, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)sendMessage:(void *)a3 target:(void *)a4 payload:(void *)a5 responseHandler:
{
  id v9;
  void *v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v9 = a5;
  if (a1)
  {
    v10 = (void *)MEMORY[0x1E0D285F8];
    v11 = (objc_class *)MEMORY[0x1E0D285D8];
    v12 = a4;
    v13 = a3;
    v14 = a2;
    v15 = (void *)objc_msgSend([v11 alloc], "initWithTarget:", v13);

    objc_msgSend(v10, "messageWithName:destination:payload:", v14, v15, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __70___HMContext_Convenience__sendMessage_target_payload_responseHandler___block_invoke;
    v22[3] = &unk_1E3AB59B8;
    v22[4] = a1;
    v18 = v9;
    v23 = v18;
    objc_msgSend(v16, "setResponseHandler:", v22);
    objc_msgSend(a1, "messageDispatcher");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __70___HMContext_Convenience__sendMessage_target_payload_responseHandler___block_invoke_3;
    v20[3] = &unk_1E3AB5380;
    v20[4] = a1;
    v21 = v18;
    objc_msgSend(v19, "sendMessage:completionHandler:", v16, v20);

  }
}

@end
