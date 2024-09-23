@implementation CUTUnsafePromiseSeal

- (CUTUnsafePromiseSeal)init
{
  CUTUnsafePromiseSeal *v2;
  _CUTUnsafePromise *v3;
  CUTUnsafePromise *promise;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUTUnsafePromiseSeal;
  v2 = -[CUTUnsafePromiseSeal init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_CUTUnsafePromise);
    promise = v2->_promise;
    v2->_promise = &v3->super;

  }
  return v2;
}

- (void)fulfillWithValue:(id)a3
{
  id v4;
  CUTResult *v5;
  id v6;

  v4 = a3;
  -[CUTUnsafePromiseSeal promise](self, "promise");
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
  -[CUTUnsafePromiseSeal promise](self, "promise");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CUTResult initWithError:]([CUTResult alloc], "initWithError:", v4);

  objc_msgSend(v6, "_fulfillWithResult:", v5);
}

- (CUTUnsafePromise)promise
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
