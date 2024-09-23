@implementation AOSContext

+ (id)contextWithAccount:(AOSAccount *)a3 andTransaction:(AOSTransactionC *)a4
{
  AOSContext *v6;
  AOSContext *v7;

  v6 = objc_alloc_init(AOSContext);
  v7 = v6;
  if (v6)
  {
    -[AOSContext setAccount:](v6, "setAccount:", a3);
    -[AOSContext setTransaction:](v7, "setTransaction:", a4);
  }
  return v7;
}

- (AOSContext)init
{
  AOSContext *v2;
  NSThread *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AOSContext;
  v2 = -[AOSContext init](&v5, sel_init);
  if (v2)
  {
    v3 = (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v2->_callbackThread = v3;
    if (v3)
      CFRetain(v3);
  }
  return v2;
}

- (void)dealloc
{
  AOSAccount *account;
  AOSTransactionC *transaction;
  id info;
  NSThread *callbackThread;
  objc_super v7;

  account = self->_account;
  if (account)
  {
    CFRelease(account);
    self->_account = 0;
  }
  transaction = self->_transaction;
  if (transaction)
  {
    CFRelease(transaction);
    self->_transaction = 0;
  }
  info = self->_info;
  if (info)
  {
    CFRelease(info);
    self->_info = 0;
  }
  callbackThread = self->_callbackThread;
  if (callbackThread)
  {
    CFRelease(callbackThread);
    self->_callbackThread = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)AOSContext;
  -[AOSContext dealloc](&v7, sel_dealloc);
}

- (void)finalize
{
  AOSAccount *account;
  AOSTransactionC *transaction;
  id info;
  NSThread *callbackThread;
  objc_super v7;

  account = self->_account;
  if (account)
  {
    CFRelease(account);
    self->_account = 0;
  }
  transaction = self->_transaction;
  if (transaction)
  {
    CFRelease(transaction);
    self->_transaction = 0;
  }
  info = self->_info;
  if (info)
  {
    CFRelease(info);
    self->_info = 0;
  }
  callbackThread = self->_callbackThread;
  if (callbackThread)
  {
    CFRelease(callbackThread);
    self->_callbackThread = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)AOSContext;
  -[AOSContext finalize](&v7, sel_finalize);
}

- (void)setAccount:(AOSAccount *)a3
{
  AOSAccount *account;
  AOSAccount *v6;

  account = self->_account;
  if (account != a3)
  {
    if (account)
      CFRelease(account);
    if (a3)
      v6 = (AOSAccount *)CFRetain(a3);
    else
      v6 = 0;
    self->_account = v6;
  }
}

- (AOSAccount)account
{
  return self->_account;
}

- (void)setTransaction:(AOSTransactionC *)a3
{
  AOSTransactionC *transaction;
  AOSTransactionC *v6;

  transaction = self->_transaction;
  if (transaction != a3)
  {
    if (transaction)
      CFRelease(transaction);
    if (a3)
      v6 = (AOSTransactionC *)CFRetain(a3);
    else
      v6 = 0;
    self->_transaction = v6;
  }
}

- (AOSTransactionC)transaction
{
  return self->_transaction;
}

- (void)setInfo:(id)a3
{
  id info;
  void *v6;

  info = self->_info;
  if (info != a3)
  {
    if (info)
      CFRelease(info);
    if (a3)
      v6 = (void *)CFRetain(a3);
    else
      v6 = 0;
    self->_info = v6;
  }
}

- (id)info
{
  return self->_info;
}

- (BOOL)scheduleCallback
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t CallbackFunction;
  uint64_t CallbackBlock;
  NSObject *CallbackQueue;
  _QWORD *v9;
  uint64_t v10;
  _QWORD block[6];
  _QWORD v13[6];

  if (self)
  {
    v2 = (void *)CFRetain(self);
    if (v2)
    {
      v3 = v2;
      v4 = objc_msgSend(v2, "transaction");
      v5 = v4;
      if (!v4)
      {
LABEL_16:
        CFRelease(v3);
        return v5;
      }
      CallbackFunction = AOSTransactionGetCallbackFunction(v4);
      CallbackBlock = AOSTransactionGetCallbackBlock(v5);
      CallbackQueue = AOSTransactionGetCallbackQueue(v5);
      if (CallbackBlock && CallbackQueue)
      {
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __30__AOSContext_scheduleCallback__block_invoke;
        v13[3] = &unk_24F28BA10;
        v13[4] = CallbackBlock;
        v13[5] = v5;
        v9 = v13;
LABEL_11:
        dispatch_async(CallbackQueue, v9);
LABEL_12:
        LOBYTE(v5) = 1;
        goto LABEL_16;
      }
      if (CallbackFunction)
      {
        if (CallbackQueue)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __30__AOSContext_scheduleCallback__block_invoke_2;
          block[3] = &__block_descriptor_48_e5_v8__0l;
          block[4] = CallbackFunction;
          block[5] = v5;
          v9 = block;
          goto LABEL_11;
        }
        v10 = objc_msgSend(v3, "_callbackThread");
        if (v10)
        {
          objc_msgSend(v3, "performSelector:onThread:withObject:waitUntilDone:", sel__performCallback, v10, 0, 0);
          goto LABEL_12;
        }
      }
      LOBYTE(v5) = 0;
      goto LABEL_16;
    }
  }
  LOBYTE(v5) = 0;
  return v5;
}

uint64_t __30__AOSContext_scheduleCallback__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __30__AOSContext_scheduleCallback__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

- (id)_callbackThread
{
  return self->_callbackThread;
}

- (void)_performCallback
{
  AOSTransactionC *v3;
  AOSTransactionC *v4;
  void (*CallbackFunction)(AOSTransactionC *);

  v3 = -[AOSContext transaction](self, "transaction");
  if (v3)
  {
    v4 = v3;
    CallbackFunction = (void (*)(AOSTransactionC *))AOSTransactionGetCallbackFunction((uint64_t)v3);
    if (CallbackFunction)
      CallbackFunction(v4);
  }
  if (self)
    CFRelease(self);
}

@end
