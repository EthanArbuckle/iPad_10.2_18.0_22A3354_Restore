@implementation AOSTransaction

- (AOSTransaction)init
{
  AOSTransaction *v2;
  AOSTransaction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AOSTransaction;
  v2 = -[AOSTransaction init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->didSucceed = 0;
    *(_OWORD *)&v2->result = 0u;
    *(_OWORD *)&v2->callbackFunction = 0u;
    *(_OWORD *)&v2->callbackQueue = 0u;
    v2->contextRetain = 0;
    v2->contextRelease = 0;
    v2->waitLock = (NSConditionLock *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
  }
  return v3;
}

- (void)dealloc
{
  void *result;
  __CFError *error;
  NSConditionLock *waitLock;
  void (*contextRelease)(void);
  id callbackBlock;
  id v8;
  NSObject *callbackQueue;
  objc_super v10;

  objc_sync_enter(self);
  result = self->result;
  if (result)
  {
    CFRelease(result);
    self->result = 0;
  }
  error = self->error;
  if (error)
  {
    CFRelease(error);
    self->error = 0;
  }
  waitLock = self->waitLock;
  if (waitLock)
  {
    CFRelease(waitLock);
    self->waitLock = 0;
  }
  if (self->context)
  {
    contextRelease = (void (*)(void))self->contextRelease;
    if (contextRelease)
    {
      contextRelease();
      self->context = 0;
    }
  }
  callbackBlock = self->callbackBlock;
  if (callbackBlock)
  {
    CFRelease(callbackBlock);
    v8 = self->callbackBlock;
  }
  else
  {
    v8 = 0;
  }

  self->callbackBlock = 0;
  callbackQueue = self->callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->callbackQueue = 0;
  }
  objc_sync_exit(self);
  v10.receiver = self;
  v10.super_class = (Class)AOSTransaction;
  -[AOSTransaction dealloc](&v10, sel_dealloc);
}

- (void)finalize
{
  void (*contextRelease)(void);
  id callbackBlock;
  id v5;
  NSObject *callbackQueue;
  objc_super v7;

  objc_sync_enter(self);
  if (self->context)
  {
    contextRelease = (void (*)(void))self->contextRelease;
    if (contextRelease)
    {
      contextRelease();
      self->context = 0;
    }
  }
  callbackBlock = self->callbackBlock;
  if (callbackBlock)
  {
    CFRelease(callbackBlock);
    v5 = self->callbackBlock;
  }
  else
  {
    v5 = 0;
  }

  self->callbackBlock = 0;
  callbackQueue = self->callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->callbackQueue = 0;
  }
  objc_sync_exit(self);
  v7.receiver = self;
  v7.super_class = (Class)AOSTransaction;
  -[AOSTransaction finalize](&v7, sel_finalize);
}

- (BOOL)isSuccessful
{
  return self->didSucceed != 0;
}

- (id)result
{
  return self->result;
}

- (id)error
{
  return self->error;
}

- (AOSTransaction)initWithCoder:(id)a3
{
  AOSTransaction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AOSTransaction;
  v4 = -[AOSTransaction init](&v6, sel_init);
  if (v4)
  {
    v4->didSucceed = objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("didSucceed")), "BOOLValue");
    v4->didFinish = objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("didFinish")), "BOOLValue");
    v4->result = (id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("result"));
    v4->error = (__CFError *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("error"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *result;
  __CFError *error;

  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->didSucceed != 0), CFSTR("didSucceed"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->didFinish != 0), CFSTR("didFinish"));
  result = self->result;
  if (result)
    objc_msgSend(a3, "encodeObject:forKey:", result, CFSTR("result"));
  error = self->error;
  if (error)
    objc_msgSend(a3, "encodeObject:forKey:", error, CFSTR("error"));
}

@end
