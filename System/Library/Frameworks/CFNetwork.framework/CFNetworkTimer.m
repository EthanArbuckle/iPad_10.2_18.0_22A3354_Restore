@implementation CFNetworkTimer

- (void)dealloc
{
  NSObject *timer;
  objc_super v4;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    dispatch_release((dispatch_object_t)self->_timer);
    self->_timer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CFNetworkTimer;
  -[CFNetworkTimer dealloc](&v4, sel_dealloc);
}

- (id)initWithQueue:(void *)a3 completionHandler:
{
  id v5;
  dispatch_block_t v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)CFNetworkTimer;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 1) = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, a2);
    v6 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, a3);
    dispatch_source_set_event_handler(*((dispatch_source_t *)v5 + 1), v6);
    _Block_release(v6);
    dispatch_source_set_timer(*((dispatch_source_t *)v5 + 1), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v5 + 1));
    *((_DWORD *)v5 + 12) = 0;
  }
  return v5;
}

- (uint64_t)setTimer:(uint64_t)result
{
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  uint64_t v6;

  if (result)
  {
    v3 = result;
    v4 = *(NSObject **)(result + 8);
    if (a2 <= 0.0)
    {
      dispatch_source_set_timer(*(dispatch_source_t *)(result + 8), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    else
    {
      v5 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
      dispatch_source_set_timer(v4, v5, (unint64_t)(a2 * 1000000000.0), 0x5F5E100uLL);
      *(_DWORD *)(v3 + 48) = 1;
    }
    result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSince1970");
    *(double *)(v3 + 16) = a2;
    *(_QWORD *)(v3 + 24) = v6;
    *(_QWORD *)(v3 + 40) = 0;
  }
  return result;
}

- (void)cancelTimer
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
  {
    *(_DWORD *)(a1 + 48) = 4;
    dispatch_source_cancel(v2);
    dispatch_release(*(dispatch_object_t *)(a1 + 8));
    *(_QWORD *)(a1 + 8) = 0;
  }
}

@end
