@implementation GCPromise

- (id)initWithFuture:(id *)a1
{
  id v4;
  objc_super v6;

  v4 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)GCPromise;
    a1 = (id *)objc_msgSendSuper2(&v6, sel_init);
    objc_storeStrong(a1 + 1, a2);
  }

  return a1;
}

- (GCPromise)init
{
  -[GCPromise doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  unsigned __int8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = atomic_load((unsigned __int8 *)&self->_future->_state);
  if ((v3 & 0x80) != 0)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPromise debugDescription](self, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 1981, CFSTR("Promise deallocated without finishing: %@"), v6);

    -[GCFuture cancel](self->_future, "cancel");
  }
  v7.receiver = self;
  v7.super_class = (Class)GCPromise;
  -[GCPromise dealloc](&v7, sel_dealloc);
}

- (id)future
{
  return self->_future;
}

- (BOOL)isCancelled
{
  return *(&self->_future->_state + 3) & 1;
}

- (void)succeedWithResult:(id)a3
{
  -[GCFuture succeedWithResult:](self->_future, a3);
}

- (void)failWithError:(id)a3
{
  -[GCFuture failWithError:](self->_future, a3);
}

- (void)cancel
{
  -[GCFuture cancel](self->_future, "cancel");
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCFuture debugDescription](self->_future, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> -> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)redactedDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCFuture redactedDescription](self->_future, "redactedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@> -> %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCFuture description](self->_future, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@> -> %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
}

@end
