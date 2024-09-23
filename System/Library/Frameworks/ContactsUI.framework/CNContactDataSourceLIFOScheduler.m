@implementation CNContactDataSourceLIFOScheduler

- (CNContactDataSourceLIFOScheduler)init
{
  CNContactDataSourceLIFOScheduler *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableArray *v6;
  NSMutableArray *stack;
  CNContactDataSourceLIFOScheduler *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNContactDataSourceLIFOScheduler;
  v2 = -[CNContactDataSourceLIFOScheduler init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.contacts.contactlist", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stack = v2->_stack;
    v2->_stack = v6;

    v8 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)dealloc
{
  NSMutableArray *v3;
  objc_super v4;

  v3 = self->_stack;
  objc_sync_enter(v3);
  -[NSMutableArray removeAllObjects](self->_stack, "removeAllObjects");
  objc_sync_exit(v3);

  v4.receiver = self;
  v4.super_class = (Class)CNContactDataSourceLIFOScheduler;
  -[CNContactDataSourceLIFOScheduler dealloc](&v4, sel_dealloc);
}

- (void)performBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  -[CNContactDataSourceLIFOScheduler stack](self, "stack");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  v6 = _Block_copy(v4);
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v5);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CNContactDataSourceLIFOScheduler_performBlock___block_invoke;
  block[3] = &unk_1E204F648;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, block);

}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5;
  CNContactDataSourceLIFOScheduler *v6;
  id v7;

  v5 = a3;
  v6 = self;
  CNUnimplementedMethodException();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  CNContactDataSourceLIFOScheduler *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNUnimplementedMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5;
  CNContactDataSourceLIFOScheduler *v6;
  id v7;

  v5 = a3;
  v6 = self;
  CNUnimplementedMethodException();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v5;
  CNContactDataSourceLIFOScheduler *v6;
  id v7;

  v5 = a4;
  v6 = self;
  CNUnimplementedMethodException();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v6;
  CNContactDataSourceLIFOScheduler *v7;
  id v8;

  v6 = a4;
  v7 = self;
  CNUnimplementedMethodException();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v8);
}

- (double)timestamp
{
  CNContactDataSourceLIFOScheduler *v2;
  id v3;

  v2 = self;
  CNUnimplementedMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)stack
{
  return self->_stack;
}

void __49__CNContactDataSourceLIFOScheduler_performBlock___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
  objc_sync_exit(v2);

  v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    v3 = v4;
  }

}

@end
