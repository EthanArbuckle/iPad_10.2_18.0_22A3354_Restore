@implementation IDSInternalQueueController

- (IDSInternalQueueController)initWithName:(char *)a3 contextKey:(void *)a4
{
  id v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IDSInternalQueueController;
  v6 = -[IDSInternalQueueController init](&v11, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(a3, v7);
    v9 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v8;

    *((_QWORD *)v6 + 2) = a4;
    dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 1), a4, (void *)1, 0);

  }
  return (IDSInternalQueueController *)v6;
}

- (BOOL)isQueueCurrent
{
  return dispatch_get_specific(self->_contextKey) != 0;
}

- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(void);
  void (**block)(void);

  v4 = a4;
  v6 = (void (**)(void))a3;
  block = v6;
  if (v4)
  {
    if (dispatch_get_specific(self->_contextKey))
      block[2]();
    else
      dispatch_sync((dispatch_queue_t)self->_queue, block);
  }
  else
  {
    dispatch_async((dispatch_queue_t)self->_queue, v6);
  }

}

- (void)performBlock:(id)a3
{
  -[IDSInternalQueueController performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", a3, 0);
}

- (BOOL)assertQueueIsNotCurrent
{
  return dispatch_get_specific(self->_contextKey) != 0;
}

+ (IDSInternalQueueController)sharedInstance
{
  if (qword_1ECDD6750 != -1)
    dispatch_once(&qword_1ECDD6750, &unk_1E2C5FE50);
  return (IDSInternalQueueController *)(id)qword_1ECDD6710;
}

- (BOOL)assertQueueIsCurrent
{
  return dispatch_get_specific(self->_contextKey) == 0;
}

- (id)queue
{
  return self->_queue;
}

- (IDSInternalQueueController)init
{
  return -[IDSInternalQueueController initWithName:contextKey:](self, "initWithName:contextKey:", "IDSInternalQueue", "IDSInternalQueueControllerContext");
}

- (IDSInternalQueueController)initWithQueue:(id)a3
{
  id v5;
  IDSInternalQueueController *v6;
  IDSInternalQueueController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSInternalQueueController;
  v6 = -[IDSInternalQueueController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_contextKey = "IDSInternalQueueControllerContext";
    dispatch_queue_set_specific((dispatch_queue_t)v7->_queue, "IDSInternalQueueControllerContext", (void *)1, 0);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
