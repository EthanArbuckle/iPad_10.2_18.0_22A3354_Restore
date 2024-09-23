@implementation HMFUnfairLock

+ (id)lock
{
  return (id)objc_msgSend(a1, "lockWithOptions:", 0);
}

+ (id)lockWithOptions:(unint64_t)a3
{
  __objc2_class **v3;

  v3 = off_1E3B35BF8;
  if ((a3 & 2) != 0)
    v3 = off_1E3B35C00;
  return (id)objc_msgSend(objc_alloc(*v3), "initWithOptions:", a3);
}

- (HMFUnfairLock)initWithOptions:(unint64_t)a3
{
  HMFUnfairLock *v4;
  HMFUnfairLock *v5;
  HMFUnfairLock *v6;
  HMFUnfairLock *v7;
  objc_super v9;

  v4 = self;
  if (-[HMFUnfairLock isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    +[HMFUnfairLock lockWithOptions:](HMFUnfairLock, "lockWithOptions:", a3);
    v5 = (HMFUnfairLock *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = v4;
    v9.super_class = (Class)HMFUnfairLock;
    v6 = -[HMFUnfairLock init](&v9, sel_init);
    if (v6)
      v6->_options = a3;
    v5 = v6;
    v4 = v5;
  }
  v7 = v5;

  return v7;
}

- (void)lock
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)unlock
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)assertOwner
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)assertNotOwner
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMFUnfairLock)init
{
  return -[HMFUnfairLock initWithOptions:](self, "initWithOptions:", 0);
}

- (void)performBlock:(id)a3
{
  HMFUnfairLock *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  if (v5)
  {
    v4 = self;
    -[HMFUnfairLock lock](v4, "lock");
    v5[2]();
    -[HMFUnfairLock unlock](v4, "unlock");

  }
}

- (unint64_t)options
{
  return self->_options;
}

@end
