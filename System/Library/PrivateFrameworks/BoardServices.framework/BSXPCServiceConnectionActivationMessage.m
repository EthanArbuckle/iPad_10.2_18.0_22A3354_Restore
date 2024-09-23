@implementation BSXPCServiceConnectionActivationMessage

- (void)sendIfNecessary
{
  BSXPCServiceConnectionMessage *message;

  if (BSAtomicSetFlag())
  {
    -[BSXPCServiceConnectionMessage send](self->_message, "send");
    message = self->_message;
    self->_message = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

- (id)initWithMessage:(void *)a1
{
  id *v3;
  id *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)BSXPCServiceConnectionActivationMessage;
  v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong(v3 + 1, a2);
    *((_DWORD *)v4 + 4) = 0;
  }
  return v4;
}

- (void)dealloc
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSXPCServiceConnectionActivationMessage *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((BSAtomicGetFlag() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must be sent or invalidated before dealloc"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      v11 = 2114;
      v12 = v7;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("BSXPCServiceConnection.m");
      v17 = 1024;
      v18 = 1332;
      v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A42A0);
  }
  v8.receiver = self;
  v8.super_class = (Class)BSXPCServiceConnectionActivationMessage;
  -[BSXPCServiceConnectionActivationMessage dealloc](&v8, sel_dealloc);
}

- (void)invalidate
{
  BSXPCServiceConnectionMessage *message;

  if (BSAtomicSetFlag())
  {
    -[BSXPCServiceConnectionMessage invalidate](self->_message, "invalidate");
    message = self->_message;
    self->_message = 0;

  }
}

@end
