@implementation AVWeaklyObservedObjectClientBlockKVONotifier

- (void)callbackDidFireWithChangeDictionary:(id)a3
{
  if (-[AVWeakReference referencedObject](self->_weakReferenceToObject, "referencedObject"))
    (*((void (**)(void))self->_block + 2))();
  else
    NSLog(CFSTR("*** Received KVO for object %p that is being deallocated.  This can cause other objects to get a reference to %p while it is in an inconsistent state.  Break on AVKVODispatcherKVODuringObjectTeardownBreak() to debug"), self->_unsafeUnretainedObject, self->_unsafeUnretainedObject);
}

- (void)start
{
  id v3;
  void *v4;

  v3 = -[AVWeakReference referencedObject](self->_weakReferenceToObject, "referencedObject");
  v4 = -[AVCallbackContextRegistry registerCallbackContextObject:](self->_callbackContextRegistry, "registerCallbackContextObject:", self);
  self->_callbackContextToken = v4;
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self->_observer, self->_keyPath, self->_options, v4);
  objc_msgSend(v3, "addCallbackToCancelDuringDeallocation:", self);
}

- (AVWeaklyObservedObjectClientBlockKVONotifier)initWithCallbackContextRegistry:(id)a3 observer:(id)a4 object:(id)a5 keyPath:(id)a6 options:(unint64_t)a7 block:(id)a8
{
  AVWeaklyObservedObjectClientBlockKVONotifier *v14;
  AVCallbackContextRegistry *v15;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  objc_super v21;

  if (!a3)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "callbackContextRegistry != nil";
    goto LABEL_16;
  }
  if (!a4)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "observer != nil";
    goto LABEL_16;
  }
  if (!a5)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "object != nil";
    goto LABEL_16;
  }
  if (!a6)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "keyPath != nil";
    goto LABEL_16;
  }
  if (!a8)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "block != nil";
LABEL_16:
    v20 = (void *)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t)a8, (uint64_t)v19), 0);
    objc_exception_throw(v20);
  }
  v21.receiver = self;
  v21.super_class = (Class)AVWeaklyObservedObjectClientBlockKVONotifier;
  v14 = -[AVWeaklyObservedObjectClientBlockKVONotifier init](&v21, sel_init);
  if (v14)
  {
    v15 = (AVCallbackContextRegistry *)a3;
    if (v15)
      v15 = (AVCallbackContextRegistry *)CFRetain(v15);
    v14->_callbackContextRegistry = v15;
    v14->_observer = a4;
    v14->_weakReferenceToObject = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a5);
    v14->_unsafeUnretainedObject = (AVWeakObservable *)a5;
    v14->_keyPath = (NSString *)objc_msgSend(a6, "copy");
    v14->_options = a7;
    v14->_block = (id)objc_msgSend(a8, "copy");
  }
  return v14;
}

- (void)dealloc
{
  AVWeakObservable *unsafeUnretainedObject;
  NSString *v4;
  AVCallbackContextRegistry *callbackContextRegistry;
  AVCallbackContextRegistry *v6;
  objc_super v7;

  unsafeUnretainedObject = self->_unsafeUnretainedObject;
  if (unsafeUnretainedObject)
  {
    v4 = NSStringFromProtocol((Protocol *)&unk_1EE2B2768);
    NSLog(CFSTR("*** Weakly-observed object %p was deallocated without cancelling outstanding registration %p.  You are most likely about to get an exception from KVO.  To fix, make sure that %p properly implements the %@ protocol"), unsafeUnretainedObject, self, unsafeUnretainedObject, v4);
  }
  -[AVCallbackContextRegistry unregisterCallbackContextForToken:](self->_callbackContextRegistry, "unregisterCallbackContextForToken:", self->_callbackContextToken);
  callbackContextRegistry = self->_callbackContextRegistry;
  if (callbackContextRegistry)
  {
    CFRelease(callbackContextRegistry);
    v6 = self->_callbackContextRegistry;
  }
  else
  {
    v6 = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)AVWeaklyObservedObjectClientBlockKVONotifier;
  -[AVWeaklyObservedObjectClientBlockKVONotifier dealloc](&v7, sel_dealloc);
}

- (void)cancelCallbacks
{
  AVWeakObservable *unsafeUnretainedObject;
  AVWeakObservable *v4;

  unsafeUnretainedObject = self->_unsafeUnretainedObject;
  if (unsafeUnretainedObject && FigAtomicCompareAndSwapPtr())
  {
    v4 = -[AVWeakReference referencedObject](self->_weakReferenceToObject, "referencedObject");
    if (!v4)
      v4 = unsafeUnretainedObject;
    -[AVWeakObservable removeObserver:forKeyPath:context:](v4, "removeObserver:forKeyPath:context:", self->_observer, self->_keyPath, self->_callbackContextToken);
    -[AVCallbackContextRegistry unregisterCallbackContextForToken:](self->_callbackContextRegistry, "unregisterCallbackContextForToken:", self->_callbackContextToken);
  }
}

@end
