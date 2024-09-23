@implementation _CNFlatMapSubscriptionContext

- (void)setOperatorReceiving:(BOOL)a3
{
  self->_operatorReceiving = a3;
}

- (CNQueue)decorators
{
  return self->_decorators;
}

- (CNWeakArray)tokens
{
  return self->_tokens;
}

- (BOOL)isOperatorReceiving
{
  return self->_operatorReceiving;
}

- (CNScheduler)resourceLock
{
  return self->_resourceLock;
}

- (CNScheduler)downstream
{
  return self->_downstream;
}

- (_CNFlatMapSubscriptionContext)initWithSchedulerProvider:(id)a3
{
  id v4;
  _CNFlatMapSubscriptionContext *v5;
  CNQueue *v6;
  CNQueue *decorators;
  CNWeakArray *v8;
  CNWeakArray *tokens;
  uint64_t v10;
  CNScheduler *downstream;
  uint64_t v12;
  CNScheduler *resourceLock;
  _CNFlatMapSubscriptionContext *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_CNFlatMapSubscriptionContext;
  v5 = -[_CNFlatMapSubscriptionContext init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(CNQueue);
    decorators = v5->_decorators;
    v5->_decorators = v6;

    v8 = objc_alloc_init(CNWeakArray);
    tokens = v5->_tokens;
    v5->_tokens = v8;

    v10 = objc_msgSend(v4, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.reactive.flat-map.downstream"));
    downstream = v5->_downstream;
    v5->_downstream = (CNScheduler *)v10;

    v12 = objc_msgSend(v4, "newSynchronousSerialSchedulerWithName:", CFSTR("com.apple.contacts.reactive.flat-map.resource"));
    resourceLock = v5->_resourceLock;
    v5->_resourceLock = (CNScheduler *)v12;

    *(_WORD *)&v5->_operatorReceiving = 257;
    v14 = v5;
  }

  return v5;
}

- (void)setObserverReceiving:(BOOL)a3
{
  self->_observerReceiving = a3;
}

- (BOOL)isObserverReceiving
{
  return self->_observerReceiving;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_decorators, 0);
}

@end
