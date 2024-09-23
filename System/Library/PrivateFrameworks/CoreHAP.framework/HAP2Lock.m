@implementation HAP2Lock

- (HAP2Lock)initWithLock:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  HAP2Lock *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HAP2Lock;
  v9 = -[HAP2Lock init](&v11, sel_init);
  if (v9)
  {
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "setName:", v8);
    objc_storeStrong((id *)&v9->_internalLock, a3);
    atomic_store(0, &v9->_lockCount);
  }

  return v9;
}

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HAP2Lock internalLock](self, "internalLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HAP2Lock _performBlock:allowRecursive:](self, "_performBlock:allowRecursive:", v4, 0);
  -[HAP2Lock internalLock](self, "internalLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (NSLocking)internalLock
{
  return self->_internalLock;
}

- (void)_performBlock:(id)a3 allowRecursive:(BOOL)a4
{
  unint64_t *p_lockCount;
  unint64_t v5;
  unint64_t v6;

  p_lockCount = &self->_lockCount;
  do
    v5 = __ldaxr(p_lockCount);
  while (__stlxr(v5 + 1, p_lockCount));
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  do
    v6 = __ldaxr(p_lockCount);
  while (__stlxr(v6 - 1, p_lockCount));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalLock, 0);
}

- (HAP2Lock)init
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

- (NSString)name
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[HAP2Lock internalLock](self, "internalLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HAP2Lock internalLock](self, "internalLock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

+ (id)new
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

+ (id)lockWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLock:name:", v4, v3);

  return v5;
}

@end
