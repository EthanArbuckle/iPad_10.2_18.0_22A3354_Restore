@implementation DYFutureOperation

+ (id)operationWithBlock:(id)a3
{
  _QWORD *v4;

  objc_opt_class();
  v4 = (id)objc_opt_new();
  if (v4)
  {
    v4[41] = objc_msgSend(a3, "copy");
    *((_BYTE *)v4 + 304) = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYFutureOperation;
  -[DYFuture dealloc](&v3, sel_dealloc);
}

- (BOOL)isExecuting
{
  BOOL started;

  -[NSCondition lock](self->super._condition, "lock");
  if (*(_WORD *)&self->super._resolved)
    started = 0;
  else
    started = self->super._started;
  -[NSCondition unlock](self->super._condition, "unlock");
  return started;
}

- (BOOL)isFinished
{
  BOOL started;

  -[NSCondition lock](self->super._condition, "lock");
  if (*(_WORD *)&self->super._resolved)
    started = self->super._started;
  else
    started = 0;
  -[NSCondition unlock](self->super._condition, "unlock");
  return started;
}

- (void)_start_NOLOCK
{
  NSObject *global_queue;
  _QWORD block[5];

  -[DYFutureOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[NSCondition lock](self->super._condition, "lock");
  if (self->super._started)
  {
    -[NSCondition unlock](self->super._condition, "unlock");
  }
  else
  {
    self->super._started = 1;
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__DYFutureOperation__start_NOLOCK__block_invoke;
    block[3] = &unk_250D62318;
    block[4] = self;
    dispatch_async(global_queue, block);
    -[NSCondition unlock](self->super._condition, "unlock");
    -[DYFutureOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  }
}

void __34__DYFutureOperation__start_NOLOCK__block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  _QWORD v5[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "lock");
  v2 = objc_msgSend(*(id *)(a1 + 32), "_waitForDependencies_REQUIRESLOCK");
  v3 = *(_QWORD *)(a1 + 32);
  if ((v2 & 1) != 0 && (v4 = *(void (***)(_QWORD, _QWORD))(v3 + 328)) != 0)
  {
    *(_QWORD *)(v3 + 328) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "unlock");
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __34__DYFutureOperation__start_NOLOCK__block_invoke_2;
    v5[3] = &unk_250D62858;
    v5[4] = *(_QWORD *)(a1 + 32);
    ((void (**)(_QWORD, _QWORD *))v4)[2](v4, v5);

  }
  else
  {
    objc_msgSend(*(id *)(v3 + 256), "unlock");
  }
}

uint64_t __34__DYFutureOperation__start_NOLOCK__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setResult:error:notify_NOLOCK:", a2, a3, 1);
}

- (void)addDependency:(id)a3
{
  -[NSCondition lock](self->super._condition, "lock");
  -[DYFuture _addDependency_REQUIRESLOCK:](self, "_addDependency_REQUIRESLOCK:", a3);
  -[NSCondition unlock](self->super._condition, "unlock");
}

@end
