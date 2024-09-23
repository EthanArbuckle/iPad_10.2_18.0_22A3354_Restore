@implementation CNFutureResult

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[CNFutureResult result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFutureResult error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResult:error:", v5, v6);

  return v4;
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3 error:(id)a4
{
  if (a3)
    -[CNFutureResult setResult:](self, "setResult:", a3, a4);
  else
    -[CNFutureResult setError:](self, "setError:", a4);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  objc_class *v13;

  -[CNFutureResult result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[CNFutureResult error](self, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p unfinished>"), v8, self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  -[CNFutureResult result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CNFutureResult result](self, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p result='%@'>"), v8, self, v9);
  }
  else
  {
    -[CNFutureResult error](self, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p error='%@'>"), v8, self, v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v10;
}

@end
