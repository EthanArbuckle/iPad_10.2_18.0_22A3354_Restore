@implementation __HMFSelectorMessageHandler

- (BOOL)isEqual:(id)a3
{
  __HMFSelectorMessageHandler *v4;
  __HMFSelectorMessageHandler *v5;
  __HMFSelectorMessageHandler *v6;
  SEL *v7;
  BOOL isEqual;
  objc_super v10;

  v4 = (__HMFSelectorMessageHandler *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)__HMFSelectorMessageHandler;
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
  int v12;
  int v13;
  int v14;
  int v15;
  dispatch_qos_class_t v16;
  HMFActivity *v17;
  void (**v18)(_QWORD);
  NSObject *v19;
  NSObject *v20;
  _QWORD block[4];
  id v23;
  id v24;
  HMFActivity *v25;
  IMP v26;
  const char *v27;

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
    if (v11 == -1)
      v12 = 21;
    else
      v12 = 0;
    if (v11 <= 8)
      v13 = v12;
    else
      v13 = 9;
    if (v11 <= 16)
      v14 = v13;
    else
      v14 = 17;
    if (v11 <= 24)
      v15 = v14;
    else
      v15 = 25;
    if (v11 <= 32)
      v16 = v15;
    else
      v16 = QOS_CLASS_USER_INTERACTIVE;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49____HMFSelectorMessageHandler_invokeWithMessage___block_invoke;
    block[3] = &unk_1E3B393E0;
    v26 = MethodImplementation;
    v23 = v6;
    v27 = selector;
    v24 = v5;
    v17 = v10;
    v25 = v17;
    v18 = (void (**)(_QWORD))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v16, 0, block);
    -[__HMFMessageHandler queue](self, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      dispatch_async(v19, v18);
    else
      v18[2](v18);

    if (v17)
      -[HMFActivity end](v17, "end");

  }
  return v6 != 0;
}

- (SEL)selector
{
  return self->_selector;
}

@end
