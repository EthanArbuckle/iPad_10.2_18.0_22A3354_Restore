@implementation IMEventNotificationQueue

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IMEventNotificationQueue)init
{
  IMEventNotificationQueue *v2;
  IMDoubleLinkedList *v3;
  IMDoubleLinkedList *eventNotificationList;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMEventNotificationQueue;
  v2 = -[IMEventNotificationQueue init](&v6, sel_init);
  if (v2)
  {
    v3 = (IMDoubleLinkedList *)objc_alloc_init(MEMORY[0x1E0D36A20]);
    eventNotificationList = v2->_eventNotificationList;
    v2->_eventNotificationList = v3;

  }
  return v2;
}

- (void)_dispatchProcessQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19E29C748;
  block[3] = &unk_1E3FB6B98;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_scheduleIfNeeded:(BOOL)a3
{
  if (!self->_scheduled || a3)
  {
    self->_scheduled = 1;
    if (!self->_paused)
      MEMORY[0x1E0DE7D20](self, sel__dispatchProcessQueue);
  }
}

- (void)_invokeEvent:(id)a3
{
  if (a3)
    objc_msgSend(a3, "invoke");
}

- (BOOL)isBusy
{
  IMEventNotificationQueue *v2;
  BOOL busy;

  v2 = self;
  objc_sync_enter(v2);
  busy = v2->_busy;
  objc_sync_exit(v2);

  return busy;
}

- (void)_setBusy:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;

  if (self->_busy != a3)
  {
    self->_busy = a3;
    -[IMEventNotificationQueue delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[IMEventNotificationQueue delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "eventNotificationQueue:didChangeBusyState:", self, self->_busy);

    }
    MEMORY[0x1E0DE7D20](self, sel__didChangeBusyState_);
  }
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, id, _BYTE *);
  void *v5;
  id v6;
  int v7;
  unsigned __int8 v8;

  v4 = (void (**)(id, id, _BYTE *))a3;
  if (v4)
  {
    v8 = 0;
    -[IMDoubleLinkedList first](self->_eventNotificationList, "first");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      if (!v5)
        break;
      v6 = v5;
      objc_msgSend(v6, "next");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "wasCancelled"))
      {
        -[IMDoubleLinkedList removeLinkedListNode:](self->_eventNotificationList, "removeLinkedListNode:", v6);
        objc_msgSend(v6, "cache");
      }
      else
      {
        v4[2](v4, v6, &v8);
      }
      v7 = v8;

    }
    while (!v7);

  }
}

- (void)_invokeNotifications
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_19E29C96C;
  v2[3] = &unk_1E3FB6BC0;
  v2[4] = self;
  -[IMEventNotificationQueue enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v2);
}

- (void)_processQueue
{
  IMEventNotificationQueue *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  IMEventNotificationQueue *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_paused)
  {
    -[IMEventNotificationQueue delegate](obj, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[IMEventNotificationQueue delegate](obj, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventNotificationQueueWillSendNotifications:", obj);

    }
    -[IMEventNotificationQueue _willProcessQueue](obj, "_willProcessQueue");
    -[IMEventNotificationQueue _invokeNotifications](obj, "_invokeNotifications");
    -[IMEventNotificationQueue _didProcessQueue](obj, "_didProcessQueue");
    -[IMEventNotificationQueue delegate](obj, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    v2 = obj;
    if ((v7 & 1) != 0)
    {
      -[IMEventNotificationQueue delegate](obj, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "eventNotificationQueueDidSendNotifications:", obj);

      v2 = obj;
    }
  }
  v2->_scheduled = 0;
  objc_sync_exit(v2);

}

- (void)pushEventNotification:(id)a3
{
  IMEventNotificationQueue *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[IMDoubleLinkedList pushLinkedListNode:](v4->_eventNotificationList, "pushLinkedListNode:", v5);
  -[IMEventNotificationQueue _didAddNotification:](v4, "_didAddNotification:", v5);
  objc_sync_exit(v4);

}

- (void)appendEventNotification:(id)a3
{
  IMEventNotificationQueue *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[IMDoubleLinkedList appendLinkedListNode:](v4->_eventNotificationList, "appendLinkedListNode:", v5);
  -[IMEventNotificationQueue _didAddNotification:](v4, "_didAddNotification:", v5);
  objc_sync_exit(v4);

}

- (void)cancelEventNotificationsForNotificationTarget:(id)a3
{
  id v4;
  IMEventNotificationQueue *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  IMEventNotificationQueue *v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = sub_19E29CC18;
  v10 = &unk_1E3FB6BE8;
  v6 = v4;
  v11 = v6;
  v12 = v5;
  -[IMEventNotificationQueue enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", &v7);
  -[IMEventNotificationQueue _didCancelNotifications](v5, "_didCancelNotifications", v7, v8, v9, v10);

  objc_sync_exit(v5);
}

- (void)cancelAllEventNotifications
{
  IMEventNotificationQueue *v2;
  _QWORD v3[5];

  v2 = self;
  objc_sync_enter(v2);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_19E29CD1C;
  v3[3] = &unk_1E3FB6BC0;
  v3[4] = v2;
  -[IMEventNotificationQueue enumerateObjectsUsingBlock:](v2, "enumerateObjectsUsingBlock:", v3);
  -[IMEventNotificationQueue _didCancelNotifications](v2, "_didCancelNotifications");
  objc_sync_exit(v2);

}

- (void)appendEventTarget:(id)a3 eventNotificationBlock:(id)a4
{
  id v5;

  +[IMEventNotification eventNotification:eventNotificationBlock:](IMEventNotification, "eventNotification:eventNotificationBlock:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMEventNotificationQueue appendEventNotification:](self, "appendEventNotification:", v5);

}

- (void)pushEventTarget:(id)a3 eventNotificationBlock:(id)a4
{
  id v5;

  +[IMEventNotification eventNotification:eventNotificationBlock:](IMEventNotification, "eventNotification:eventNotificationBlock:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMEventNotificationQueue pushEventNotification:](self, "pushEventNotification:", v5);

}

- (void)appendEventTarget:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5
{
  id v6;

  +[IMEventNotification eventNotification:sender:eventNotificationBlock:](IMEventNotification, "eventNotification:sender:eventNotificationBlock:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IMEventNotificationQueue appendEventNotification:](self, "appendEventNotification:", v6);

}

- (void)pushEventTarget:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5
{
  id v6;

  +[IMEventNotification eventNotification:sender:eventNotificationBlock:](IMEventNotification, "eventNotification:sender:eventNotificationBlock:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IMEventNotificationQueue pushEventNotification:](self, "pushEventNotification:", v6);

}

- (void)_didChangePausedState:(BOOL)a3
{
  if (!a3)
    -[IMEventNotificationQueue _scheduleIfNeeded:](self, "_scheduleIfNeeded:", self->_scheduled);
}

- (void)setPaused:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  char v5;
  void *v6;
  IMEventNotificationQueue *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_paused != v3)
  {
    obj->_paused = v3;
    -[IMEventNotificationQueue delegate](obj, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[IMEventNotificationQueue delegate](obj, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "eventNotificationQueue:didChangePausedState:", obj, obj->_paused);

    }
    -[IMEventNotificationQueue _didChangePausedState:](obj, "_didChangePausedState:", obj->_paused);
  }
  objc_sync_exit(obj);

}

- (BOOL)isScheduled
{
  IMEventNotificationQueue *v2;
  BOOL scheduled;

  v2 = self;
  objc_sync_enter(v2);
  scheduled = v2->_scheduled;
  objc_sync_exit(v2);

  return scheduled;
}

- (BOOL)isPaused
{
  IMEventNotificationQueue *v2;
  BOOL paused;

  v2 = self;
  objc_sync_enter(v2);
  paused = v2->_paused;
  objc_sync_exit(v2);

  return paused;
}

- (int64_t)count
{
  IMEventNotificationQueue *v2;
  int64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[IMDoubleLinkedList count](v2->_eventNotificationList, "count");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)containsNotificationTarget:(id)a3
{
  id v4;
  IMEventNotificationQueue *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_19E29D114;
    v8[3] = &unk_1E3FB6C10;
    v9 = v4;
    v10 = &v11;
    -[IMEventNotificationQueue enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v8);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (IMEventNotificationQueueDelegate)delegate
{
  return (IMEventNotificationQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (IMDoubleLinkedList)eventNotificationList
{
  return self->_eventNotificationList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventNotificationList, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
