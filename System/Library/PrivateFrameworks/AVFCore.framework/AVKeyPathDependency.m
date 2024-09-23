@implementation AVKeyPathDependency

uint64_t __104__AVKeyPathDependency__startObservingSecondLevelPropertyOnNewCurrentValueForTopLevelDependencyProperty___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reactToSecondLevelPropertyChange:");
}

uint64_t __57__AVKeyPathDependency_initializationIsCompleteForObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "_reactToTopLevelPropertyChange:", a4);
}

- (void)_reactToTopLevelPropertyChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *subObjectRegistrationQueue;
  _QWORD v9[6];

  v5 = -[AVWeakReference referencedObject](self->_weakReferenceToObject, "referencedObject");
  if (v5)
  {
    v6 = v5;
    if (a3
      && (v7 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CB2CC0])) != 0
      && objc_msgSend(v7, "BOOLValue"))
    {
      objc_msgSend(v6, "willChangeValueForKey:", self->_dependentKey);
    }
    else
    {
      subObjectRegistrationQueue = self->_subObjectRegistrationQueue;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __54__AVKeyPathDependency__reactToTopLevelPropertyChange___block_invoke;
      v9[3] = &unk_1E302FCE8;
      v9[4] = v6;
      v9[5] = self;
      dispatch_sync(subObjectRegistrationQueue, v9);
      objc_msgSend(v6, "didChangeValueForKey:", self->_dependentKey);
    }
  }
}

- (void)_reactToSecondLevelPropertyChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = -[AVWeakReference referencedObject](self->_weakReferenceToObject, "referencedObject");
  if (v5)
  {
    v6 = v5;
    if (a3
      && (v7 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CB2CC0])) != 0
      && objc_msgSend(v7, "BOOLValue"))
    {
      objc_msgSend(v6, "willChangeValueForKey:", self->_dependentKey);
    }
    else
    {
      objc_msgSend(v6, "didChangeValueForKey:", self->_dependentKey);
    }
  }
}

uint64_t __54__AVKeyPathDependency__reactToTopLevelPropertyChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "topLevelPropertyKey"));
  v3 = *(id **)(a1 + 40);
  if (v3[6])
  {
    objc_msgSend(v3[6], "cancelCallbacks");

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = 0;
    v3 = *(id **)(a1 + 40);
  }
  return objc_msgSend(v3, "_startObservingSecondLevelPropertyOnNewCurrentValueForTopLevelDependencyProperty:", v2);
}

- (void)initializationIsCompleteForObject:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (-[AVWeakReference referencedObject](self->_weakReferenceToObject, "referencedObject") != a3)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Must invoke with object passed to initializer"), v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  -[AVKVODispatcher startObservingValueAtKeyPath:withoutKeepingAliveObservedObject:options:usingBlock:](self->_KVODispatcher, "startObservingValueAtKeyPath:withoutKeepingAliveObservedObject:options:usingBlock:", -[AVTwoPartKeyPath topLevelPropertyKey](self->_dependencyKeyPath, "topLevelPropertyKey"), a3, 8, +[AVWeakObservationBlockFactory weakObservationBlockForWeakObserver:passedToBlock:](AVWeakObservationBlockFactory, "weakObservationBlockForWeakObserver:passedToBlock:", self, &__block_literal_global_166));
  -[AVKeyPathDependency _startObservingSecondLevelPropertyOnNewCurrentValueForTopLevelDependencyProperty:](self, "_startObservingSecondLevelPropertyOnNewCurrentValueForTopLevelDependencyProperty:", objc_msgSend(a3, "valueForKey:", -[AVTwoPartKeyPath topLevelPropertyKey](self->_dependencyKeyPath, "topLevelPropertyKey")));
}

- (void)_startObservingSecondLevelPropertyOnNewCurrentValueForTopLevelDependencyProperty:(id)a3
{
  if (a3)
    self->_leafPropertyChangeNotifier = (AVCallbackCancellation *)-[AVKVODispatcher startObservingValueAtKeyPath:ofObject:options:usingBlock:](self->_KVODispatcher, "startObservingValueAtKeyPath:ofObject:options:usingBlock:", -[AVTwoPartKeyPath secondLevelPropertyKey](self->_dependencyKeyPath, "secondLevelPropertyKey"), a3, 8, +[AVObservationBlockFactory observationBlockForWeakObserver:passedToBlock:](AVObservationBlockFactory, "observationBlockForWeakObserver:passedToBlock:", self, &__block_literal_global_168));
}

- (AVKeyPathDependency)initWithObject:(id)a3 thatHasPropertyWithKey:(id)a4 whoseValueDependsOnValueAtKeyPath:(id)a5
{
  AVKeyPathDependency *v9;
  NSObject *v10;
  objc_class *v12;
  AVKeyPathDependency *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  AVKeyPathDependency *v22;
  AVKeyPathDependency *v23;
  void *v24;
  objc_super v25;

  if (!a3)
  {
    v12 = (objc_class *)self;
    v13 = self;
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = "object != nil";
    goto LABEL_10;
  }
  if (!a4)
  {
    v12 = (objc_class *)self;
    v22 = self;
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = "dependentPropertyKey != nil";
    goto LABEL_10;
  }
  if (!a5)
  {
    v12 = (objc_class *)self;
    v23 = self;
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = "dependencyKeyPath != nil";
LABEL_10:
    v24 = (void *)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, AVMethodExceptionReasonWithObjectAndSelector(v12, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v14, v15, v16, v17, v18, (uint64_t)v21), 0);
    objc_exception_throw(v24);
  }
  v25.receiver = self;
  v25.super_class = (Class)AVKeyPathDependency;
  v9 = -[AVKeyPathDependency init](&v25, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9->_subObjectRegistrationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.keypathdependency.registration", v10);
    v9->_KVODispatcher = (AVKVODispatcher *)+[AVKVODispatcher sharedKVODispatcher](AVKVODispatcher, "sharedKVODispatcher");
    v9->_weakReferenceToObject = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
    v9->_dependentKey = (NSString *)objc_msgSend(a4, "copy");
    v9->_dependencyKeyPath = (AVTwoPartKeyPath *)objc_msgSend(a5, "copy");
  }
  return v9;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  NSObject *subObjectRegistrationQueue;
  objc_super v4;

  subObjectRegistrationQueue = self->_subObjectRegistrationQueue;
  if (subObjectRegistrationQueue)
    dispatch_release(subObjectRegistrationQueue);

  v4.receiver = self;
  v4.super_class = (Class)AVKeyPathDependency;
  -[AVKeyPathDependency dealloc](&v4, sel_dealloc);
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;

  v3 = -[AVWeakReference referencedObject](self->_weakReferenceToObject, "referencedObject");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (!v3)
    v3 = CFSTR("<deallocated>");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, target=%@, dependentKey=\"%@\", dependencyKeyPath=\"%@\">"), v6, self, v3, self->_dependentKey, -[AVTwoPartKeyPath keyPathString](self->_dependencyKeyPath, "keyPathString"));
}

@end
