@implementation OperationQueueInvocationTrampoline

- (OperationQueueInvocationTrampoline)initWithTarget:(id)a3 operationQueue:(id)a4 priority:(int64_t)a5
{
  OperationQueueInvocationTrampoline *v8;
  OperationQueueInvocationTrampoline *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OperationQueueInvocationTrampoline;
  v8 = -[OperationQueueInvocationTrampoline init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[InvocationTrampoline setTarget:](v8, "setTarget:", a3);
    v9->_queue = (NSOperationQueue *)a4;
    v9->_priority = a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OperationQueueInvocationTrampoline;
  -[InvocationTrampoline dealloc](&v3, sel_dealloc);
}

- (void)forwardInvocation:(id)a3
{
  void *v5;

  objc_msgSend(a3, "retainArguments");
  objc_msgSend(a3, "setTarget:", -[InvocationTrampoline target](self, "target"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C0]), "initWithInvocation:", a3);
  objc_msgSend(v5, "setQueuePriority:", self->_priority);
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v5);

  self->_queue = 0;
}

@end
