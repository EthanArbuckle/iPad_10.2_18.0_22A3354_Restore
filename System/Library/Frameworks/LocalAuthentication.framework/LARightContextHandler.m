@implementation LARightContextHandler

- (LARightContextHandler)init
{
  LARightContextHandler *v2;
  LAContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LARightContextHandler;
  v2 = -[LARightContextHandler init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(LAContext);
    -[LARightContextHandler setContext:](v2, "setContext:", v3);

  }
  return v2;
}

- (LARightContextHandler)initWithDelegate:(id)a3
{
  id v4;
  LARightContextHandler *v5;
  LARightContextHandler *v6;

  v4 = a3;
  v5 = -[LARightContextHandler init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)setContext:(id)a3
{
  LAContext *v5;
  LAContext *context;
  LAContext *v7;

  v5 = (LAContext *)a3;
  context = self->_context;
  if (context != v5)
  {
    v7 = v5;
    if (context)
    {
      -[LAContext removeContextObserver:](context, "removeContextObserver:", self);
      -[LAContext invalidate](self->_context, "invalidate");
    }
    objc_storeStrong((id *)&self->_context, a3);
    -[LAContext addContextObserver:](self->_context, "addContextObserver:", self);
    v5 = v7;
  }

}

- (void)contextDidBecomeInvalid:(id)a3
{
  id WeakRetained;

  if (self->_context == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "rightContextDidBecomeInvalid");

  }
}

- (LARightContextHandlerDelegate)delegate
{
  return (LARightContextHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (LAContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
