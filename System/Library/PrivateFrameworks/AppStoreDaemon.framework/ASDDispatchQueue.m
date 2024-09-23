@implementation ASDDispatchQueue

- (ASDDispatchQueue)initWithQueue:(id)a3
{
  id v5;
  ASDDispatchQueue *v6;
  ASDDispatchQueue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDDispatchQueue;
  v6 = -[ASDDispatchQueue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

+ (ASDDispatchQueue)defaultQueue
{
  if (_MergedGlobals_41 != -1)
    dispatch_once(&_MergedGlobals_41, &__block_literal_global_16);
  return (ASDDispatchQueue *)(id)qword_1ECFFAAD8;
}

- (void)asyncUsingBlock:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)syncUsingBlock:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_queue, a3);
}

- (ASDDispatchQueue)initWithName:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  ASDDispatchQueue *v11;
  uint64_t v13;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v13);

  v7 = objc_retainAutorelease(v6);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create(v8, v9);
  v11 = -[ASDDispatchQueue initWithQueue:](self, "initWithQueue:", v10);

  return v11;
}

void __32__ASDDispatchQueue_defaultQueue__block_invoke()
{
  ASDDispatchQueue *v0;
  void *v1;

  v0 = objc_alloc_init(ASDDispatchQueue);
  v1 = (void *)qword_1ECFFAAD8;
  qword_1ECFFAAD8 = (uint64_t)v0;

}

- (ASDDispatchQueue)init
{
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  ASDDispatchQueue *v6;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create_with_target_V2("com.apple.appstored.DispatchQueue.default", v3, v4);
  v6 = -[ASDDispatchQueue initWithQueue:](self, "initWithQueue:", v5);

  return v6;
}

- (void)assertQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

@end
