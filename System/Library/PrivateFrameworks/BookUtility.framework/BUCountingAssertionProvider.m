@implementation BUCountingAssertionProvider

- (id)newAssertion
{
  return (id)MEMORY[0x24BEDD108](self, sel__newAssertion_, 1);
}

- (BUCountingAssertionProvider)initWithDelegate:(id)a3
{
  id v4;
  BUCountingAssertionProvider *v5;
  BUCountingAssertionProvider *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BUCountingAssertionProvider;
  v5 = -[BUCountingAssertionProvider init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("BCCountingAssertionProvider.queue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

  }
  return v6;
}

- (id)_newAssertion:(BOOL)a3
{
  NSObject *queue;
  uint64_t v5;
  _BUCountingAssertion *v6;
  OS_dispatch_queue *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id WeakRetained;
  const char *v19;
  _QWORD v21[5];
  _QWORD block[7];
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  queue = self->_queue;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E49E0C;
  block[3] = &unk_24CEDA7A8;
  v23 = a3;
  block[4] = self;
  block[5] = &v28;
  block[6] = &v24;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v29 + 24))
  {
    v6 = [_BUCountingAssertion alloc];
    v7 = self->_queue;
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = sub_212E5FB40;
    v21[3] = &unk_24CED9E10;
    v21[4] = self;
    v9 = (void *)objc_msgSend_initWithQueue_block_(v6, v8, (uint64_t)v7, v21);
  }
  else
  {
    v9 = 0;
  }
  if (*((_BYTE *)v25 + 24))
  {
    BUAssertionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_212E6CFFC(v10, v11, v12, v13, v14, v15, v16, v17);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_countingAssertProviderTransitionToNonZero_(WeakRetained, v19, (uint64_t)self);

  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return v9;
}

- (id)newExtendingAssertion
{
  return (id)MEMORY[0x24BEDD108](self, sel__newAssertion_, 0);
}

- (BOOL)_endAssertion
{
  uint64_t *p_count;
  unint64_t v4;
  unint64_t count;
  NSObject *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  count = self->_count;
  p_count = (uint64_t *)&self->_count;
  v4 = count;
  if (count)
    *p_count = v4 - 1;
  BUAssertionLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_212E6D0E0(p_count, v4 == 1, v6);

  return v4 == 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
