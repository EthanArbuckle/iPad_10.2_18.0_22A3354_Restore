@implementation AVBlockOperation

- (AVBlockOperation)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(sel_initWithBlock_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVBlockOperation)initWithBlock:(id)a3
{
  AVBlockOperation *v4;
  AVBlockOperation *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  if (!a3)
  {
    v8 = self;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)"block != nil"), 0);
    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVBlockOperation;
  v4 = -[AVOperation init](&v15, sel_init);
  if (v4)
    v4->_block = (id)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVBlockOperation;
  -[AVOperation dealloc](&v3, sel_dealloc);
}

- (void)start
{
  uint64_t v3;

  if (-[AVOperation evaluateDependenciesAndMarkAsExecuting](self, "evaluateDependenciesAndMarkAsExecuting"))
  {
    v3 = (*((uint64_t (**)(void))self->_block + 2))();
    if (v3 == 4)
    {
      -[AVOperation markAsFailedWithError:](self, "markAsFailedWithError:", 0);
    }
    else if (v3 == 2)
    {
      -[AVOperation markAsCompleted](self, "markAsCompleted");
    }
    else
    {
      -[AVOperation markAsCancelled](self, "markAsCancelled");
    }
  }
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVBlockOperation;
  -[AVBlockOperation cancel](&v2, sel_cancel);
}

@end
