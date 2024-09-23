@implementation NPTODarwinNotificationObserver

- (NPTODarwinNotificationObserver)initWithNotificationName:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NPTODarwinNotificationObserver *v11;
  int *v12;
  const char *v13;
  uint32_t v14;
  NPTODarwinNotificationObserver *v15;
  _QWORD handler[4];
  id v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NPTODarwinNotificationObserver;
  v11 = -[NPTODarwinNotificationObserver init](&v19, sel_init);
  v12 = (int *)v11;
  if (!v11)
    goto LABEL_4;
  v11->_notificationToken = -1;
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __71__NPTODarwinNotificationObserver_initWithNotificationName_queue_block___block_invoke;
  handler[3] = &unk_24D069608;
  v18 = v10;
  v14 = notify_register_dispatch(v13, v12 + 2, v9, handler);

  if (v14)
    v15 = 0;
  else
LABEL_4:
    v15 = v12;

  return v15;
}

uint64_t __71__NPTODarwinNotificationObserver_initWithNotificationName_queue_block___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notificationToken);
  v3.receiver = self;
  v3.super_class = (Class)NPTODarwinNotificationObserver;
  -[NPTODarwinNotificationObserver dealloc](&v3, sel_dealloc);
}

@end
