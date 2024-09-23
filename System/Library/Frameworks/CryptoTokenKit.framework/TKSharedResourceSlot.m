@implementation TKSharedResourceSlot

- (id)resourceWithError:(id *)a3
{
  TKSharedResourceSlot *v4;
  TKSharedResource *WeakRetained;
  NSObject *idleTimer;
  void *object;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = self;
  objc_sync_enter(v4);
  WeakRetained = (TKSharedResource *)objc_loadWeakRetained((id *)&v4->_resource);
  if (!WeakRetained)
  {
    if (v4->_object)
    {
      idleTimer = v4->_idleTimer;
      if (!idleTimer)
      {
        TK_LOG_sharedrsc();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[TKSharedResourceSlot resourceWithError:].cold.1((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);

        goto LABEL_13;
      }
      dispatch_source_cancel(idleTimer);
      object = v4->_idleTimer;
      v4->_idleTimer = 0;
      goto LABEL_12;
    }
    -[TKSharedResourceSlot createObjectBlock](v4, "createObjectBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      object = v4->_object;
      v4->_object = (id)MEMORY[0x1E0C9AAB0];
LABEL_12:

      goto LABEL_13;
    }
    -[TKSharedResourceSlot createObjectBlock](v4, "createObjectBlock");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id *))v9)[2](v9, a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v4->_object;
    v4->_object = (id)v10;

    if (v4->_object)
    {
LABEL_13:
      WeakRetained = -[TKSharedResource initWithSlot:]([TKSharedResource alloc], "initWithSlot:", v4);
      objc_storeWeak((id *)&v4->_resource, WeakRetained);
      goto LABEL_14;
    }
    WeakRetained = 0;
  }
LABEL_14:
  objc_sync_exit(v4);

  return WeakRetained;
}

- (id)createObjectBlock
{
  return self->_createObjectBlock;
}

- (id)object
{
  return self->_object;
}

- (double)idleTimeout
{
  return self->_idleTimeout;
}

- (OS_dispatch_queue)idleQueue
{
  return self->_idleQueue;
}

- (TKSharedResourceSlot)initWithName:(id)a3
{
  id v5;
  TKSharedResourceSlot *v6;
  TKSharedResourceSlot *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *idleQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TKSharedResourceSlot;
  v6 = -[TKSharedResourceSlot init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("resourceslot:%@"), v7->_name);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);
    idleQueue = v7->_idleQueue;
    v7->_idleQueue = (OS_dispatch_queue *)v11;

  }
  return v7;
}

- (id)description
{
  id WeakRetained;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  if (self->_object)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_resource);
    v4 = CFSTR("ACTIVE");
    if (!WeakRetained)
      v4 = CFSTR("IDLE");
    v5 = v4;

  }
  else
  {
    v5 = CFSTR("EMPTY");
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@ %@ %@ %p o=%@>"), v8, self->_name, v5, self, self->_object);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)destroyObject
{
  void (**objectDestroyedBlock)(void);
  id object;

  objectDestroyedBlock = (void (**)(void))self->_objectDestroyedBlock;
  if (objectDestroyedBlock && self->_object)
    objectDestroyedBlock[2]();
  object = self->_object;
  self->_object = 0;

}

- (void)releaseResourceImmediatelly:(BOOL)a3
{
  TKSharedResourceSlot *v4;
  double v5;
  NSObject *v6;
  dispatch_source_t v7;
  OS_dispatch_source *idleTimer;
  double v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = self;
  objc_sync_enter(v4);
  objc_storeWeak((id *)&v4->_resource, 0);
  if (a3 || (-[TKSharedResourceSlot idleTimeout](v4, "idleTimeout"), v5 == 0.0))
  {
    -[TKSharedResourceSlot destroyObject](v4, "destroyObject");
  }
  else
  {
    -[TKSharedResourceSlot idleQueue](v4, "idleQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);
    idleTimer = v4->_idleTimer;
    v4->_idleTimer = (OS_dispatch_source *)v7;

    -[TKSharedResourceSlot idleTimeout](v4, "idleTimeout");
    v10 = (uint64_t)(v9 * 1000000000.0);
    v11 = v4->_idleTimer;
    v12 = dispatch_time(0, v10);
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, v10);
    objc_initWeak(&location, v4);
    v13 = v4->_idleTimer;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke;
    v14[3] = &unk_1E7089378;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v13, v14);
    dispatch_resume((dispatch_object_t)v4->_idleTimer);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v4);

}

void __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *isa;
  Class v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_sync_enter(v3);
    v4 = objc_loadWeakRetained((id *)&v3[2].isa);

    if (v4)
    {
      TK_LOG_sharedrsc();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke_cold_2((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

    }
    else
    {
      isa = v3[4].isa;
      if (isa)
      {
        dispatch_source_cancel(isa);
        v13 = v3[4].isa;
      }
      else
      {
        v13 = 0;
      }
      v3[4].isa = 0;

      -[NSObject destroyObject](v3, "destroyObject");
    }
    objc_sync_exit(v3);
  }
  else
  {
    TK_LOG_sharedrsc();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke_cold_1(v3);
  }

}

- (void)dealloc
{
  NSObject *idleTimer;
  OS_dispatch_source *v4;
  objc_super v5;

  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    dispatch_source_cancel(idleTimer);
    v4 = self->_idleTimer;
    self->_idleTimer = 0;

  }
  if (self->_object)
    -[TKSharedResourceSlot destroyObject](self, "destroyObject");
  v5.receiver = self;
  v5.super_class = (Class)TKSharedResourceSlot;
  -[TKSharedResourceSlot dealloc](&v5, sel_dealloc);
}

- (void)setCreateObjectBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)objectDestroyedBlock
{
  return self->_objectDestroyedBlock;
}

- (void)setObjectDestroyedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setIdleTimeout:(double)a3
{
  self->_idleTimeout = a3;
}

- (void)setIdleQueue:(id)a3
{
  objc_storeStrong((id *)&self->_idleQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleQueue, 0);
  objc_storeStrong(&self->_objectDestroyedBlock, 0);
  objc_storeStrong(&self->_createObjectBlock, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong(&self->_object, 0);
  objc_destroyWeak((id *)&self->_resource);
  objc_storeStrong((id *)&self->_name, 0);
}

void __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B9768000, log, OS_LOG_TYPE_DEBUG, "Idle callback detected, but slot is already gone, ignoring it", v1, 2u);
}

void __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B9768000, a2, a3, "%{public}@: got idle, but item is revived, ignoring", a5, a6, a7, a8, 2u);
}

- (void)resourceWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B9768000, a2, a3, "%@ activating from idle, but idle timer is unset", a5, a6, a7, a8, 2u);
}

@end
