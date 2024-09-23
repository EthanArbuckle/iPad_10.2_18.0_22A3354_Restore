@implementation CNResult

- (BOOL)isFailure
{
  return -[CNEither isRight](self->_either, "isRight");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_either, 0);
}

+ (id)resultWithValue:(id)a3 orError:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:error:", v7, v6);

  return v8;
}

+ (id)successWithValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:error:", v4, 0);

  return v5;
}

- (CNResult)initWithValue:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  CNResult *v8;
  uint64_t v9;
  CNEither *either;
  CNResult *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNResult;
  v8 = -[CNResult init](&v13, sel_init);
  if (v8)
  {
    +[CNEither eitherWithLeft:right:](CNEither, "eitherWithLeft:right:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    either = v8->_either;
    v8->_either = (CNEither *)v9;

    v11 = v8;
  }

  return v8;
}

- (BOOL)isSuccess
{
  return -[CNEither isLeft](self->_either, "isLeft");
}

- (id)value
{
  return -[CNEither left](self->_either, "left");
}

- (NSError)error
{
  return (NSError *)-[CNEither right](self->_either, "right");
}

+ (id)resultWithBlock:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  (*((void (**)(id, id *))a3 + 2))(a3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  objc_msgSend(a1, "resultWithValue:orError:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)resultWithFuture:(id)a3
{
  return (id)objc_msgSend(a1, "resultWithFuture:timeout:", a3, 30.0);
}

+ (id)resultWithFuture:(id)a3 timeout:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  objc_msgSend(a3, "resultWithTimeout:error:", &v9, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  objc_msgSend(a1, "resultWithValue:orError:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)failureWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:error:", 0, v4);

  return v5;
}

- (CNResult)initWithValue:(id)a3
{
  return -[CNResult initWithValue:error:](self, "initWithValue:error:", a3, 0);
}

- (CNResult)initWithError:(id)a3
{
  return -[CNResult initWithValue:error:](self, "initWithValue:error:", 0, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNResult isSuccess](self, "isSuccess"))
  {
    -[CNResult value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("value");
  }
  else
  {
    -[CNResult error](self, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("error");
  }
  v6 = (id)objc_msgSend(v3, "appendName:object:", v5, v4);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CNResult *v4;
  CNEither *either;
  BOOL v6;

  v4 = (CNResult *)a3;
  v6 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (either = self->_either, (unint64_t)either | (unint64_t)v4->_either)
      && !-[CNEither isEqual:](either, "isEqual:"))
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return -[CNEither hash](self->_either, "hash");
}

- (id)valueWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[CNResult value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNResult error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  if (a3 && !v7)
    *a3 = objc_retainAutorelease(v6);

  return v8;
}

- (id)map:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  CNResult *v7;

  v4 = (void (**)(id, void *))a3;
  if (-[CNResult isSuccess](self, "isSuccess"))
  {
    -[CNResult value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNResult successWithValue:](CNResult, "successWithValue:", v6);
    v7 = (CNResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self;
  }

  return v7;
}

- (id)flatMap:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  CNResult *v6;

  v4 = (void (**)(id, void *))a3;
  if (-[CNResult isSuccess](self, "isSuccess"))
  {
    -[CNResult value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);
    v6 = (CNResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self;
  }

  return v6;
}

- (id)recover:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  CNResult *v6;

  v4 = (void (**)(id, void *))a3;
  if (-[CNResult isFailure](self, "isFailure"))
  {
    -[CNResult error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);
    v6 = (CNResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self;
  }

  return v6;
}

+ (id)isSuccess
{
  return &__block_literal_global;
}

+ (id)isFailure
{
  return &__block_literal_global_6;
}

- (CNEither)either
{
  return (CNEither *)objc_getProperty(self, a2, 8, 1);
}

@end
