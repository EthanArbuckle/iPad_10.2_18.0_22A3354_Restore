@implementation AVFigRoutingContextRouteChangeOperation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVFigRoutingContextRouteChangeOperation)init
{
  return -[AVFigRoutingContextRouteChangeOperation initWithRoutingContext:successNotification:routeChangeBlock:](self, "initWithRoutingContext:successNotification:routeChangeBlock:", 0, 0, 0);
}

- (AVFigRoutingContextRouteChangeOperation)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 successNotification:(__CFString *)a4 routeChangeBlock:(id)a5
{
  id v9;
  AVFigRoutingContextRouteChangeOperation *v10;
  OpaqueFigRoutingContext *v11;
  __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  AVWeakReference *v15;
  AVFigRoutingContextRouteChangeOperation *v16;
  uint64_t v17;
  objc_super v19;

  v9 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  v19.receiver = self;
  v19.super_class = (Class)AVFigRoutingContextRouteChangeOperation;
  v10 = -[AVOperation init](&v19, sel_init);
  if (!v10)
    goto LABEL_12;
  if (!a3)
  {
    v16 = 0;
    v17 = 280;
LABEL_10:
    *(Class *)((char *)&v10->super.super.super.isa + v17) = 0;
    goto LABEL_11;
  }
  v11 = (OpaqueFigRoutingContext *)CFRetain(a3);
  v10->_routingContext = v11;
  if (!v11)
  {
LABEL_12:
    v16 = 0;
    goto LABEL_11;
  }
  if (!a4)
  {
    v16 = 0;
    v17 = 288;
    goto LABEL_10;
  }
  v12 = (__CFString *)CFRetain(a4);
  v10->_successNotification = v12;
  if (!v12)
    goto LABEL_12;
  v13 = objc_msgSend(a5, "copy");
  v10->_routeChangeBlock = (id)v13;
  if (!v13)
    goto LABEL_12;
  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10->_notificationManagementQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.route-change-operation.ivars", v14);
  v10->_actOnRouteChangeNotifications = 0;
  v15 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v10);
  v10->_weakObserver = v15;
  objc_msgSend(v9, "addListenerWithWeakReference:callback:name:object:flags:", v15, AVFigRoutingContextRouteChangeOperationRouteChangeStarted, *MEMORY[0x1E0D48D18], v10->_routingContext, 0);
  objc_msgSend(v9, "addListenerWithWeakReference:callback:name:object:flags:", v10->_weakObserver, AVFigRoutingContextRouteChangeOperationRouteChangeEnded, *MEMORY[0x1E0D48D10], v10->_routingContext, 0);
  objc_msgSend(v9, "addListenerWithWeakReference:callback:name:object:flags:", v10->_weakObserver, AVFigRoutingContextRouteChangeOperationRouteChangeComplete, v10->_successNotification, v10->_routingContext, 0);
  v16 = v10;
LABEL_11:

  return v16;
}

- (void)dealloc
{
  id v3;
  OpaqueFigRoutingContext *routingContext;
  __CFString *successNotification;
  NSObject *notificationManagementQueue;
  __CFNumber *routeChangeID;
  objc_super v8;

  if (self->_weakObserver)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRoutingContextRouteChangeOperationRouteChangeStarted, *MEMORY[0x1E0D48D18], self->_routingContext);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRoutingContextRouteChangeOperationRouteChangeEnded, *MEMORY[0x1E0D48D10], self->_routingContext);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRoutingContextRouteChangeOperationRouteChangeComplete, self->_successNotification, self->_routingContext);
  }
  routingContext = self->_routingContext;
  if (routingContext)
    CFRelease(routingContext);
  successNotification = self->_successNotification;
  if (successNotification)
    CFRelease(successNotification);

  notificationManagementQueue = self->_notificationManagementQueue;
  if (notificationManagementQueue)
    dispatch_release(notificationManagementQueue);
  routeChangeID = self->_routeChangeID;
  if (routeChangeID)
    CFRelease(routeChangeID);

  v8.receiver = self;
  v8.super_class = (Class)AVFigRoutingContextRouteChangeOperation;
  -[AVOperation dealloc](&v8, sel_dealloc);
}

- (AVOutputContextDestinationChange)result
{
  NSObject *notificationManagementQueue;
  AVOutputContextDestinationChange *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  notificationManagementQueue = self->_notificationManagementQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVFigRoutingContextRouteChangeOperation_result__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(notificationManagementQueue, v5);
  v3 = (AVOutputContextDestinationChange *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __49__AVFigRoutingContextRouteChangeOperation_result__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 328);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setResultIfNotAlreadySet:(id)a3
{
  NSObject *notificationManagementQueue;
  _QWORD v4[6];

  notificationManagementQueue = self->_notificationManagementQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__AVFigRoutingContextRouteChangeOperation__setResultIfNotAlreadySet___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(notificationManagementQueue, v4);
}

id *__69__AVFigRoutingContextRouteChangeOperation__setResultIfNotAlreadySet___block_invoke(id *result)
{
  id *v1;

  if (!*((_QWORD *)result[4] + 41))
  {
    v1 = result;
    result = (id *)result[5];
    *((_QWORD *)v1[4] + 41) = result;
  }
  return result;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  NSObject *notificationManagementQueue;
  signed int v4;
  signed int v5;
  AVOutputContextDestinationChange *v6;
  _QWORD block[5];

  if (-[AVOperation evaluateDependenciesAndMarkAsExecuting](self, "evaluateDependenciesAndMarkAsExecuting"))
  {
    notificationManagementQueue = self->_notificationManagementQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__AVFigRoutingContextRouteChangeOperation_start__block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    dispatch_sync(notificationManagementQueue, block);
    v4 = (*((uint64_t (**)(void))self->_routeChangeBlock + 2))();
    if (v4)
    {
      v5 = v4;
      v6 = objc_alloc_init(AVOutputContextDestinationChange);
      -[AVOutputContextDestinationChange markAsFailed](v6, "markAsFailed");
      -[AVFigRoutingContextRouteChangeOperation _setResultIfNotAlreadySet:](self, "_setResultIfNotAlreadySet:", v6);
      -[AVOperation markAsFailedWithError:](self, "markAsFailedWithError:", AVLocalizedErrorWithUnderlyingOSStatus(v5, 0));

    }
  }
}

uint64_t __48__AVFigRoutingContextRouteChangeOperation_start__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 312) = 1;
  return result;
}

- (void)_routeChangeStartedWithID:(__CFNumber *)a3
{
  NSObject *notificationManagementQueue;
  _QWORD v4[6];

  notificationManagementQueue = self->_notificationManagementQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__AVFigRoutingContextRouteChangeOperation__routeChangeStartedWithID___block_invoke;
  v4[3] = &unk_1E302FE78;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(notificationManagementQueue, v4);
}

_QWORD *__69__AVFigRoutingContextRouteChangeOperation__routeChangeStartedWithID___block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = result[4];
  if (*(_BYTE *)(v1 + 312) && !*(_QWORD *)(v1 + 320))
  {
    v2 = result;
    result = (_QWORD *)result[5];
    if (result)
    {
      result = CFRetain(result);
      v1 = v2[4];
    }
    *(_QWORD *)(v1 + 320) = result;
  }
  return result;
}

- (void)_routeChangeWithID:(__CFNumber *)a3 endedWithReason:(__CFString *)a4
{
  AVOutputContextDestinationChange *v7;
  NSObject *notificationManagementQueue;
  uint64_t v9;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = objc_alloc_init(AVOutputContextDestinationChange);
  notificationManagementQueue = self->_notificationManagementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AVFigRoutingContextRouteChangeOperation__routeChangeWithID_endedWithReason___block_invoke;
  block[3] = &unk_1E3031868;
  block[5] = &v11;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(notificationManagementQueue, block);
  if (*((_BYTE *)v12 + 24))
  {
    -[AVOutputContextDestinationChange changeToTerminalStatusBasedOnRouteChangeEndedReason:](v7, "changeToTerminalStatusBasedOnRouteChangeEndedReason:", a4);
    -[AVFigRoutingContextRouteChangeOperation _setResultIfNotAlreadySet:](self, "_setResultIfNotAlreadySet:", v7);
    if (!FigCFEqual())
    {
      if (FigCFEqual())
      {
        v9 = -11800;
      }
      else
      {
        if (!FigCFEqual())
        {
          -[AVOperation markAsCancelled](self, "markAsCancelled");
          goto LABEL_8;
        }
        v9 = -11909;
      }
      -[AVOperation markAsFailedWithError:](self, "markAsFailedWithError:", AVLocalizedError(CFSTR("AVFoundationErrorDomain"), v9, 0));
    }
  }
LABEL_8:

  _Block_object_dispose(&v11, 8);
}

uint64_t __78__AVFigRoutingContextRouteChangeOperation__routeChangeWithID_endedWithReason___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 312))
  {
    v1 = result;
    result = FigCFEqual();
    if ((_DWORD)result)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_routeChangeComplete
{
  AVOutputContextDestinationChange *v3;
  NSObject *notificationManagementQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v3 = objc_alloc_init(AVOutputContextDestinationChange);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  notificationManagementQueue = self->_notificationManagementQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AVFigRoutingContextRouteChangeOperation__routeChangeComplete__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(notificationManagementQueue, v5);
  if (*((_BYTE *)v7 + 24))
  {
    -[AVOutputContextDestinationChange markAsFinished](v3, "markAsFinished");
    -[AVFigRoutingContextRouteChangeOperation _setResultIfNotAlreadySet:](self, "_setResultIfNotAlreadySet:", v3);
    -[AVOperation markAsCompleted](self, "markAsCompleted");
  }

  _Block_object_dispose(&v6, 8);
}

uint64_t __63__AVFigRoutingContextRouteChangeOperation__routeChangeComplete__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 312);
  return result;
}

@end
