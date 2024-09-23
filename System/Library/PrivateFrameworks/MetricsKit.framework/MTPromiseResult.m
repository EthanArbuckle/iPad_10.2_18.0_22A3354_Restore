@implementation MTPromiseResult

- (id)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (MTPromiseResult)initWithResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  MTPromiseResult *v9;
  MTPromiseResult *v10;
  uint64_t v11;
  NSError *error;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTPromiseResult;
  v9 = -[MTPromiseResult init](&v14, sel_init);
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
