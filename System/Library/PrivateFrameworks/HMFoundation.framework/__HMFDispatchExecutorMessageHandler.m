@implementation __HMFDispatchExecutorMessageHandler

- (BOOL)isEqual:(id)a3
{
  __HMFDispatchExecutorMessageHandler *v4;
  __HMFDispatchExecutorMessageHandler *v5;
  __HMFDispatchExecutorMessageHandler *v6;
  SEL *v7;
  BOOL isEqual;
  objc_super v10;

  v4 = (__HMFDispatchExecutorMessageHandler *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)__HMFDispatchExecutorMessageHandler;
    if (-[__HMFMessageHandler isEqual:](&v10, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (v7)
        isEqual = sel_isEqual(self->_selector, v7[5]);
      else
        isEqual = 1;

    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
}

- (BOOL)invokeWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const char *selector;
  objc_class *v8;
  IMP MethodImplementation;
  HMFActivity *v10;
  uint64_t v11;
  dispatch_qos_class_t v12;
  void *v13;
  HMFActivity *v14;
  dispatch_block_t v15;
  _QWORD block[4];
  id v18;
  id v19;
  HMFActivity *v20;
  IMP v21;
  const char *v22;

  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure(CFSTR("message"));
  v5 = v4;
  -[__HMFMessageHandler receiver](self, "receiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    selector = self->_selector;
    v8 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v8, selector);
    v10 = -[HMFActivity initWithName:]([HMFActivity alloc], "initWithName:", CFSTR("SelectorMessage Invocation"));
    v11 = objc_msgSend(v5, "qualityOfService");
    if (v11 <= 32)
    {
      if (v11 <= 24)
      {
        if (v11 <= 16)
        {
          if (v11 <= 8)
          {
            if (v11 == -1)
              v12 = QOS_CLASS_DEFAULT;
            else
              v12 = QOS_CLASS_UNSPECIFIED;
          }
          else
          {
            v12 = QOS_CLASS_BACKGROUND;
          }
        }
        else
        {
          v12 = QOS_CLASS_UTILITY;
        }
      }
      else
      {
        v12 = QOS_CLASS_USER_INITIATED;
      }
    }
    else
    {
      v12 = QOS_CLASS_USER_INTERACTIVE;
    }
    objc_msgSend(v6, "dispatchContextForMessage:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57____HMFDispatchExecutorMessageHandler_invokeWithMessage___block_invoke;
    block[3] = &unk_1E3B393E0;
    v21 = MethodImplementation;
    v18 = v6;
    v22 = selector;
    v19 = v5;
    v14 = v10;
    v20 = v14;
    v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v12, 0, block);
    objc_msgSend(v13, "performBlock:", v15);

    if (v14)
      -[HMFActivity end](v14, "end");

  }
  return v6 != 0;
}

- (SEL)selector
{
  return self->_selector;
}

@end
