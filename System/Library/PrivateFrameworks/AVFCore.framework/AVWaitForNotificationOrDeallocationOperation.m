@implementation AVWaitForNotificationOrDeallocationOperation

- (AVWaitForNotificationOrDeallocationOperation)initWithObject:(id)a3 notificationNames:(id)a4
{
  AVWaitForNotificationOrDeallocationOperation *v6;
  AVWeakReference *v7;
  NSObject *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVWaitForNotificationOrDeallocationOperation;
  v6 = -[AVWaitForNotificationOrDeallocationOperation init](&v10, sel_init);
  if (v6)
  {
    if (!a3)
      goto LABEL_10;
    v6->_weakReferenceToMonitoredObject = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
    v7 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v6);
    v6->_weakReferenceToSelf = v7;
    if (v7)
      CFRetain(v7);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6->_operationStateSerializationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.waitForNotificationOrDeallocationOperation", v8);
    v6->_monitoringIsFinishedSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v6->_notificationNames = (NSArray *)objc_msgSend(a4, "copy");
    if (v6->_weakReferenceToSelf
      && v6->_weakReferenceToMonitoredObject
      && v6->_operationStateSerializationQueue
      && v6->_monitoringIsFinishedSemaphore)
    {
      +[AVDepartureAnnouncingObjectMonitor attachDepartureAnnouncingObjectMonitorToObject:monitoringObject:](AVDepartureAnnouncingObjectMonitor, "attachDepartureAnnouncingObjectMonitorToObject:monitoringObject:", a3, v6);
      -[AVWaitForNotificationOrDeallocationOperation _registerForObjectNotifications](v6, "_registerForObjectNotifications");
    }
    else
    {
LABEL_10:

      return 0;
    }
  }
  return v6;
}

- (void)_registerForObjectNotifications
{
  id v3;
  NSArray *notificationNames;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_registeredForObjectNotifications)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    notificationNames = self->_notificationNames;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](notificationNames, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(notificationNames);
          objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", self->_weakReferenceToSelf, avWaitForNotificationOrDeallocationOperationNotificationHandler, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), 0, 0);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](notificationNames, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    self->_registeredForObjectNotifications = 1;
  }
}

- (void)_unregisterForObjectNotifications
{
  id v3;
  NSArray *notificationNames;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_registeredForObjectNotifications)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    notificationNames = self->_notificationNames;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](notificationNames, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(notificationNames);
          objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakReferenceToSelf, avWaitForNotificationOrDeallocationOperationNotificationHandler, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), 0);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](notificationNames, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    self->_registeredForObjectNotifications = 0;
  }
}

- (void)dealloc
{
  AVWeakReference *weakReferenceToSelf;
  NSObject *operationStateSerializationQueue;
  NSObject *monitoringIsFinishedSemaphore;
  objc_super v6;

  -[AVWaitForNotificationOrDeallocationOperation _balanceMonitoringIsFinishedSemaphore](self, "_balanceMonitoringIsFinishedSemaphore");
  -[AVWaitForNotificationOrDeallocationOperation _unregisterForObjectNotifications](self, "_unregisterForObjectNotifications");
  weakReferenceToSelf = self->_weakReferenceToSelf;
  if (weakReferenceToSelf)
    CFRelease(weakReferenceToSelf);
  operationStateSerializationQueue = self->_operationStateSerializationQueue;
  if (operationStateSerializationQueue)
    dispatch_release(operationStateSerializationQueue);
  monitoringIsFinishedSemaphore = self->_monitoringIsFinishedSemaphore;
  if (monitoringIsFinishedSemaphore)
    dispatch_release(monitoringIsFinishedSemaphore);

  v6.receiver = self;
  v6.super_class = (Class)AVWaitForNotificationOrDeallocationOperation;
  -[AVWaitForNotificationOrDeallocationOperation dealloc](&v6, sel_dealloc);
}

- (id)_monitoredObject
{
  return -[AVWeakReference referencedObject](self->_weakReferenceToMonitoredObject, "referencedObject");
}

- (void)_signalMonitoringIsFinishedIfNeeded
{
  NSObject *operationStateSerializationQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  operationStateSerializationQueue = self->_operationStateSerializationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__AVWaitForNotificationOrDeallocationOperation__signalMonitoringIsFinishedIfNeeded__block_invoke;
  v4[3] = &unk_1E302FD60;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(operationStateSerializationQueue, v4);
  if (*((_BYTE *)v6 + 24))
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_monitoringIsFinishedSemaphore);
  _Block_object_dispose(&v5, 8);
}

uint64_t __83__AVWaitForNotificationOrDeallocationOperation__signalMonitoringIsFinishedIfNeeded__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 290) ^ 1;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 290) = 1;
  return result;
}

- (void)_waitUntilFinishedIfNeeded
{
  NSObject *operationStateSerializationQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  operationStateSerializationQueue = self->_operationStateSerializationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__AVWaitForNotificationOrDeallocationOperation__waitUntilFinishedIfNeeded__block_invoke;
  v4[3] = &unk_1E302FD60;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(operationStateSerializationQueue, v4);
  if (*((_BYTE *)v6 + 24))
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_monitoringIsFinishedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(&v5, 8);
}

uint64_t __74__AVWaitForNotificationOrDeallocationOperation__waitUntilFinishedIfNeeded__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 289) ^ 1;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 289) = 1;
  return result;
}

- (void)_balanceMonitoringIsFinishedSemaphore
{
  if (self->_operationStateSerializationQueue)
  {
    if (self->_monitoringIsFinishedSemaphore)
    {
      -[AVWaitForNotificationOrDeallocationOperation _signalMonitoringIsFinishedIfNeeded](self, "_signalMonitoringIsFinishedIfNeeded");
      -[AVWaitForNotificationOrDeallocationOperation _waitUntilFinishedIfNeeded](self, "_waitUntilFinishedIfNeeded");
    }
  }
}

@end
