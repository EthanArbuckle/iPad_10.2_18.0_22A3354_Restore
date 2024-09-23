@implementation NADeallocationSentinel

- (NADeallocationSentinel)initWithTargetObject:(id)a3 finalizer:(id)a4
{
  id v6;
  id v7;
  NADeallocationSentinel *v8;
  NADeallocationSentinel *v9;
  uint64_t v10;
  id finalizer;
  NADeallocationTracer *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NADeallocationSentinel;
  v8 = -[NADeallocationSentinel init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_targetObject = v6;
    v10 = MEMORY[0x1B5E0F7A8](v7);
    finalizer = v9->_finalizer;
    v9->_finalizer = (id)v10;

    v12 = -[NADeallocationTracer initWithDelegate:]([NADeallocationTracer alloc], "initWithDelegate:", v9);
    objc_setAssociatedObject(v6, v9, v12, (void *)1);
    objc_storeWeak((id *)&v9->_tracer, v12);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[NADeallocationSentinel tracer](self, "tracer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NADeallocationSentinel tracer](self, "tracer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", 0);

    -[NADeallocationSentinel targetObject](self, "targetObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v5, self, 0, (void *)1);

  }
  v6.receiver = self;
  v6.super_class = (Class)NADeallocationSentinel;
  -[NADeallocationSentinel dealloc](&v6, sel_dealloc);
}

- (void)tracerIsDeallocating
{
  void *v3;
  void (**v4)(id, void *);

  -[NADeallocationSentinel finalizer](self, "finalizer");
  v4 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  -[NADeallocationSentinel targetObject](self, "targetObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

- (id)targetObject
{
  return self->_targetObject;
}

- (id)finalizer
{
  return self->_finalizer;
}

- (NADeallocationTracer)tracer
{
  return (NADeallocationTracer *)objc_loadWeakRetained((id *)&self->_tracer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tracer);
  objc_storeStrong(&self->_finalizer, 0);
}

@end
