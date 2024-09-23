@implementation AMSFailingBagValue

- (AMSFailingBagValue)valueWithCompletion:(id)a3
{
  id v5;
  AMSFailingBagValue *result;
  id v7;

  v5 = a3;
  -[AMSFailingBagValue error](self, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, id))a3 + 2))(v5, 0, 0, v7);

  return result;
}

- (NSError)error
{
  return self->_error;
}

- (AMSFailingBagValue)initWithKey:(id)a3 valueType:(unint64_t)a4 error:(id)a5
{
  id v9;
  AMSFailingBagValue *v10;
  AMSFailingBagValue *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AMSFailingBagValue;
  v10 = -[AMSFrozenBagValue initWithKey:value:valueType:](&v13, sel_initWithKey_value_valueType_, a3, 0, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_error, a5);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

@end
