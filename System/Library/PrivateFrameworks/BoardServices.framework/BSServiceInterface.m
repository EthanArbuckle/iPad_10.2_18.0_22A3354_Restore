@implementation BSServiceInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BSObjCProtocol)client
{
  return self->_client;
}

- (BSObjCProtocol)server
{
  return self->_server;
}

- (_QWORD)_initWithIdentifier:(void *)a3 server:(void *)a4 client:(uint64_t)a5 clientWaitsForActivation:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;
  objc_class *v34;
  void *v35;
  void *v36;
  id v37;
  objc_class *v38;
  void *v39;
  void *v40;
  id v41;
  objc_class *v42;
  void *v43;
  objc_super v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v12 = objc_opt_class();
    if (v12 != objc_opt_class())
    {
      v13 = objc_opt_class();
      if (v13 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSServiceInterface is not intended to be subclassed"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithIdentifier_server_client_clientWaitsForActivation_);
          v41 = (id)objc_claimAutoreleasedReturnValue();
          v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v46 = v41;
          v47 = 2114;
          v48 = v43;
          v49 = 2048;
          v50 = a1;
          v51 = 2114;
          v52 = CFSTR("BSServiceInterface.m");
          v53 = 1024;
          v54 = 296;
          v55 = 2114;
          v56 = v40;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7A6EFCLL);
      }
    }
    v14 = v10;
    NSClassFromString(CFSTR("BSObjCProtocol"));
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_server_client_clientWaitsForActivation_);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v46 = v25;
        v47 = 2114;
        v48 = v27;
        v49 = 2048;
        v50 = a1;
        v51 = 2114;
        v52 = CFSTR("BSServiceInterface.m");
        v53 = 1024;
        v54 = 297;
        v55 = 2114;
        v56 = v24;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A6B08);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_server_client_clientWaitsForActivation_);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v46 = v29;
        v47 = 2114;
        v48 = v31;
        v49 = 2048;
        v50 = a1;
        v51 = 2114;
        v52 = CFSTR("BSServiceInterface.m");
        v53 = 1024;
        v54 = 297;
        v55 = 2114;
        v56 = v28;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A6C08);
    }

    v15 = v11;
    NSClassFromString(CFSTR("BSObjCProtocol"));
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_server_client_clientWaitsForActivation_);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v46 = v33;
        v47 = 2114;
        v48 = v35;
        v49 = 2048;
        v50 = a1;
        v51 = 2114;
        v52 = CFSTR("BSServiceInterface.m");
        v53 = 1024;
        v54 = 298;
        v55 = 2114;
        v56 = v32;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A6D08);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_server_client_clientWaitsForActivation_);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v46 = v37;
        v47 = 2114;
        v48 = v39;
        v49 = 2048;
        v50 = a1;
        v51 = 2114;
        v52 = CFSTR("BSServiceInterface.m");
        v53 = 1024;
        v54 = 298;
        v55 = 2114;
        v56 = v36;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A6E08);
    }

    v44.receiver = a1;
    v44.super_class = (Class)BSServiceInterface;
    v16 = objc_msgSendSuper2(&v44, sel_init);
    if (v16)
    {
      v17 = objc_msgSend(v9, "copy");
      v18 = (void *)v16[1];
      v16[1] = v17;

      v19 = objc_msgSend(v14, "copy");
      v20 = (void *)v16[2];
      v16[2] = v19;

      v21 = objc_msgSend(v15, "copy");
      v22 = (void *)v16[3];
      v16[3] = v21;

      v16[4] = a5;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int64_t)clientMessagingExpectation
{
  __CFBoolean *clientWaitsForActivation;
  _BOOL4 v4;
  void *v5;

  clientWaitsForActivation = self->_clientWaitsForActivation;
  if (clientWaitsForActivation)
  {
    return CFBooleanGetValue(clientWaitsForActivation) != 0;
  }
  else
  {
    -[BSObjCProtocol methods](self->_server, "methods");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") == 0;

  }
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (BSServiceInterface)interfaceWithServer:(id)a3 client:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BSServiceInterface *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  _QWORD *v19;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  void *v29;
  id v30;
  objc_class *v31;
  void *v32;
  void *v33;
  id v34;
  objc_class *v35;
  void *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  NSClassFromString(CFSTR("BSObjCProtocol"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v38 = v22;
      v39 = 2114;
      v40 = v24;
      v41 = 2048;
      v42 = a1;
      v43 = 2114;
      v44 = CFSTR("BSServiceInterface.m");
      v45 = 1024;
      v46 = 357;
      v47 = 2114;
      v48 = v21;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B2A38);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v38 = v26;
      v39 = 2114;
      v40 = v28;
      v41 = 2048;
      v42 = a1;
      v43 = 2114;
      v44 = CFSTR("BSServiceInterface.m");
      v45 = 1024;
      v46 = 357;
      v47 = 2114;
      v48 = v25;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B2B38);
  }

  __protocolsToRemove();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flattenWithIgnoredInheritedProtocols:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  __vetProtocol(v11);
  v12 = v8;
  NSClassFromString(CFSTR("BSObjCProtocol"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v38 = v30;
      v39 = 2114;
      v40 = v32;
      v41 = 2048;
      v42 = a1;
      v43 = 2114;
      v44 = CFSTR("BSServiceInterface.m");
      v45 = 1024;
      v46 = 361;
      v47 = 2114;
      v48 = v29;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B2C38);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v38 = v34;
      v39 = 2114;
      v40 = v36;
      v41 = 2048;
      v42 = a1;
      v43 = 2114;
      v44 = CFSTR("BSServiceInterface.m");
      v45 = 1024;
      v46 = 361;
      v47 = 2114;
      v48 = v33;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B2D38);
  }

  __protocolsToRemove();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "flattenWithIgnoredInheritedProtocols:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  __vetProtocol(v14);
  v15 = [BSServiceInterface alloc];
  objc_msgSend(v11, "methods");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  v18 = (uint64_t *)MEMORY[0x1E0C9AE50];
  if (v17)
    v18 = (uint64_t *)MEMORY[0x1E0C9AE40];
  v19 = -[BSServiceInterface _initWithIdentifier:server:client:clientWaitsForActivation:](v15, 0, v11, v14, *v18);

  return (BSServiceInterface *)v19;
}

- (BSServiceInterface)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSServiceInterface *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceInterface *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on BSServiceInterface"));
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
    v16 = CFSTR("BSServiceInterface.m");
    v17 = 1024;
    v18 = 291;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSServiceInterface *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)invertInterface:(id)a3
{
  void (**v4)(id, _QWORD *);
  _QWORD *v5;
  _QWORD *v6;

  v4 = (void (**)(id, _QWORD *))a3;
  if (v4)
  {
    v5 = -[BSServiceInterface _initWithIdentifier:server:client:clientWaitsForActivation:]([BSMutableServiceInterface alloc], self->_identifier, self->_client, self->_server, 0);
    v4[2](v4, v5);
    v6 = (_QWORD *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = -[BSServiceInterface _initWithIdentifier:server:client:clientWaitsForActivation:]([BSServiceInterface alloc], self->_identifier, self->_client, self->_server, 0);
  }

  return v6;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BSServiceInterface _initWithIdentifier:server:client:clientWaitsForActivation:](+[BSMutableServiceInterface allocWithZone:](BSMutableServiceInterface, "allocWithZone:", a3), self->_identifier, self->_server, self->_client, (uint64_t)self->_clientWaitsForActivation);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSServiceInterface succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_identifier, 0);
  -[BSObjCProtocol name](self->_server, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("server"));

  -[BSObjCProtocol name](self->_client, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("client"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSServiceInterface descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  BSServiceInterface *v11;

  v4 = a3;
  -[BSServiceInterface succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", self->_identifier, 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__BSServiceInterface_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E390D478;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

const __CFBoolean *__60__BSServiceInterface_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  const __CFBoolean *result;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("server"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("client"));
  result = *(const __CFBoolean **)(*(_QWORD *)(a1 + 40) + 32);
  if (result)
    return (const __CFBoolean *)(id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", CFBooleanGetValue(result) != 0, CFSTR("clientWaitsForActivation"));
  return result;
}

- (unint64_t)hash
{
  NSString *identifier;
  uint64_t v5;

  identifier = self->_identifier;
  if (identifier)
    return -[NSString hash](identifier, "hash");
  v5 = -[BSObjCProtocol hash](self->_server, "hash");
  return -[BSObjCProtocol hash](self->_client, "hash") ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  BSServiceInterface *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  BOOL v8;

  v4 = (BSServiceInterface *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if ((v5 == objc_opt_class() || (v6 = objc_opt_class(), v6 == objc_opt_class()))
      && BSEqualStrings()
      && BSEqualObjects()
      && BSEqualObjects())
    {
      v7 = -[BSServiceInterface clientMessagingExpectation](self, "clientMessagingExpectation");
      v8 = v7 == -[BSServiceInterface clientMessagingExpectation](v4, "clientMessagingExpectation");
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)debugDescription
{
  return (NSString *)-[BSServiceInterface descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

@end
