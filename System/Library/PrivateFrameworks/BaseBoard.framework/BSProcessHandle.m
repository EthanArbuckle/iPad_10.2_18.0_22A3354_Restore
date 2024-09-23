@implementation BSProcessHandle

- (BSProcessHandle)initWithXPCDictionary:(id)a3
{
  id v4;
  BSProcessHandle *v5;
  const char *v6;
  NSString *name;
  const char *v8;
  NSString *bundleID;
  objc_class *v10;
  BSAuditToken *auditToken;
  objc_class *v12;
  BSMachPortTaskNameRight *taskNameRight;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BSProcessHandle;
  v5 = -[BSProcessHandle init](&v15, sel_init);
  if (v5)
  {
    v5->_pid = xpc_dictionary_get_int64(v4, "pid");
    v6 = BSCreateDeserializedStringFromXPCDictionaryWithKey(v4, "name");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = BSCreateDeserializedStringFromXPCDictionaryWithKey(v4, "bundleID");
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    v10 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey(v4, "auditToken");
    auditToken = v5->_auditToken;
    v5->_auditToken = (BSAuditToken *)v10;

    v12 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey(v4, "taskNameRight");
    taskNameRight = v5->_taskNameRight;
    v5->_taskNameRight = (BSMachPortTaskNameRight *)v12;

  }
  return v5;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (BOOL)hasEntitlement:(id)a3
{
  return -[BSAuditToken hasEntitlement:](self->_auditToken, "hasEntitlement:", a3);
}

- (_DWORD)_initWithPID:(void *)a1
{
  _DWORD *v3;
  _DWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)BSProcessHandle;
  v3 = objc_msgSendSuper2(&v9, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[3] = a2;
    BSProcessNameForPID(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)*((_QWORD *)v4 + 4);
    *((_QWORD *)v4 + 4) = v6;

  }
  return v4;
}

- (id)valueForEntitlement:(id)a3
{
  -[BSAuditToken valueForEntitlement:](self->_auditToken, "valueForEntitlement:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  return self->_name;
}

- (NSString)description
{
  return (NSString *)-[BSProcessHandle descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  xpc_dictionary_set_int64(v5, "pid", self->_pid);
  BSSerializeStringToXPCDictionaryWithKey(self->_name, v5, "name");
  -[BSProcessHandle bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeStringToXPCDictionaryWithKey(v4, v5, "bundleID");

  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey(self->_auditToken, v5, "auditToken");
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey(self->_taskNameRight, v5, "taskNameRight");

}

- (NSString)bundleIdentifier
{
  return (NSString *)-[BSProcessHandle _bundleIDGeneratingIfNeeded:](self, 1);
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  uint64_t v4;
  unint64_t name;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  char v13;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSProcessHandle _bundleIDGeneratingIfNeeded:](self, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  name = (unint64_t)self->_name;
  if (v4 | name)
  {
    if (!name)
      name = v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%d"), name, self->_pid);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, 0);

  }
  else
  {
    v6 = (id)objc_msgSend(v3, "appendInt:withName:", self->_pid, CFSTR("pid"));
  }
  v13 = 0;
  v9 = -[BSProcessHandle _isRunningWithCertainty:]((uint64_t)self, &v13);
  if (v13)
    v10 = (id)objc_msgSend(v3, "appendBool:withName:", v9, CFSTR("valid"));
  else
    v11 = (id)objc_msgSend(v3, "appendObject:withName:", CFSTR("(unknown)"), CFSTR("valid"));

  return v3;
}

- (id)_bundleIDGeneratingIfNeeded:(void *)a1
{
  id *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    if (a2 && !v3[2] && !*((_BYTE *)v3 + 8))
    {
      *((_BYTE *)v3 + 8) = 1;
      v4 = v3[3];
      if (v4)
        -[BSAuditToken _bundleIDGeneratingIfNeeded:](v4, 1);
      else
        BSBundleIDForPID(*((unsigned int *)v3 + 3));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v3[2];
      v3[2] = (id)v5;

    }
    v7 = v3[2];
    objc_sync_exit(v3);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (uint64_t)_isRunningWithCertainty:(uint64_t)result
{
  uint64_t v3;
  int v4;
  void *v5;
  char v6;

  if (result)
  {
    v3 = result;
    v4 = *(_DWORD *)(result + 12);
    if (v4 < 1)
    {
      result = 0;
    }
    else if (v4 == getpid())
    {
      result = 1;
    }
    else
    {
      v5 = *(void **)(v3 + 40);
      if (v5)
      {
        result = objc_msgSend(v5, "isUsable");
      }
      else
      {
        if (!BSSandboxCanGetProcessInfo(*(_DWORD *)(v3 + 12)))
        {
          v6 = 0;
          result = 1;
          if (!a2)
            return result;
LABEL_11:
          *a2 = v6;
          return result;
        }
        result = BSPIDExists(*(_DWORD *)(v3 + 12));
      }
    }
    v6 = 1;
    if (!a2)
      return result;
    goto LABEL_11;
  }
  return result;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSProcessHandle descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  -[BSProcessHandle succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isValid
{
  return -[BSProcessHandle _isRunningWithCertainty:]((uint64_t)self, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;

  v4 = a3;
  LODWORD(self) = -[BSProcessHandle pid](self, "pid");
  LOBYTE(self) = (_DWORD)self == objc_msgSend(v4, "pid");

  return (char)self;
}

- (int)pid
{
  return self->_pid;
}

+ (id)processHandleForAuditToken:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  id *v8;

  v6 = a3;
  v7 = a4;
  v8 = -[BSProcessHandle _initWithAuditToken:bundleID:](objc_alloc((Class)a1), v6, v7);

  return v8;
}

+ (id)processHandleForNSXPCConnection:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "processIdentifier");
  if (v5 == getpid())
  {
    objc_msgSend(a1, "processHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc((Class)a1);
    +[BSAuditToken tokenFromNSXPCConnection:](BSAuditToken, "tokenFromNSXPCConnection:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[BSProcessHandle _initWithAuditToken:bundleID:](v7, v8, 0);

  }
  return v6;
}

void __32__BSProcessHandle_processHandle__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_24;
  _MergedGlobals_24 = (uint64_t)v1;

}

- (BSProcessHandle)init
{
  uint64_t v3;
  BSProcessHandle *v4;
  uint64_t v5;
  BSMachPortTaskNameRight *taskNameRight;
  uint64_t v7;
  BSAuditToken *auditToken;
  void *v9;
  uint64_t v10;
  NSString *bundleID;

  v3 = getpid();
  v4 = (BSProcessHandle *)-[BSProcessHandle _initWithPID:](self, v3);
  if (v4)
  {
    +[BSMachPortTaskNameRight taskNameForPID:](BSMachPortTaskNameRight, "taskNameForPID:", v4->_pid);
    v5 = objc_claimAutoreleasedReturnValue();
    taskNameRight = v4->_taskNameRight;
    v4->_taskNameRight = (BSMachPortTaskNameRight *)v5;

    -[BSMachPortTaskNameRight auditToken](v4->_taskNameRight, "auditToken");
    v7 = objc_claimAutoreleasedReturnValue();
    auditToken = v4->_auditToken;
    v4->_auditToken = (BSAuditToken *)v7;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    bundleID = v4->_bundleID;
    v4->_bundleID = (NSString *)v10;

  }
  return v4;
}

- (id)_initWithAuditToken:(void *)a3 bundleID:
{
  id v6;
  id v7;
  id v8;
  id *v9;
  id *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v8 = v6;
    if (v8)
    {
      NSClassFromString(CFSTR("BSAuditToken"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSAuditTokenClass]"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithAuditToken_bundleID_);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v22 = v18;
          v23 = 2114;
          v24 = v20;
          v25 = 2048;
          v26 = a1;
          v27 = 2114;
          v28 = CFSTR("BSProcessHandle.m");
          v29 = 1024;
          v30 = 99;
          v31 = 2114;
          v32 = v17;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1B59E8);
      }
    }

    v9 = (id *)-[BSProcessHandle _initWithPID:](a1, objc_msgSend(v8, "pid"));
    v10 = v9;
    if (v9)
    {
      objc_storeStrong(v9 + 3, a2);
      +[BSMachPortTaskNameRight taskNameForPID:](BSMachPortTaskNameRight, "taskNameForPID:", *((unsigned int *)v10 + 3));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v10[5];
      v10[5] = (id)v11;

      v13 = v7;
      if (!v7)
      {
        -[BSAuditToken _bundleIDGeneratingIfNeeded:](v10[3], 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v14 = objc_msgSend(v13, "copy");
      v15 = v10[2];
      v10[2] = (id)v14;

      if (!v7)
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)processHandleForXPCConnection:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  v5 = BSPIDForXPCConnection(v4);
  if (v5 == getpid())
  {
    objc_msgSend(a1, "processHandle");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc((Class)a1);
    _BSBundleIDForXPCConnectionAndIKnowWhatImDoingISwear(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    v10 = v8;
    if (v7)
    {
      v11 = BSPIDForXPCConnection(v9);
      v6 = (uint64_t)-[BSProcessHandle _initWithPID:](v7, v11);
      if (v6)
      {
        +[BSMachPortTaskNameRight taskNameForPID:](BSMachPortTaskNameRight, "taskNameForPID:", *(unsigned int *)(v6 + 12));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(v6 + 40);
        *(_QWORD *)(v6 + 40) = v12;

        +[BSAuditToken tokenFromXPCConnection:](BSAuditToken, "tokenFromXPCConnection:", v9);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(v6 + 24);
        *(_QWORD *)(v6 + 24) = v14;

        v16 = v10;
        if (!v10)
        {
          -[BSAuditToken _bundleIDGeneratingIfNeeded:](*(void **)(v6 + 24), 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v17 = objc_msgSend(v16, "copy");
        v18 = *(void **)(v6 + 16);
        *(_QWORD *)(v6 + 16) = v17;

        if (!v10)
      }
    }
    else
    {
      v6 = 0;
    }

  }
  return (id)v6;
}

+ (id)processHandle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__BSProcessHandle_processHandle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD399D0 != -1)
    dispatch_once(&qword_1ECD399D0, block);
  return (id)_MergedGlobals_24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskNameRight, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[BSMachPortRight invalidate](self->_taskNameRight, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BSProcessHandle;
  -[BSProcessHandle dealloc](&v3, sel_dealloc);
}

+ (id)processHandleForAuditToken:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "pid");
  if (v5 == getpid())
  {
    objc_msgSend(a1, "processHandle");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v4)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v6 = (uint64_t)-[BSProcessHandle _initWithAuditToken:bundleID:](objc_alloc((Class)a1), v4, 0);
  }
  v7 = (void *)v6;
LABEL_6:

  return v7;
}

+ (id)processHandleForPID:(int)a3
{
  return -[BSProcessHandle _initWithPID:bundleID:](objc_alloc((Class)a1), *(uint64_t *)&a3, 0);
}

- (_DWORD)_initWithPID:(void *)a3 bundleID:
{
  id v5;
  _DWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a3;
  if (a1)
  {
    v6 = -[BSProcessHandle _initWithPID:](a1, a2);
    if (v6)
    {
      +[BSMachPortTaskNameRight taskNameForPID:](BSMachPortTaskNameRight, "taskNameForPID:", v6[3]);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)*((_QWORD *)v6 + 5);
      *((_QWORD *)v6 + 5) = v7;

      objc_msgSend(*((id *)v6 + 5), "auditToken");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)*((_QWORD *)v6 + 3);
      *((_QWORD *)v6 + 3) = v9;

      v11 = v5;
      if (!v5)
      {
        -[BSAuditToken _bundleIDGeneratingIfNeeded:](*((void **)v6 + 3), 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = objc_msgSend(v11, "copy");
      v13 = (void *)*((_QWORD *)v6 + 2);
      *((_QWORD *)v6 + 2) = v12;

      if (!v5)
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)processHandleForTaskNameRight:(id)a3
{
  id v4;
  _DWORD *v5;

  v4 = a3;
  v5 = -[BSProcessHandle _initWithTaskNameRight:bundleID:](objc_alloc((Class)a1), v4, 0);

  return v5;
}

- (_DWORD)_initWithTaskNameRight:(void *)a3 bundleID:
{
  id v5;
  id v6;
  id v7;
  _DWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = v5;
    if (v7)
    {
      NSClassFromString(CFSTR("BSMachPortTaskNameRight"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSMachPortTaskNameRightClass]"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithTaskNameRight_bundleID_);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v22 = v18;
          v23 = 2114;
          v24 = v20;
          v25 = 2048;
          v26 = a1;
          v27 = 2114;
          v28 = CFSTR("BSProcessHandle.m");
          v29 = 1024;
          v30 = 111;
          v31 = 2114;
          v32 = v17;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1F5D88);
      }
    }

    v8 = -[BSProcessHandle _initWithPID:](a1, objc_msgSend(v7, "pid"));
    if (v8)
    {
      v9 = objc_msgSend(v7, "copy");
      v10 = (void *)*((_QWORD *)v8 + 5);
      *((_QWORD *)v8 + 5) = v9;

      objc_msgSend(*((id *)v8 + 5), "auditToken");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)*((_QWORD *)v8 + 3);
      *((_QWORD *)v8 + 3) = v11;

      v13 = v6;
      if (!v6)
      {
        -[BSAuditToken _bundleIDGeneratingIfNeeded:](*((void **)v8 + 3), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v14 = objc_msgSend(v13, "copy");
      v15 = (void *)*((_QWORD *)v8 + 2);
      *((_QWORD *)v8 + 2) = v14;

      if (!v6)
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)processHandleForPID:(int)a3 bundleID:(id)a4
{
  uint64_t v4;
  id v6;
  _DWORD *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = -[BSProcessHandle _initWithPID:bundleID:](objc_alloc((Class)a1), v4, v6);

  return v7;
}

+ (id)processHandleForTaskNameRight:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  _DWORD *v8;

  v6 = a3;
  v7 = a4;
  v8 = -[BSProcessHandle _initWithTaskNameRight:bundleID:](objc_alloc((Class)a1), v6, v7);

  return v8;
}

- (NSString)bundlePath
{
  return 0;
}

- (NSString)jobLabel
{
  return 0;
}

- (unint64_t)hash
{
  return -[BSProcessHandle pid](self, "pid");
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSProcessHandle succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSProcessHandle)initWithCoder:(id)a3
{
  id v4;
  BSProcessHandle *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  BSAuditToken *auditToken;
  uint64_t v12;
  BSMachPortTaskNameRight *taskNameRight;
  BSProcessHandle *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)BSProcessHandle;
    v5 = -[BSProcessHandle init](&v21, sel_init);
    if (v5)
    {
      v5->_pid = objc_msgSend(v4, "decodeIntForKey:", CFSTR("pid"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
      v6 = objc_claimAutoreleasedReturnValue();
      name = v5->_name;
      v5->_name = (NSString *)v6;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
      v8 = objc_claimAutoreleasedReturnValue();
      bundleID = v5->_bundleID;
      v5->_bundleID = (NSString *)v8;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
      v10 = objc_claimAutoreleasedReturnValue();
      auditToken = v5->_auditToken;
      v5->_auditToken = (BSAuditToken *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("taskNameRight"));
      v12 = objc_claimAutoreleasedReturnValue();
      taskNameRight = v5->_taskNameRight;
      v5->_taskNameRight = (BSMachPortTaskNameRight *)v12;

    }
    self = v5;
    v14 = self;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("An %@ can only be decoded with an instance of NSXPCCoder; attempting to decode with %@"),
      v17,
      v19);

    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "encodeInt:forKey:", self->_pid, CFSTR("pid"));
    objc_msgSend(v10, "encodeObject:forKey:", self->_name, CFSTR("name"));
    -[BSProcessHandle bundleIdentifier](self, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("bundleID"));

    objc_msgSend(v10, "encodeObject:forKey:", self->_auditToken, CFSTR("auditToken"));
    objc_msgSend(v10, "encodeObject:forKey:", self->_taskNameRight, CFSTR("taskNameRight"));
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("An %@ can only be encoded with an instance of NSXPCCoder; attempting to encode with %@"),
      v7,
      v9);

  }
}

- (BSMachPortTaskNameRight)taskNameRight
{
  return self->_taskNameRight;
}

@end
