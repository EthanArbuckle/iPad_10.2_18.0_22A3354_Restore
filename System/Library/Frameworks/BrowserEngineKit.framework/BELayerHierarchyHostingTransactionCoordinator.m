@implementation BELayerHierarchyHostingTransactionCoordinator

- (BELayerHierarchyHostingTransactionCoordinator)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BELayerHierarchyHostingTransactionCoordinator *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BELayerHierarchyHostingTransactionCoordinator *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("init is not allowed on BELayerHierarchyHostingTransactionCoordinator"));
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
    v16 = CFSTR("BELayerHierarchyHostingTransactionCoordinator.m");
    v17 = 1024;
    v18 = 38;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_23305C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BELayerHierarchyHostingTransactionCoordinator *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithFence:(id)a3
{
  id v5;
  BELayerHierarchyHostingTransactionCoordinator *v6;
  BELayerHierarchyHostingTransactionCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BELayerHierarchyHostingTransactionCoordinator;
  v6 = -[BELayerHierarchyHostingTransactionCoordinator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fence, a3);

  return v7;
}

- (void)dealloc
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
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

- (void)_addContext:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  if (!a1)
  {
LABEL_7:

    return;
  }
  v8 = v3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
  if (!*(_BYTE *)(a1 + 36))
  {
    v4 = *(void **)(a1 + 16);
    if (v4)
    {
      objc_msgSend(v4, "addObject:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v8);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

    }
    objc_msgSend(v8, "addFence:", *(_QWORD *)(a1 + 8));
    v3 = v8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ cannot add to coordinator after commit"), a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[BELayerHierarchyHostingTransactionCoordinator _addContext:].cold.1(sel__addContext_);
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)_addContextForHostingView:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (!a1)
  {
LABEL_9:

    return;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
  if (!*(_BYTE *)(a1 + 36))
  {
    v3 = (void *)MEMORY[0x23492DCC4]();
    objc_msgSend(v9, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_boundContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[BELayerHierarchyHostingTransactionCoordinator _addContext:](a1, v5);
    }
    else
    {
      objc_msgSend(v9, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        -[BELayerHierarchyHostingTransactionCoordinator _addContext:](a1, v7);

    }
    objc_autoreleasePoolPop(v3);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ cannot add hostingView after commit"), a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[BELayerHierarchyHostingTransactionCoordinator _addContextForHostingView:].cold.1();
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

+ (id)coordinatorWithError:(id *)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDE56A8], "newFenceFromDefaultServer");
  if (v4)
  {
    v5 = -[BELayerHierarchyHostingTransactionCoordinator _initWithFence:]([BELayerHierarchyHostingTransactionCoordinator alloc], "_initWithFence:", v4);
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 1, 0);
    v5 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)coordinatorWithXPCRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDE56A8], "handleFromXPCRepresentation:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "isUsable"))
    {
      v8 = -[BELayerHierarchyHostingTransactionCoordinator _initWithFence:]([BELayerHierarchyHostingTransactionCoordinator alloc], "_initWithFence:", v7);
    }
    else
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 60, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "invalidate");
      v8 = 0;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4866, 0);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)createXPCRepresentation
{
  return (id)-[CAFenceHandle createXPCRepresentation](self->_fence, "createXPCRepresentation");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BELayerHierarchyHostingTransactionCoordinator)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BELayerHierarchyHostingTransactionCoordinator *v7;
  BELayerHierarchyHostingTransactionCoordinator *v8;
  BELayerHierarchyHostingTransactionCoordinator *result;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fence"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "isUsable"))
    {
      v7 = (BELayerHierarchyHostingTransactionCoordinator *)-[BELayerHierarchyHostingTransactionCoordinator _initWithFence:](self, "_initWithFence:", v6);
      v8 = v7;
    }
    else
    {
      v7 = -[BELayerHierarchyHostingTransactionCoordinator _initWithFence:](self, "_initWithFence:", v6);
      -[BELayerHierarchyHostingTransactionCoordinator commit](v7, "commit");
      v8 = 0;
    }

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BELayerHierarchyHandle only supports NSXPCCoder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BELayerHierarchyHostingTransactionCoordinator initWithCoder:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (BELayerHierarchyHostingTransactionCoordinator *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "encodeObject:forKey:", self->_fence, CFSTR("fence"));

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BELayerHierarchyHandle only supports NSXPCCoder"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BELayerHierarchyHostingTransactionCoordinator encodeWithCoder:].cold.1();
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)addLayerHierarchy:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  os_unfair_lock_lock(&self->_commitLock);
  -[BELayerHierarchy _context]((uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BELayerHierarchyHostingTransactionCoordinator _addContext:]((uint64_t)self, v5);
  os_unfair_lock_unlock(&self->_commitLock);
}

- (void)addLayerHierarchyHostingView:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *commitLock_hostingViews;
  NSMutableSet *v6;

  v4 = (NSMutableSet *)a3;
  BSDispatchQueueAssertMain();
  os_unfair_lock_lock(&self->_commitLock);
  -[BELayerHierarchyHostingTransactionCoordinator _addContextForHostingView:]((uint64_t)self, v4);
  commitLock_hostingViews = self->_commitLock_hostingViews;
  if (commitLock_hostingViews)
  {
    -[NSMutableSet addObject:](commitLock_hostingViews, "addObject:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v4);
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();

    v4 = self->_commitLock_hostingViews;
    self->_commitLock_hostingViews = v6;
  }

  os_unfair_lock_unlock(&self->_commitLock);
}

- (void)commit
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitLock_hostingViews, 0);
  objc_storeStrong((id *)&self->_commitLock_contexts, 0);
  objc_storeStrong((id *)&self->_fence, 0);
}

- (void)_addContext:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_23305C000, MEMORY[0x24BDACB70], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_addContextForHostingView:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
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

- (void)initWithCoder:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
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

- (void)encodeWithCoder:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
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
