@implementation __HMFBlockMessageHandler

- (BOOL)invokeWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMFActivity *v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  dispatch_qos_class_t v13;
  HMFActivity *v14;
  void (**v15)(_QWORD);
  NSObject *v16;
  NSObject *v17;
  _QWORD block[5];
  id v20;
  HMFActivity *v21;

  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure(CFSTR("message"));
  v5 = v4;
  -[__HMFMessageHandler receiver](self, "receiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[HMFActivity initWithName:]([HMFActivity alloc], "initWithName:", CFSTR("BlockMessage Invocation"));
    v8 = objc_msgSend(v5, "qualityOfService");
    if (v8 == -1)
      v9 = 21;
    else
      v9 = 0;
    if (v8 <= 8)
      v10 = v9;
    else
      v10 = 9;
    if (v8 <= 16)
      v11 = v10;
    else
      v11 = 17;
    if (v8 <= 24)
      v12 = v11;
    else
      v12 = 25;
    if (v8 <= 32)
      v13 = v12;
    else
      v13 = QOS_CLASS_USER_INTERACTIVE;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46____HMFBlockMessageHandler_invokeWithMessage___block_invoke;
    block[3] = &unk_1E3B38480;
    block[4] = self;
    v20 = v5;
    v14 = v7;
    v21 = v14;
    v15 = (void (**)(_QWORD))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
    -[__HMFMessageHandler queue](self, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      dispatch_async(v16, v15);
    else
      v15[2](v15);

    if (v14)
      -[HMFActivity end](v14, "end");

  }
  return v6 != 0;
}

- (id)handler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
