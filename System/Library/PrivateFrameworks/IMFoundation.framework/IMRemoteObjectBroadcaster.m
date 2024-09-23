@implementation IMRemoteObjectBroadcaster

- (IMRemoteObjectBroadcaster)init
{
  IMRemoteObjectBroadcaster *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMRemoteObjectBroadcaster;
  v2 = -[IMRemoteObjectBroadcaster init](&v5, sel_init);
  if (v2)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.IMRemoteObjectBroadcasterQueue", v3);
  }
  return v2;
}

- (id)broadcastProxyForTarget:(id)a3 messageContext:(id)a4 protocol:(id)a5 priority:(int)a6 completion:(id)a7
{
  uint64_t v8;
  Broadcaster *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;

  if (!a3)
    return 0;
  v8 = *(_QWORD *)&a6;
  v13 = [Broadcaster alloc];
  v16 = objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v14, (uint64_t)a3, v15);
  return (id)objc_msgSend_initWithNotifier_messageContext_protocol_targets_priority_completion_(v13, v17, (uint64_t)self, (uint64_t)a4, a5, v16, v8, a7);
}

- (void)blockUntilSendQueueIsEmpty
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend__remoteObjects(IMRemoteObject, a2, v2, v3);
  v8 = (void *)objc_msgSend__copyForEnumerating(v4, v5, v6, v7);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v10)
  {
    v14 = v10;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v8);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend__queue(v17, v11, v12, v13))
        {
          v18 = objc_msgSend__queue(v17, v11, v12, v13);
          dispatch_sync(v18, &unk_1E2C434E8);
        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v14);
  }
  v19 = (void *)objc_msgSend_defaultBroadcaster(IMRemoteObjectBroadcaster, v11, v12, v13);
  v23 = objc_msgSend__queue(v19, v20, v21, v22);
  dispatch_sync(v23, &unk_1E2C45588);

}

+ (id)defaultBroadcaster
{
  if (qword_1ECD90F10 != -1)
    dispatch_once(&qword_1ECD90F10, &unk_1E2C45568);
  return (id)qword_1ECD90F18;
}

- (id)_queue
{
  return self->_queue;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IMRemoteObjectBroadcaster;
  -[IMRemoteObjectBroadcaster dealloc](&v4, sel_dealloc);
}

- (id)broadcastProxyForTarget:(id)a3 messageContext:(id)a4 protocol:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_broadcastProxyForTarget_messageContext_protocol_priority_, a3, a4);
}

- (id)broadcastProxyForTarget:(id)a3 messageContext:(id)a4 protocol:(id)a5 priority:(int)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_broadcastProxyForTarget_messageContext_protocol_priority_completion_, a3, a4);
}

- (id)broadcastProxyForTargets:(id)a3 messageContext:(id)a4 protocol:(id)a5
{
  id result;
  Broadcaster *v10;
  const char *v11;

  result = (id)objc_msgSend_count(a3, a2, (uint64_t)a3, (uint64_t)a4);
  if (result)
  {
    v10 = [Broadcaster alloc];
    return (id)objc_msgSend_initWithNotifier_messageContext_protocol_targets_(v10, v11, (uint64_t)self, (uint64_t)a4, a5, a3);
  }
  return result;
}

- (void)flushProxy:(id)a3
{
  id v3;
  const char *v4;

  v3 = a3;
  objc_msgSend__cleanupMachBitsCanPost_locked_(a3, v4, 1, 0);

}

@end
