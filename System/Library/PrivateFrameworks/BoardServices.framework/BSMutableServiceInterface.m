@implementation BSMutableServiceInterface

+ (id)interfaceWithIdentifier:(id)a3
{
  id v5;
  BSMutableServiceInterface *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v20 = v12;
      v21 = 2114;
      v22 = v14;
      v23 = 2048;
      v24 = a1;
      v25 = 2114;
      v26 = CFSTR("BSServiceInterface.m");
      v27 = 1024;
      v28 = 448;
      v29 = 2114;
      v30 = v11;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A6698);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v20 = v16;
      v21 = 2114;
      v22 = v18;
      v23 = 2048;
      v24 = a1;
      v25 = 2114;
      v26 = CFSTR("BSServiceInterface.m");
      v27 = 1024;
      v28 = 448;
      v29 = 2114;
      v30 = v15;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A6798);
  }

  v6 = [BSMutableServiceInterface alloc];
  __emptyProtocol();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __emptyProtocol();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BSServiceInterface _initWithIdentifier:server:client:clientWaitsForActivation:](v6, v5, v7, v8, 0);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5;
  uint64_t *v6;

  v5 = -[BSServiceInterface clientMessagingExpectation](self, "clientMessagingExpectation");
  v6 = (uint64_t *)MEMORY[0x1E0C9AE50];
  if (v5 != 1)
    v6 = (uint64_t *)MEMORY[0x1E0C9AE40];
  return -[BSServiceInterface _initWithIdentifier:server:client:clientWaitsForActivation:](+[BSServiceInterface allocWithZone:](BSServiceInterface, "allocWithZone:", a3), self->super._identifier, self->super._server, self->super._client, *v6);
}

- (void)setClientMessagingExpectation:(int64_t)a3
{
  __CFBoolean **v3;

  v3 = (__CFBoolean **)MEMORY[0x1E0C9AE50];
  if (a3 != 1)
    v3 = (__CFBoolean **)MEMORY[0x1E0C9AE40];
  self->super._clientWaitsForActivation = *v3;
}

- (void)setClient:(id)a3
{
  void *v5;
  id v6;
  char v7;
  BSObjCProtocol *client;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  BSMutableServiceInterface *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  if (v13)
  {
    NSClassFromString(CFSTR("BSObjCProtocol"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v15 = v10;
        v16 = 2114;
        v17 = v12;
        v18 = 2048;
        v19 = self;
        v20 = 2114;
        v21 = CFSTR("BSServiceInterface.m");
        v22 = 1024;
        v23 = 477;
        v24 = 2114;
        v25 = v9;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B3034);
    }

    __protocolsToRemove();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "flattenWithIgnoredInheritedProtocols:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    __vetProtocol(v6);
    v7 = BSEqualObjects();
  }
  else
  {
    __emptyProtocol();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = BSEqualObjects();
  }
  if ((v7 & 1) == 0)
  {
    v6 = v6;
    client = self->super._client;
    self->super._client = (BSObjCProtocol *)v6;

  }
}

- (void)setServer:(id)a3
{
  void *v5;
  id v6;
  char v7;
  BSObjCProtocol *server;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  BSMutableServiceInterface *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  if (v13)
  {
    NSClassFromString(CFSTR("BSObjCProtocol"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v15 = v10;
        v16 = 2114;
        v17 = v12;
        v18 = 2048;
        v19 = self;
        v20 = 2114;
        v21 = CFSTR("BSServiceInterface.m");
        v22 = 1024;
        v23 = 460;
        v24 = 2114;
        v25 = v9;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B329CLL);
    }

    __protocolsToRemove();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "flattenWithIgnoredInheritedProtocols:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    __vetProtocol(v6);
    v7 = BSEqualObjects();
  }
  else
  {
    __emptyProtocol();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = BSEqualObjects();
  }
  if ((v7 & 1) == 0)
  {
    v6 = v6;
    server = self->super._server;
    self->super._server = (BSObjCProtocol *)v6;

  }
}

- (void)setIdentifier:(id)a3
{
  NSString *v5;
  NSString *identifier;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BSMutableServiceInterface *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v8;
      v18 = 2114;
      v19 = v10;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BSServiceInterface.m");
      v24 = 1024;
      v25 = 454;
      v26 = 2114;
      v27 = v7;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C9F74);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v12;
      v18 = 2114;
      v19 = v14;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BSServiceInterface.m");
      v24 = 1024;
      v25 = 454;
      v26 = 2114;
      v27 = v11;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7CA074);
  }

  v5 = (NSString *)objc_msgSend(v15, "copy");
  identifier = self->super._identifier;
  self->super._identifier = v5;

}

@end
