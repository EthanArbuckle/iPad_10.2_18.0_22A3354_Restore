@implementation IMEventNotification

+ (id)eventNotification:(id)a3 eventNotificationBlock:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setTarget:", v6);

  objc_msgSend(v7, "setEventNotificationBlock:", v5);
  return v7;
}

+ (id)eventNotification:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v10, "setTarget:", v9);

  objc_msgSend(v10, "setSender:", v8);
  objc_msgSend(v10, "setEventNotificationWithSenderBlock:", v7);

  return v10;
}

+ (id)eventNotification:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTarget:", v3);

  objc_msgSend(v4, "setEventNotificationBlock:", 0);
  return v4;
}

- (BOOL)invoke
{
  IMEventNotification *v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  BOOL v8;

  v2 = self;
  objc_sync_enter(v2);
  -[IMEventNotification target](v2, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMEventNotification sender](v2, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMEventNotification eventNotificationBlock](v2, "eventNotificationBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[IMEventNotification eventNotificationWithSenderBlock](v2, "eventNotificationWithSenderBlock");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3 && v5)
  {
    ((void (**)(_QWORD, void *))v5)[2](v5, v3);
LABEL_8:
    v8 = 1;
    goto LABEL_9;
  }
  v8 = 0;
  if (v3 && v4 && v6)
  {
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v3, v4);
    goto LABEL_8;
  }
LABEL_9:

  objc_sync_exit(v2);
  return v8;
}

- (void)cancel
{
  id eventNotificationBlock;
  id eventNotificationWithSenderBlock;
  IMEventNotification *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_storeWeak(&obj->_target, 0);
  eventNotificationBlock = obj->_eventNotificationBlock;
  obj->_eventNotificationBlock = 0;

  eventNotificationWithSenderBlock = obj->_eventNotificationWithSenderBlock;
  obj->_eventNotificationWithSenderBlock = 0;

  objc_sync_exit(obj);
}

- (BOOL)wasCancelled
{
  IMEventNotification *v2;
  id WeakRetained;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&v2->_target);
  v4 = WeakRetained == 0;

  objc_sync_exit(v2);
  return v4;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (id)sender
{
  return objc_loadWeakRetained(&self->_sender);
}

- (void)setSender:(id)a3
{
  objc_storeWeak(&self->_sender, a3);
}

- (IMEventNotification)eventNotificationWithSenderBlock
{
  return (IMEventNotification *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEventNotificationWithSenderBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (id)eventNotificationBlock
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setEventNotificationBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventNotificationBlock, 0);
  objc_storeStrong(&self->_eventNotificationWithSenderBlock, 0);
  objc_destroyWeak(&self->_sender);
  objc_destroyWeak(&self->_target);
}

@end
