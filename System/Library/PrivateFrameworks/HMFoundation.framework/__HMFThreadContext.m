@implementation __HMFThreadContext

- (unint64_t)hash
{
  return -[NSThread hash](self->_thread, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_thread, 0);
}

- (BOOL)isEqual:(id)a3
{
  __HMFThreadContext *v4;
  __HMFThreadContext *v5;
  __HMFThreadContext *v6;
  char v7;

  v4 = (__HMFThreadContext *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
      v7 = -[NSThread isEqual:](self->_thread, "isEqual:", v6->_thread);
    else
      v7 = 0;

  }
  return v7;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)count
{
  return self->_count;
}

+ (__HMFThreadContext)currentContext
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "__init");
  v4 = (_QWORD *)v3;
  if (v3)
  {
    objc_storeStrong((id *)(v3 + 16), v2);
    v5 = voucher_copy();
    v6 = (void *)v4[4];
    v4[4] = v5;

  }
  return (__HMFThreadContext *)v4;
}

- (id)__init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__HMFThreadContext;
  return -[__HMFThreadContext init](&v3, sel_init);
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_voucher, a3);
}

- (void)setShouldRestoreVoucher:(BOOL)a3
{
  self->_shouldRestoreVoucher = a3;
}

- (OS_voucher)voucher
{
  return self->_voucher;
}

- (BOOL)shouldRestoreVoucher
{
  return self->_shouldRestoreVoucher;
}

- (__HMFThreadContext)init
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

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Context: Thread = %@, Count = %tu>"), self->_thread, self->_count);
}

- (NSThread)thread
{
  return (NSThread *)objc_getProperty(self, a2, 16, 1);
}

@end
