@implementation BELayerHierarchyHandle

- (BELayerHierarchyHandle)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BELayerHierarchyHandle *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BELayerHierarchyHandle *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("init is not allowed on BELayerHierarchyHandle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
    v16 = CFSTR("BELayerHierarchyHandle.m");
    v17 = 1024;
    v18 = 25;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_23305C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BELayerHierarchyHandle *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (_DWORD)_initWithPID:(int)a3 contextID:
{
  void *v5;
  objc_super v6;

  if (result)
  {
    if (a2 <= 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid pid"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BELayerHierarchyHandle _initWithPID:contextID:].cold.1(sel__initWithPID_contextID_);
      objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      result = (_DWORD *)_bs_set_crash_log_message();
      __break(0);
    }
    else
    {
      v6.receiver = result;
      v6.super_class = (Class)BELayerHierarchyHandle;
      result = objc_msgSendSuper2(&v6, sel_init);
      if (result)
      {
        result[2] = a2;
        result[3] = a3;
      }
    }
  }
  return result;
}

+ (BELayerHierarchyHandle)handleWithXPCRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t value;
  uint64_t v15;

  v5 = a3;
  v6 = v5;
  if (v5 && MEMORY[0x23492E24C](v5) == MEMORY[0x24BDACFA0] && xpc_dictionary_get_count(v6) == 2)
  {
    xpc_dictionary_get_value(v6, "pid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v6, "cid");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7
      && v8
      && (v10 = MEMORY[0x23492E24C](v7), v11 = MEMORY[0x24BDACFF8], v10 == MEMORY[0x24BDACFF8])
      && MEMORY[0x23492E24C](v9) == v11
      && (value = xpc_uint64_get_value(v7), v15 = xpc_uint64_get_value(v9), value - 0x80000000 >= 0xFFFFFFFF80000001)
      && v15
      && !HIDWORD(v15))
    {
      v12 = -[BELayerHierarchyHandle _initWithPID:contextID:]([BELayerHierarchyHandle alloc], value, v15);
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4866, 0);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4866, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return (BELayerHierarchyHandle *)v12;
}

- (id)createXPCRepresentation
{
  xpc_object_t empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "pid", self->_pid);
  xpc_dictionary_set_uint64(empty, "cid", self->_contextID);
  return empty;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BELayerHierarchyHandle)initWithCoder:(id)a3
{
  id v5;
  int v6;
  int v7;
  BELayerHierarchyHandle *v8;
  BELayerHierarchyHandle *result;
  void *v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("pid"));
    v7 = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("cid"));
    v8 = 0;
    if (v6)
    {
      if (v7)
      {
        self = -[BELayerHierarchyHandle _initWithPID:contextID:](self, v6, v7);
        v8 = self;
      }
    }

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BELayerHierarchyHandle only supports NSXPCCoder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BELayerHierarchyHandle initWithCoder:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (BELayerHierarchyHandle *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "encodeInt32:forKey:", self->_pid, CFSTR("pid"));
    objc_msgSend(v6, "encodeInt32:forKey:", self->_contextID, CFSTR("cid"));

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BELayerHierarchyHandle only supports NSXPCCoder"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BELayerHierarchyHandle encodeWithCoder:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (uint64_t)_pid
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

- (uint64_t)_contextID
{
  if (result)
    return *(unsigned int *)(result + 12);
  return result;
}

- (void)_initWithPID:(const char *)a1 contextID:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23305C000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23305C000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)encodeWithCoder:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23305C000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
