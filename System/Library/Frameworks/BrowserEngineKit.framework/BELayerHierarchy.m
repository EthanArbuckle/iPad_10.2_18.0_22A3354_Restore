@implementation BELayerHierarchy

- (BELayerHierarchy)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BELayerHierarchy *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BELayerHierarchy *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("init is not allowed on BELayerHierarchy"));
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
    v16 = CFSTR("BELayerHierarchy.m");
    v17 = 1024;
    v18 = 29;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_23305C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BELayerHierarchy *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("BELayerHierarchy.m");
  v16 = 1024;
  v17 = 35;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_23305C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (BELayerHierarchy)initWithContext:(id)a3
{
  id v5;
  BELayerHierarchy *v6;
  BELayerHierarchy *v7;
  uint64_t v8;
  BSAtomicSignal *invalidationSignal;
  BELayerHierarchyHandle *v10;
  pid_t v11;
  BELayerHierarchyHandle *v12;
  BELayerHierarchyHandle *handle;
  objc_super v15;

  v5 = a3;
  BSDispatchQueueAssertMain();
  v15.receiver = self;
  v15.super_class = (Class)BELayerHierarchy;
  v6 = -[BELayerHierarchy init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = objc_opt_new();
    invalidationSignal = v7->_invalidationSignal;
    v7->_invalidationSignal = (BSAtomicSignal *)v8;

    v10 = [BELayerHierarchyHandle alloc];
    v11 = getpid();
    v12 = (BELayerHierarchyHandle *)-[BELayerHierarchyHandle _initWithPID:contextID:](v10, v11, -[CAContext contextId](v7->_context, "contextId"));
    handle = v7->_handle;
    v7->_handle = v12;

  }
  return v7;
}

+ (id)layerHierarchyWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BELayerHierarchy *v7;

  v5 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x24BDE5658], "remoteContextWithOptions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[BELayerHierarchy initWithContext:]([BELayerHierarchy alloc], "initWithContext:", v6);
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 1, 0);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)layerHierarchyWithError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BDE58D0];
  v8[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BELayerHierarchy layerHierarchyWithOptions:error:](BELayerHierarchy, "layerHierarchyWithOptions:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CALayer)layer
{
  BSDispatchQueueAssertMain();
  return (CALayer *)-[CAContext layer](self->_context, "layer");
}

- (void)setLayer:(id)a3
{
  id v4;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[CAContext setLayer:](self->_context, "setLayer:", v4);

}

- (void)invalidate
{
  BSDispatchQueueAssertMain();
  if (-[BSAtomicSignal signal](self->_invalidationSignal, "signal"))
    -[CAContext invalidate](self->_context, "invalidate");
}

- (uint64_t)_context
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (BELayerHierarchyHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_invalidationSignal, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
