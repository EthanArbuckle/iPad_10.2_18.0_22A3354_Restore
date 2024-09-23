@implementation AVClientBlockKVONotifier

- (void)callbackDidFireWithChangeDictionary:(id)a3
{
  (*((void (**)(void))self->_block + 2))();
}

- (void)start
{
  void *v3;

  v3 = -[AVCallbackContextRegistry registerCallbackContextObject:](self->_callbackContextRegistry, "registerCallbackContextObject:", self);
  self->_callbackContextToken = v3;
  -[NSObject addObserver:forKeyPath:options:context:](self->_object, "addObserver:forKeyPath:options:context:", self->_observer, self->_keyPath, self->_options, v3);
}

- (AVClientBlockKVONotifier)initWithCallbackContextRegistry:(id)a3 observer:(id)a4 object:(id)a5 keyPath:(id)a6 options:(unint64_t)a7 block:(id)a8
{
  AVClientBlockKVONotifier *v14;
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
  v21.super_class = (Class)AVClientBlockKVONotifier;
  v14 = -[AVClientBlockKVONotifier init](&v21, sel_init);
  if (v14)
  {
    v15 = (AVCallbackContextRegistry *)a3;
    if (v15)
      v15 = (AVCallbackContextRegistry *)CFRetain(v15);
    v14->_callbackContextRegistry = v15;
    v14->_observer = a4;
    v14->_object = a5;
    v14->_keyPath = (NSString *)objc_msgSend(a6, "copy");
    v14->_options = a7;
    v14->_block = (id)objc_msgSend(a8, "copy");
  }
  return v14;
}

- (void)dealloc
{
  NSObject *object;
  AVCallbackContextRegistry *callbackContextRegistry;
  AVCallbackContextRegistry *v5;
  objc_super v6;

  object = self->_object;
  if (object)
    -[NSObject removeObserver:forKeyPath:context:](object, "removeObserver:forKeyPath:context:", self->_observer, self->_keyPath, self->_callbackContextToken);
  -[AVCallbackContextRegistry unregisterCallbackContextForToken:](self->_callbackContextRegistry, "unregisterCallbackContextForToken:", self->_callbackContextToken);
  callbackContextRegistry = self->_callbackContextRegistry;
  if (callbackContextRegistry)
  {
    CFRelease(callbackContextRegistry);
    v5 = self->_callbackContextRegistry;
  }
  else
  {
    v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)AVClientBlockKVONotifier;
  -[AVClientBlockKVONotifier dealloc](&v6, sel_dealloc);
}

- (NSObject)observedObject
{
  return self->_object;
}

- (void)cancelCallbacks
{
  NSObject *object;
  NSObject *v4;

  object = self->_object;
  if (object)
  {
    v4 = object;
    if (FigAtomicCompareAndSwapPtr())
    {
      -[NSObject removeObserver:forKeyPath:context:](v4, "removeObserver:forKeyPath:context:", self->_observer, self->_keyPath, self->_callbackContextToken);
      -[AVCallbackContextRegistry unregisterCallbackContextForToken:](self->_callbackContextRegistry, "unregisterCallbackContextForToken:", self->_callbackContextToken);

    }
  }
}

@end
