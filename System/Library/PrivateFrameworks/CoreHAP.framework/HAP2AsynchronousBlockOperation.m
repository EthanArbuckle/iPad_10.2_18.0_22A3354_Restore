@implementation HAP2AsynchronousBlockOperation

- (HAP2AsynchronousBlockOperation)initWithBlock:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  HAP2AsynchronousBlockOperation *v7;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAP2AsynchronousBlockOperation initWithName:block:](self, "initWithName:block:", v6, v4);

  return v7;
}

- (_QWORD)initWithName:(uint64_t)a3 optionalActivity:(void *)a4 block:
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v7 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)HAP2AsynchronousBlockOperation;
    v8 = objc_msgSendSuper2(&v12, sel_initWithName_optionalActivity_, a2, a3);
    if (v8)
    {
      v9 = MEMORY[0x1D17B7400](v7);
      v10 = (void *)v8[35];
      v8[35] = v9;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HAP2AsynchronousBlockOperation)initWithName:(id)a3 block:(id)a4
{
  return (HAP2AsynchronousBlockOperation *)-[HAP2AsynchronousBlockOperation initWithName:optionalActivity:block:](self, (uint64_t)a3, 0, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

- (void)main
{
  SEL v3;
  void (**v4)(void);

  if (self)
  {
    v4 = (void (**)(void))self->_block;
    objc_setProperty_nonatomic_copy(self, v3, 0, 280);
  }
  else
  {
    v4 = 0;
  }
  v4[2]();

}

- (HAP2AsynchronousBlockOperation)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAP2AsynchronousBlockOperation)initWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HAP2AsynchronousBlockOperation)initWithName:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ is unavailable"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (HAP2AsynchronousBlockOperation)initWithName:(id)a3 optionalActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ is unavailable"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (HAP2AsynchronousBlockOperation)initWithName:(id)a3 activity:(id)a4 block:(id)a5
{
  return (HAP2AsynchronousBlockOperation *)-[HAP2AsynchronousBlockOperation initWithName:optionalActivity:block:](self, (uint64_t)a3, (uint64_t)a4, a5);
}

@end
