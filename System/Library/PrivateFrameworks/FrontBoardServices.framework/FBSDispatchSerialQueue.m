@implementation FBSDispatchSerialQueue

- (void)assertBarrierOnQueue
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)performAsync:(id)a3
{
  if (a3)
    dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (void)performAsync:(id)a3 withHandoff:(id)a4
{
  id v6;
  dispatch_block_t block;

  block = a3;
  v6 = a4;
  if (block)
  {
    if (v6)
      xpc_dictionary_handoff_reply();
    else
      dispatch_async((dispatch_queue_t)self->_queue, block);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_initWithQueue:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)FBSSerialQueue;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

+ (id)_mainQueue
{
  objc_opt_self();
  if (_mainQueue_onceToken != -1)
    dispatch_once(&_mainQueue_onceToken, &__block_literal_global_27);
  return (id)_mainQueue_mainQueue;
}

void __36__FBSDispatchSerialQueue__mainQueue__block_invoke()
{
  FBSDispatchSerialQueue *v0;
  id *v1;
  void *v2;

  v0 = [FBSDispatchSerialQueue alloc];
  v1 = -[FBSDispatchSerialQueue _initWithQueue:]((id *)&v0->super.super.isa, MEMORY[0x1E0C80D38]);
  v2 = (void *)_mainQueue_mainQueue;
  _mainQueue_mainQueue = (uint64_t)v1;

  *(_BYTE *)(_mainQueue_mainQueue + 16) = 1;
}

- (void)performAfter:(double)a3 withBlock:(id)a4
{
  int64_t v5;
  dispatch_time_t v6;
  dispatch_block_t block;

  if (a4)
  {
    v5 = (uint64_t)(a3 * 1000000000.0);
    block = a4;
    v6 = dispatch_time(0, v5);
    dispatch_after(v6, (dispatch_queue_t)self->_queue, block);

  }
}

- (id)backingQueueIfExists
{
  return self->_queue;
}

- (unint64_t)hash
{
  return -[OS_dispatch_queue hash](self->_queue, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class()
    && -[OS_dispatch_queue isEqual:](self->_queue, "isEqual:", v4[1])
    && self->_main == *((unsigned __int8 *)v4 + 16);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_main)
    v5 = (id)objc_msgSend(v3, "appendBool:withName:", 1, CFSTR("main"));
  else
    v6 = (id)objc_msgSend(v3, "appendQueue:withName:", self->_queue, CFSTR("dispatchQueue"));
  objc_msgSend(v4, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
