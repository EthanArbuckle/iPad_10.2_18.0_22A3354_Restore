@implementation _BUCountingAssertion

- (_BUCountingAssertion)initWithQueue:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  _BUCountingAssertion *v9;
  _BUCountingAssertion *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id block;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_BUCountingAssertion;
  v9 = -[_BUCountingAssertion init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v13 = objc_msgSend_copy(v8, v11, v12);
    block = v10->_block;
    v10->_block = (id)v13;

  }
  return v10;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_invalidate(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)_BUCountingAssertion;
  -[_BUCountingAssertion dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E5FAB0;
  block[3] = &unk_24CED9E10;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
