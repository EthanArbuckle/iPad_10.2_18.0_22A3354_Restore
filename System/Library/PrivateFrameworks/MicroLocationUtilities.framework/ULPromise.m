@implementation ULPromise

+ (id)promise
{
  return objc_alloc_init((Class)a1);
}

- (ULPromise)init
{
  ULPromise *v2;
  ULFuture *v3;
  ULFuture *future;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ULPromise;
  v2 = -[ULPromise init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ULFuture);
    future = v2->_future;
    v2->_future = v3;

  }
  return v2;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ULPromise;
  if (-[ULPromise respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ULPromise;
  -[ULPromise methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[ULFuture methodSignatureForSelector:](self->_future, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_future;
}

- (void)cancel
{
  -[ULFuture cancel](self->_future, "cancel");
}

- (ULFuture)future
{
  return (ULFuture *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
}

@end
