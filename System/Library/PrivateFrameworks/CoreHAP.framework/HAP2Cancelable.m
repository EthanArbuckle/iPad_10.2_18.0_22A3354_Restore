@implementation HAP2Cancelable

- (HAP2Cancelable)init
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

- (HAP2Cancelable)initWithBlock:(id)a3
{
  id v4;
  HAP2Cancelable *v5;
  HAP2Cancelable *v6;
  uint64_t v7;
  id block;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HAP2Cancelable;
  v5 = -[HAP2Cancelable init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_called = 0;
    v7 = MEMORY[0x1D17B7400](v4);
    block = v6->_block;
    v6->_block = (id)v7;

  }
  return v6;
}

- (void)cancelWithError:(id)a3
{
  id v4;
  BOOL *p_called;
  unsigned __int8 v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v4 = a3;
  p_called = &self->_called;
  do
    v6 = __ldaxr((unsigned __int8 *)p_called);
  while (__stlxr(1u, (unsigned __int8 *)p_called));
  if ((v6 & 1) == 0)
  {
    v8 = v4;
    -[HAP2Cancelable block](self, "block");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HAP2Cancelable setBlock:](self, "setBlock:", 0);
      ((void (**)(_QWORD, id))v7)[2](v7, v8);
    }

    v4 = v8;
  }

}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

+ (HAP2Cancelable)new
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

+ (HAP2Cancelable)cancelableWithBlock:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBlock:", v3);

  return (HAP2Cancelable *)v4;
}

+ (id)ignore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__HAP2Cancelable_ignore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (ignore_onceToken != -1)
    dispatch_once(&ignore_onceToken, block);
  return (id)ignore_cancelable;
}

void __24__HAP2Cancelable_ignore__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBlock:", 0);
  v1 = (void *)ignore_cancelable;
  ignore_cancelable = v0;

}

@end
