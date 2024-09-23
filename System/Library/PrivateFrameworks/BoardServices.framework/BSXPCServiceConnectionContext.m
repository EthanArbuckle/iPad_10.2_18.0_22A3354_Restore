@implementation BSXPCServiceConnectionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proem, 0);
}

- (BOOL)isRoot
{
  return 0;
}

- (BOOL)isServer
{
  return 0;
}

- (BOOL)isChild
{
  return 0;
}

- (BOOL)isClient
{
  return 0;
}

- (_QWORD)_initWithProem:(void *)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = a2;
  v8.receiver = a1;
  v8.super_class = (Class)BSXPCServiceConnectionContext;
  v4 = objc_msgSendSuper2(&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(v3, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

  }
  return v4;
}

- (BOOL)isNonLaunching
{
  return 0;
}

- (BSXPCServiceConnectionContext)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSXPCServiceConnectionContext *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSXPCServiceConnectionContext *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on BSXPCServiceConnectionContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BSXPCServiceConnectionContext.m");
    v17 = 1024;
    v18 = 23;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSXPCServiceConnectionContext *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)endpointDescription
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)description
{
  NSString *proem;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;

  if (self)
    proem = self->_proem;
  else
    proem = 0;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = proem;
  -[BSXPCServiceConnectionContext endpointDescription](self, "endpointDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
