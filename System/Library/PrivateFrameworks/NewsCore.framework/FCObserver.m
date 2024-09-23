@implementation FCObserver

- (void)setObserverBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setKeepAliveObject:(id)a3
{
  objc_storeWeak(&self->_keepAliveObject, a3);
}

- (FCObserver)initWithToken:(unint64_t)a3
{
  FCObserver *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FCObserver;
  result = -[FCObserver init](&v5, sel_init);
  if (result)
    result->_token = a3;
  return result;
}

- (FCObserver)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCObserver init]";
    v9 = 2080;
    v10 = "FCObservable.m";
    v11 = 1024;
    v12 = 25;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCObserver init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  unint64_t v8;

  if (self == a3)
    return 1;
  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v7 = v5;

  if (v7)
  {
    v8 = -[FCObserver token](self, "token");
    v6 = v8 == objc_msgSend(v7, "token");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)disposeOn:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCObserver setKeepAliveObject:](self, "setKeepAliveObject:", v5);

}

- (void)dispose
{
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCObserver setKeepAliveObject:](self, "setKeepAliveObject:", 0);
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (id)keepAliveObject
{
  return objc_loadWeakRetained(&self->_keepAliveObject);
}

- (id)observerBlock
{
  return self->_observerBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observerBlock, 0);
  objc_destroyWeak(&self->_keepAliveObject);
}

@end
