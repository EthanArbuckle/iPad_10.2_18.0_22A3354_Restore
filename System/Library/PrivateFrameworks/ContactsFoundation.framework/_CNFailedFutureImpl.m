@implementation _CNFailedFutureImpl

- (void)addFailureBlock:(id)a3
{
  (*((void (**)(id, NSError *))a3 + 2))(a3, self->_error);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

- (_CNFailedFutureImpl)initWithError:(id)a3
{
  id v5;
  _CNFailedFutureImpl *v6;
  _CNFailedFutureImpl *v7;
  _CNFailedFutureImpl *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNFailedFutureImpl;
  v6 = -[_CNFailedFutureImpl init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v8 = v7;
  }

  return v7;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = objc_retainAutorelease(self->_error);
  return 0;
}

- (BOOL)isFinished
{
  return 1;
}

- (BOOL)isCancelled
{
  return +[CNFoundationError isCanceledError:](CNFoundationError, "isCanceledError:", self->_error);
}

- (BOOL)cancel
{
  return 0;
}

- (void)updateDescriptionWithBuilder:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "appendName:object:", CFSTR("error"), self->_error);
}

@end
