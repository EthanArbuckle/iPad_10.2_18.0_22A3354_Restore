@implementation EFCoalescer

- (EFCoalescer)initWithCoalescingAction:(id)a3
{
  id v4;
  EFCoalescer *v5;
  EFCoalescer *v6;
  uint64_t v7;
  id coalescerAction;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  dispatch_source_t v14;
  OS_dispatch_source *coalescer;
  NSObject *v16;
  _QWORD handler[4];
  id v19;
  id location;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EFCoalescer;
  v5 = -[EFCoalescer init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    coalescerAction = v6->_coalescerAction;
    v6->_coalescerAction = (id)v7;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v6);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -15);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    v14 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, (dispatch_queue_t)v6->_queue);
    coalescer = v6->_coalescer;
    v6->_coalescer = (OS_dispatch_source *)v14;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v16 = v6->_coalescer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __40__EFCoalescer_initWithCoalescingAction___block_invoke;
    handler[3] = &unk_1E62A5838;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v16, handler);
    dispatch_resume((dispatch_object_t)v6->_coalescer);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v6;
}

void __40__EFCoalescer_initWithCoalescingAction___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleCoalesceEvent");

}

- (void)dealloc
{
  NSObject *coalescer;
  objc_super v4;

  coalescer = self->_coalescer;
  if (coalescer)
    dispatch_source_cancel(coalescer);
  v4.receiver = self;
  v4.super_class = (Class)EFCoalescer;
  -[EFCoalescer dealloc](&v4, sel_dealloc);
}

- (void)coalesceValue:(id)a3
{
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong(&self->_coalescedValue, a3);
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
    dispatch_source_merge_data((dispatch_source_t)self->_coalescer, 1uLL);
  else
    (*((void (**)(void))self->_coalescerAction + 2))();

}

- (void)_handleCoalesceEvent
{
  os_unfair_lock_s *p_lock;
  id coalescedValue;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_coalescedValue;
  coalescedValue = self->_coalescedValue;
  self->_coalescedValue = 0;

  os_unfair_lock_unlock(p_lock);
  if (v5)
    (*((void (**)(void))self->_coalescerAction + 2))();
  sleep(1u);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_coalescedValue, 0);
  objc_storeStrong(&self->_coalescerAction, 0);
}

@end
