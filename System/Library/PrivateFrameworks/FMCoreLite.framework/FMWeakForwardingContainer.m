@implementation FMWeakForwardingContainer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return objc_loadWeakRetained((id *)&self->_target);
}

- (FMWeakForwardingContainer)initWithTarget:(id)a3
{
  id v4;
  FMWeakForwardingContainer *v5;
  FMWeakForwardingContainer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMWeakForwardingContainer;
  v5 = -[FMWeakForwardingContainer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_target, v4);

  return v6;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id WeakRetained;
  void *v6;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  objc_msgSend(WeakRetained, "methodSignatureForSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)FMWeakForwardingContainer;
    -[FMWeakForwardingContainer methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_, sel_self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  objc_msgSend(v5, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "invokeWithTarget:", WeakRetained);

}

- (BOOL)respondsToSelector:(SEL)a3
{
  return 1;
}

- (NSObject)target
{
  return objc_loadWeakRetained((id *)&self->_target);
}

@end
