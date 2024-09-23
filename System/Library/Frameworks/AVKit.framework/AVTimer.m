@implementation AVTimer

- (double)interval
{
  return self->_interval;
}

- (AVTimer)initWithTimeInterval:(double)a3 queue:(id)a4 block:(id)a5 repeats:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  NSObject *v14;
  id v15;
  dispatch_queue_t v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  double v24;
  BOOL v25;
  uint8_t buf[16];
  objc_super v27;

  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)AVTimer;
  v12 = -[AVTimer init](&v27, sel_init);
  if (v12)
  {
    v13 = a3;
    if (a3 <= 0.0)
    {
      _AVLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_ERROR, "Error: invalid timer update interval. Interval must be greater than 0.", buf, 2u);
      }

      v13 = 0.0;
    }
    *((double *)v12 + 4) = v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.avkit.AVTimer.manage %p"), v12);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "UTF8String"), 0);
    v17 = (void *)*((_QWORD *)v12 + 1);
    *((_QWORD *)v12 + 1) = v16;

    v18 = *((_QWORD *)v12 + 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__AVTimer_initWithTimeInterval_queue_block_repeats___block_invoke;
    block[3] = &unk_1E5BB3C98;
    v21 = v12;
    v24 = a3;
    v25 = a6;
    v22 = v10;
    v23 = v11;
    dispatch_sync(v18, block);

  }
  return (AVTimer *)v12;
}

void __52__AVTimer_initWithTimeInterval_queue_block_repeats___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  dispatch_source_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[4];
  id v11;
  id v12;
  id v13;
  char v14;
  id location;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.avkit.AVTimer.timer %p"), *(_QWORD *)(a1 + 32));
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = dispatch_queue_create((const char *)objc_msgSend(v2, "UTF8String"), 0);
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v4;

  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
  dispatch_source_set_timer(v7, v8, (unint64_t)(*(double *)(a1 + 56) * 1000000000.0), 0x5F5E100uLL);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __52__AVTimer_initWithTimeInterval_queue_block_repeats___block_invoke_2;
  handler[3] = &unk_1E5BB3C70;
  objc_copyWeak(&v13, &location);
  v14 = *(_BYTE *)(a1 + 64);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __52__AVTimer_initWithTimeInterval_queue_block_repeats___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD *v6;
  _QWORD block[4];
  _QWORD *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (!*(_BYTE *)(a1 + 56))
    {
      v3 = WeakRetained[2];
      if (v3)
      {
        dispatch_source_cancel(v3);
        v4 = (void *)v6[2];
        v6[2] = 0;

      }
    }
    v5 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__AVTimer_initWithTimeInterval_queue_block_repeats___block_invoke_3;
    block[3] = &unk_1E5BB4C10;
    v8 = v6;
    v9 = *(id *)(a1 + 40);
    dispatch_sync(v5, block);

    WeakRetained = v6;
  }

}

- (AVTimer)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  _AVMethodProem(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is not a valid initializer. You must call -[%@ initWithTimeInterval:queue:block:repeats:]."), v5, v7);

  return -[AVTimer initWithTimeInterval:queue:block:repeats:](self, "initWithTimeInterval:queue:block:repeats:", 0, 0, 0, 0.0);
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__AVTimer_dealloc__block_invoke;
  block[3] = &unk_1E5BB4CA0;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)AVTimer;
  -[AVTimer dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  self->_invalidated = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__AVTimer_invalidate__block_invoke;
  block[3] = &unk_1E5BB4CA0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __21__AVTimer_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

  }
}

void __18__AVTimer_dealloc__block_invoke(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  if (v1)
    dispatch_source_cancel(v1);
}

uint64_t __52__AVTimer_initWithTimeInterval_queue_block_repeats___block_invoke_3(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  return result;
}

@end
