@implementation AVKVODispatcher

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;

  v7 = -[AVCallbackContextRegistry callbackContextForToken:](self->_callbackContextRegistry, "callbackContextForToken:", a6, a4);
  if (v7)
    objc_msgSend(v7, "callbackDidFireWithChangeDictionary:", a5);
}

- (id)startObservingValueAtKeyPath:(id)a3 withoutKeepingAliveObservedObject:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  AVWeaklyObservedObjectClientBlockKVONotifier *v8;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;

  if (!a4)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = "observedObject != nil";
    goto LABEL_8;
  }
  if (!a3)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = "keyPath != nil";
    goto LABEL_8;
  }
  if (!a6)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = "block != nil";
LABEL_8:
    v13 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, a5, (uint64_t)a6, v6, v7, (uint64_t)v12), 0);
    objc_exception_throw(v13);
  }
  v8 = -[AVWeaklyObservedObjectClientBlockKVONotifier initWithCallbackContextRegistry:observer:object:keyPath:options:block:]([AVWeaklyObservedObjectClientBlockKVONotifier alloc], "initWithCallbackContextRegistry:observer:object:keyPath:options:block:", self->_callbackContextRegistry, self, a4, a3, a5, a6);
  -[AVWeaklyObservedObjectClientBlockKVONotifier start](v8, "start");
  return v8;
}

- (id)startObservingValueAtKeyPath:(id)a3 ofObject:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  AVClientBlockKVONotifier *v8;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;

  if (!a4)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = "observedObject != nil";
    goto LABEL_8;
  }
  if (!a3)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = "keyPath != nil";
    goto LABEL_8;
  }
  if (!a6)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = "block != nil";
LABEL_8:
    v13 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, a5, (uint64_t)a6, v6, v7, (uint64_t)v12), 0);
    objc_exception_throw(v13);
  }
  v8 = -[AVClientBlockKVONotifier initWithCallbackContextRegistry:observer:object:keyPath:options:block:]([AVClientBlockKVONotifier alloc], "initWithCallbackContextRegistry:observer:object:keyPath:options:block:", self->_callbackContextRegistry, self, a4, a3, a5, a6);
  -[AVClientBlockKVONotifier start](v8, "start");
  return v8;
}

+ (id)sharedKVODispatcher
{
  if (sharedKVODispatcher_sSharedRegistryOnce != -1)
    dispatch_once(&sharedKVODispatcher_sSharedRegistryOnce, &__block_literal_global_37);
  return (id)sharedKVODispatcher_sSharedRegistry;
}

AVKVODispatcher *__38__AVKVODispatcher_sharedKVODispatcher__block_invoke()
{
  AVKVODispatcher *result;

  result = -[AVKVODispatcher initWithDescriptionOfHowAllObservedPropertyChangesAreSerializedWithDispatcherDeallocation:]([AVKVODispatcher alloc], "initWithDescriptionOfHowAllObservedPropertyChangesAreSerializedWithDispatcherDeallocation:", CFSTR("This instance is never deallocated"));
  sharedKVODispatcher_sSharedRegistry = (uint64_t)result;
  return result;
}

- (AVKVODispatcher)initWithDescriptionOfHowAllObservedPropertyChangesAreSerializedWithDispatcherDeallocation:(id)a3
{
  AVKVODispatcher *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVKVODispatcher;
  v3 = -[AVKVODispatcher init](&v5, sel_init, a3);
  if (v3)
    v3->_callbackContextRegistry = objc_alloc_init(AVCallbackContextRegistry);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVKVODispatcher;
  -[AVKVODispatcher dealloc](&v3, sel_dealloc);
}

- (id)startObservingValueAtTwoPartKeyPath:(id)a3 ofObject:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v12;
  AVClientBlockKVONotifier *v13;
  AVKeyPathFlattenerKVOIntrospectionShim *v14;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;

  if (!a4)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = "observedObject != nil";
    goto LABEL_8;
  }
  if (!a3)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = "keyPath != nil";
    goto LABEL_8;
  }
  if (!a6)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = "block != nil";
LABEL_8:
    v19 = (void *)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, a5, (uint64_t)a6, v6, v7, (uint64_t)v18), 0);
    objc_exception_throw(v19);
  }
  v12 = -[AVKeyPathFlattener initForObservingValueAtKeyPath:onObject:]([AVKeyPathFlattener alloc], "initForObservingValueAtKeyPath:onObject:", a3, a4);
  v13 = -[AVClientBlockKVONotifier initWithCallbackContextRegistry:observer:object:keyPath:options:block:]([AVClientBlockKVONotifier alloc], "initWithCallbackContextRegistry:observer:object:keyPath:options:block:", self->_callbackContextRegistry, self, v12, CFSTR("dependentProperty"), a5, a6);
  -[AVClientBlockKVONotifier start](v13, "start");
  v14 = -[AVKeyPathFlattenerKVOIntrospectionShim initWithObservedObject:realNotifier:]([AVKeyPathFlattenerKVOIntrospectionShim alloc], "initWithObservedObject:realNotifier:", a4, v13);

  return v14;
}

- (id)startObservingObject:(id)a3 weakObserver:(id)a4 forKeyPath:(id)a5 options:(unint64_t)a6 context:(void *)a7
{
  _QWORD v8[7];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __102__AVKVODispatcher_LegacyCallbackMethod__startObservingObject_weakObserver_forKeyPath_options_context___block_invoke;
  v8[3] = &unk_1E3035748;
  v8[4] = a5;
  v8[5] = a3;
  v8[6] = a7;
  return -[AVKVODispatcher startObservingValueAtKeyPath:ofObject:options:usingBlock:](self, "startObservingValueAtKeyPath:ofObject:options:usingBlock:", a5, a3, a6, +[AVObservationBlockFactory observationBlockForWeakObserver:passedToBlock:](AVObservationBlockFactory, "observationBlockForWeakObserver:passedToBlock:", a4, v8));
}

uint64_t __102__AVKVODispatcher_LegacyCallbackMethod__startObservingObject_weakObserver_forKeyPath_options_context___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "observeValueForKeyPath:ofObject:change:context:", a1[4], a1[5], a3, a1[6]);
}

- (id)startObservingObject:(id)a3 weakObserver:(id)a4 forTwoPartKeyPath:(id)a5 options:(unint64_t)a6 context:(void *)a7
{
  _QWORD v8[7];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __109__AVKVODispatcher_LegacyCallbackMethod__startObservingObject_weakObserver_forTwoPartKeyPath_options_context___block_invoke;
  v8[3] = &unk_1E3035748;
  v8[4] = a5;
  v8[5] = a3;
  v8[6] = a7;
  return -[AVKVODispatcher startObservingValueAtTwoPartKeyPath:ofObject:options:usingBlock:](self, "startObservingValueAtTwoPartKeyPath:ofObject:options:usingBlock:", a5, a3, a6, +[AVObservationBlockFactory observationBlockForWeakObserver:passedToBlock:](AVObservationBlockFactory, "observationBlockForWeakObserver:passedToBlock:", a4, v8));
}

uint64_t __109__AVKVODispatcher_LegacyCallbackMethod__startObservingObject_weakObserver_forTwoPartKeyPath_options_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "observeValueForKeyPath:ofObject:change:context:", objc_msgSend(*(id *)(a1 + 32), "keyPathString"), *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48));
}

@end
