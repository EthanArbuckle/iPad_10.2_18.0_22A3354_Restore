@implementation AVCMNotificationDispatcher

void __86__AVCMNotificationDispatcher_addListenerWithWeakReference_callback_name_object_flags___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  AVCMNotificationDispatcherListenerKey *v6;
  id v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__AVCMNotificationDispatcher_addListenerWithWeakReference_callback_name_object_flags___block_invoke_2;
  v8[3] = &unk_1E30348B0;
  v10 = *(_QWORD *)(a1 + 64);
  v9 = *(_OWORD *)(a1 + 32);
  v5 = objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", v3, v4, 0, v8);
  v6 = +[AVCMNotificationDispatcherListenerKey listenerKeyWithWeakReferenceToListener:callback:name:object:](AVCMNotificationDispatcherListenerKey, "listenerKeyWithWeakReferenceToListener:callback:name:object:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v7 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKeyedSubscript:", v6);
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v5);

}

uint64_t __86__AVCMNotificationDispatcher_addListenerWithWeakReference_callback_name_object_flags___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48))(objc_msgSend(*(id *)(a1 + 40), "CMNotificationCenter"), result, objc_msgSend(a2, "name"), objc_msgSend(a2, "object"), objc_msgSend(a2, "userInfo"));
  return result;
}

- (opaqueCMNotificationCenter)CMNotificationCenter
{
  return self->_cmNotificationCenter;
}

void __100__AVCMNotificationDispatcher__copyAndRemoveObserverForWeakReferenceToListener_callback_name_object___block_invoke(uint64_t a1)
{
  AVCMNotificationDispatcherListenerKey *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = +[AVCMNotificationDispatcherListenerKey listenerKeyWithWeakReferenceToListener:callback:name:object:](AVCMNotificationDispatcherListenerKey, "listenerKeyWithWeakReferenceToListener:callback:name:object:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKeyedSubscript:", v2);
  if (v3 && (v9 = v3, objc_msgSend(v3, "count")))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(v9, "lastObject");
    objc_msgSend(v9, "removeObjectAtIndex:", objc_msgSend(v9, "count") - 1);
    if (!objc_msgSend(v9, "count"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectForKey:", v2);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 56);
    v10 = AVMethodExceptionReasonWithObjectAndSelector(*(objc_class **)(a1 + 40), *(const char **)(a1 + 80), (uint64_t)CFSTR("Cannot remove a listener %@ (callback %p) for %@ from object %p that was never added.  Break on AVCMNotificationDispatcherUnbalancedUnregistrationBreak() to debug."), v4, v5, v6, v7, v8, *(_QWORD *)(a1 + 32));
    NSLog(CFSTR("%@"), v10, v11, v12, v13);
  }
}

+ (id)notificationDispatcherForCMNotificationCenter:(opaqueCMNotificationCenter *)a3
{
  void *v7;
  uint64_t v8;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD block[5];

  if ((opaqueCMNotificationCenter *)CMNotificationCenterGetDefaultLocalCenter() != a3
    && (opaqueCMNotificationCenter *)CMNotificationCenterGetDefaultLocalCenter() != a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = NSStringFromClass((Class)a1);
    v15 = (void *)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("%@ only supports listening to notifications from CMNotificationCenterGetDefaultLocalCenter"), v10, v11, v12, v13, v14, (uint64_t)v9), 0);
    objc_exception_throw(v15);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AVCMNotificationDispatcher_notificationDispatcherForCMNotificationCenter___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (notificationDispatcherForCMNotificationCenter__sSharedDispatcherOnce != -1)
    dispatch_once(&notificationDispatcherForCMNotificationCenter__sSharedDispatcherOnce, block);
  return (id)notificationDispatcherForCMNotificationCenter__sSharedDispatcher;
}

- (void)removeListenerWithWeakReference:(id)a3 callback:(void *)a4 name:(__CFString *)a5 object:(void *)a6
{
  id v6;

  v6 = -[AVCMNotificationDispatcher _copyAndRemoveObserverForWeakReferenceToListener:callback:name:object:](self, "_copyAndRemoveObserverForWeakReferenceToListener:callback:name:object:", a3, a4, a5, a6);
  if (v6)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", v6);

}

- (id)_copyAndRemoveObserverForWeakReferenceToListener:(id)a3 callback:(void *)a4 name:(__CFString *)a5 object:(void *)a6
{
  NSObject *listenerObjectsQueue;
  void *v7;
  _QWORD block[11];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__32;
  v14 = __Block_byref_object_dispose__32;
  v15 = 0;
  listenerObjectsQueue = self->_listenerObjectsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__AVCMNotificationDispatcher__copyAndRemoveObserverForWeakReferenceToListener_callback_name_object___block_invoke;
  block[3] = &unk_1E3034900;
  block[8] = a5;
  block[9] = a6;
  block[4] = a3;
  block[5] = self;
  block[10] = a2;
  block[6] = &v10;
  block[7] = a4;
  dispatch_sync(listenerObjectsQueue, block);
  v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)addListenerWithWeakReference:(id)a3 callback:(void *)a4 name:(__CFString *)a5 object:(void *)a6 flags:(unsigned int)a7
{
  NSObject *listenerObjectsQueue;
  _QWORD block[9];

  listenerObjectsQueue = self->_listenerObjectsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__AVCMNotificationDispatcher_addListenerWithWeakReference_callback_name_object_flags___block_invoke;
  block[3] = &unk_1E30348D8;
  block[6] = a5;
  block[7] = a6;
  block[8] = a4;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(listenerObjectsQueue, block);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    fig_note_initialize_logging();
}

AVCMNotificationDispatcher *__76__AVCMNotificationDispatcher_notificationDispatcherForCMNotificationCenter___block_invoke(uint64_t a1)
{
  AVCMNotificationDispatcher *result;

  result = -[AVCMNotificationDispatcher initWithCMNotificationCenter:]([AVCMNotificationDispatcher alloc], "initWithCMNotificationCenter:", *(_QWORD *)(a1 + 32));
  notificationDispatcherForCMNotificationCenter__sSharedDispatcher = (uint64_t)result;
  return result;
}

- (AVCMNotificationDispatcher)initWithCMNotificationCenter:(opaqueCMNotificationCenter *)a3
{
  AVCMNotificationDispatcher *v4;
  opaqueCMNotificationCenter *v5;
  NSObject *v6;
  AVCMNotificationDispatcher *v7;
  AVCMNotificationDispatcher *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  objc_super v18;

  if (!a3)
  {
    v11 = self;
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v12, v13, v14, v15, v16, (uint64_t)"cmNotificationCenter != NULL"), 0);
    objc_exception_throw(v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)AVCMNotificationDispatcher;
  v4 = -[AVCMNotificationDispatcher init](&v18, sel_init);
  if (v4 && (v5 = (opaqueCMNotificationCenter *)CFRetain(a3), (v4->_cmNotificationCenter = v5) != 0))
  {
    v4->_observersForListenerKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_listenerObjectsQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avcmnotificationdispatcher.ivars", v6);
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (AVCMNotificationDispatcher)init
{
  return -[AVCMNotificationDispatcher initWithCMNotificationCenter:](self, "initWithCMNotificationCenter:", 0);
}

- (void)dealloc
{
  opaqueCMNotificationCenter *cmNotificationCenter;
  NSObject *listenerObjectsQueue;
  objc_super v5;

  cmNotificationCenter = self->_cmNotificationCenter;
  if (cmNotificationCenter)
    CFRelease(cmNotificationCenter);
  listenerObjectsQueue = self->_listenerObjectsQueue;
  if (listenerObjectsQueue)
    dispatch_release(listenerObjectsQueue);

  v5.receiver = self;
  v5.super_class = (Class)AVCMNotificationDispatcher;
  -[AVCMNotificationDispatcher dealloc](&v5, sel_dealloc);
}

@end
