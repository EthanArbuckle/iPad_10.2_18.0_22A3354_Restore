@implementation _CNConstantFutureImpl

- (void)addSuccessBlock:(id)a3
{
  (*((void (**)(id, id))a3 + 2))(a3, self->_result);
}

- (_CNConstantFutureImpl)initWithResult:(id)a3
{
  id v5;
  _CNConstantFutureImpl *v6;
  _CNConstantFutureImpl *v7;
  _CNConstantFutureImpl *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNConstantFutureImpl;
  v6 = -[_CNConstantFutureImpl init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_result, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  return self->_result;
}

- (BOOL)isFinished
{
  return 1;
}

- (BOOL)isCancelled
{
  return 0;
}

- (BOOL)cancel
{
  return 0;
}

- (void)updateDescriptionWithBuilder:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "appendName:object:", CFSTR("result"), self->_result);
}

@end
