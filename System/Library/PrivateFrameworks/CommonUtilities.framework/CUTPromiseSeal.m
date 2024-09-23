@implementation CUTPromiseSeal

- (CUTPromiseSeal)initWithQueue:(id)a3
{
  id v4;
  CUTPromiseSeal *v5;
  _CUTPromise *v6;
  CUTPromise *promise;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUTPromiseSeal;
  v5 = -[CUTPromiseSeal init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_CUTPromise initWithQueue:]([_CUTPromise alloc], "initWithQueue:", v4);
    promise = v5->_promise;
    v5->_promise = &v6->super;

  }
  return v5;
}

- (void)fulfillWithValue:(id)a3
{
  id v4;
  CUTResult *v5;
  id v6;

  v4 = a3;
  -[CUTPromiseSeal promise](self, "promise");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CUTResult initWithSuccess:]([CUTResult alloc], "initWithSuccess:", v4);

  objc_msgSend(v6, "_fulfillWithResult:", v5);
}

- (void)failWithError:(id)a3
{
  id v4;
  CUTResult *v5;
  id v6;

  v4 = a3;
  -[CUTPromiseSeal promise](self, "promise");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CUTResult initWithError:]([CUTResult alloc], "initWithError:", v4);

  objc_msgSend(v6, "_fulfillWithResult:", v5);
}

- (CUTPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
  objc_storeStrong((id *)&self->_promise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
}

@end
