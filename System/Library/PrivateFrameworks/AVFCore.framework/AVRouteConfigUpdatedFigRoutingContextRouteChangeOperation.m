@implementation AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation)init
{
  return -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation initWithRoutingContext:routeChangeID:routeChangeBlock:](self, "initWithRoutingContext:routeChangeID:routeChangeBlock:", 0, 0, 0);
}

- (AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 routeChangeID:(__CFString *)a4 routeChangeBlock:(id)a5
{
  id v9;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v10;
  OpaqueFigRoutingContext *v11;
  __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  AVWeakReference *v15;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v16;
  uint64_t v17;
  objc_super v19;

  v9 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  v19.receiver = self;
  v19.super_class = (Class)AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation;
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
  v10->_routeChangeID = v12;
  if (!v12)
    goto LABEL_12;
  v13 = objc_msgSend(a5, "copy");
  v10->_routeChangeBlock = (id)v13;
  if (!v13)
    goto LABEL_12;
  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10->_routeChangeIvarAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.route-change-operation.ivars", v14);
  v15 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v10);
  v10->_weakObserver = v15;
  objc_msgSend(v9, "addListenerWithWeakReference:callback:name:object:flags:", v15, AVRouteConfigUpdatedFigRoutingContextRouteChangeOperationRouteConfigUpdated, *MEMORY[0x1E0D48D20], v10->_routingContext, 0);
  v16 = v10;
LABEL_11:

  return v16;
}

- (void)dealloc
{
  OpaqueFigRoutingContext *routingContext;
  NSObject *routeChangeIvarAccessQueue;
  __CFString *routeChangeID;
  objc_super v6;

  if (self->_weakObserver)
    objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVRouteConfigUpdatedFigRoutingContextRouteChangeOperationRouteConfigUpdated, *MEMORY[0x1E0D48D20], self->_routingContext);
  routingContext = self->_routingContext;
  if (routingContext)
    CFRelease(routingContext);

  routeChangeIvarAccessQueue = self->_routeChangeIvarAccessQueue;
  if (routeChangeIvarAccessQueue)
    dispatch_release(routeChangeIvarAccessQueue);
  routeChangeID = self->_routeChangeID;
  if (routeChangeID)
    CFRelease(routeChangeID);

  v6.receiver = self;
  v6.super_class = (Class)AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation;
  -[AVOperation dealloc](&v6, sel_dealloc);
}

- (AVOutputContextDestinationChange)result
{
  NSObject *routeChangeIvarAccessQueue;
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
  routeChangeIvarAccessQueue = self->_routeChangeIvarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation_result__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(routeChangeIvarAccessQueue, v5);
  v3 = (AVOutputContextDestinationChange *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __67__AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation_result__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 312);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setResultIfNotAlreadySet:(id)a3
{
  NSObject *routeChangeIvarAccessQueue;
  _QWORD v4[6];

  routeChangeIvarAccessQueue = self->_routeChangeIvarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation__setResultIfNotAlreadySet___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(routeChangeIvarAccessQueue, v4);
}

id *__87__AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation__setResultIfNotAlreadySet___block_invoke(id *result)
{
  id *v1;

  if (!*((_QWORD *)result[4] + 39))
  {
    v1 = result;
    result = (id *)result[5];
    *((_QWORD *)v1[4] + 39) = result;
  }
  return result;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  signed int v3;
  signed int v4;
  AVOutputContextDestinationChange *v5;

  if (-[AVOperation evaluateDependenciesAndMarkAsExecuting](self, "evaluateDependenciesAndMarkAsExecuting"))
  {
    v3 = (*((uint64_t (**)(void))self->_routeChangeBlock + 2))();
    if (v3)
    {
      v4 = v3;
      v5 = objc_alloc_init(AVOutputContextDestinationChange);
      -[AVOutputContextDestinationChange markAsFailed](v5, "markAsFailed");
      -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation _setResultIfNotAlreadySet:](self, "_setResultIfNotAlreadySet:", v5);
      -[AVOperation markAsFailedWithError:](self, "markAsFailedWithError:", AVLocalizedErrorWithUnderlyingOSStatus(v4, 0));

    }
  }
}

- (void)_routeConfigUpdateWithID:(__CFString *)a3 endedWithReason:(__CFString *)a4
{
  int v6;
  AVOutputContextDestinationChange *v7;
  uint64_t v8;
  AVOutputContextDestinationChange *v9;

  v9 = objc_alloc_init(AVOutputContextDestinationChange);
  v6 = FigCFEqual();
  v7 = v9;
  if (v6)
  {
    -[AVOutputContextDestinationChange changeToTerminalStatusBasedOnRouteConfigUpdatedReason:](v9, "changeToTerminalStatusBasedOnRouteConfigUpdatedReason:", a4);
    -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation _setResultIfNotAlreadySet:](self, "_setResultIfNotAlreadySet:", v9);
    if (-[AVOutputContextDestinationChange status](v9, "status") == 2)
    {
      -[AVOperation markAsCompleted](self, "markAsCompleted");
    }
    else if (-[AVOutputContextDestinationChange status](v9, "status") == 3)
    {
      if (FigCFEqual())
        v8 = -11909;
      else
        v8 = -11800;
      -[AVOperation markAsFailedWithError:](self, "markAsFailedWithError:", AVLocalizedError(CFSTR("AVFoundationErrorDomain"), v8, 0));
    }
    else
    {
      -[AVOperation markAsCancelled](self, "markAsCancelled");
    }
    v7 = v9;
  }

}

@end
