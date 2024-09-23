@implementation AMSPromiseResult

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (AMSPromiseResult)initWithResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  AMSPromiseResult *v9;
  AMSPromiseResult *v10;
  uint64_t v11;
  NSError *error;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSPromiseResult;
  v9 = -[AMSPromiseResult init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_result, a3);
    v11 = objc_msgSend(v8, "copy");
    error = v10->_error;
    v10->_error = (NSError *)v11;

  }
  return v10;
}

- (id)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (void)setResult:(id)a3
{
  objc_storeStrong(&self->_result, a3);
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
