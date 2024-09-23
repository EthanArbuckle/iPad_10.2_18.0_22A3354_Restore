@implementation _CUTStaticPromise

- (_CUTStaticPromise)initWithResult:(id)a3 safe:(BOOL)a4
{
  id v7;
  id *v8;
  _CUTStaticPromise *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CUTStaticPromise;
  v8 = -[CUTUnsafePromise _init](&v11, sel__init);
  v9 = (_CUTStaticPromise *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 1, a3);
    v9->_safe = a4;
  }

  return v9;
}

- (void)registerResultBlock:(id)a3
{
  (*((void (**)(id, CUTResult *))a3 + 2))(a3, self->_result);
}

- (id)then:(id)a3
{
  if (self->_safe)
    sub_1A0BCF730(self, a3);
  else
    sub_1A0BCF4E0(self, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CUTResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

@end
