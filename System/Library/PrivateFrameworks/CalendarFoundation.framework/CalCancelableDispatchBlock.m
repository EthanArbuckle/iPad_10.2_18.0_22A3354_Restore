@implementation CalCancelableDispatchBlock

- (CalCancelableDispatchBlock)initWithBlock:(id)a3 inQueue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CalCancelableDispatchBlock *v10;
  id *v11;
  dispatch_block_t v12;
  void *v14;
  void *v15;
  _QWORD block[4];
  id *v17;
  id v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalCancelableDispatchBlock.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalCancelableDispatchBlock.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue != nil"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)CalCancelableDispatchBlock;
  v10 = -[CalCancelableDispatchBlock init](&v19, sel_init);
  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__CalCancelableDispatchBlock_initWithBlock_inQueue___block_invoke;
    block[3] = &unk_1E2A84808;
    v18 = v7;
    v11 = v10;
    v17 = v11;
    v12 = dispatch_block_create((dispatch_block_flags_t)0, block);
    objc_msgSend(v11, "setBlock:", v12);

    objc_storeStrong(v11 + 2, a4);
  }

  return v10;
}

uint64_t __52__CalCancelableDispatchBlock_initWithBlock_inQueue___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBlock:", 0);
}

- (void)performAsync
{
  void *v3;
  NSObject *queue;

  -[CalCancelableDispatchBlock queue](self, "queue");
  queue = objc_claimAutoreleasedReturnValue();
  -[CalCancelableDispatchBlock block](self, "block");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(queue, v3);

}

- (void)performAfterDelay:(double)a3
{
  dispatch_time_t v4;
  void *v5;
  NSObject *queue;

  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  -[CalCancelableDispatchBlock queue](self, "queue");
  queue = objc_claimAutoreleasedReturnValue();
  -[CalCancelableDispatchBlock block](self, "block");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_after(v4, queue, v5);

}

- (void)cancel
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FC12000, log, OS_LOG_TYPE_ERROR, "[CalCancelableDispatchBlock cancel] called after block was already canceled", v1, 2u);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
