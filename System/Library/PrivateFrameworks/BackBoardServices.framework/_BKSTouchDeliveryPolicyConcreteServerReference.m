@implementation _BKSTouchDeliveryPolicyConcreteServerReference

- (void)ipc_addPolicy:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _BKSTouchDeliveryPolicyConcreteServerReference *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (objc_class *)objc_msgSend(v5, "classForCoder");
      if (!v9)
        v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("policy"), v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v18 = v14;
        v19 = 2114;
        v20 = v16;
        v21 = 2048;
        v22 = self;
        v23 = 2114;
        v24 = CFSTR("BKSTouchDeliveryPolicyServerInterface.m");
        v25 = 1024;
        v26 = 50;
        v27 = 2114;
        v28 = v13;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A10C908);
    }
  }

  BKLogTouchDeliveryPolicy();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v5;
    _os_log_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_DEFAULT, "TDPS client ipc_addPolicy:%{public}@", buf, 0xCu);
  }

  if (v5)
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_server->_connection, "remoteObjectProxyWithErrorHandler:", self->_errorHandler);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ipc_addPolicy:", v5);

  }
}

- (_BKSTouchDeliveryPolicyConcreteServerInterface)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
