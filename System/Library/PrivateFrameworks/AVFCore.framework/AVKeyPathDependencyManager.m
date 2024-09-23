@implementation AVKeyPathDependencyManager

- (void)addCallbackToCancel:(id)a3
{
  -[AVWeakObservableCallbackCancellationHelper addCallbackToCancel:](self->_callbackCancellationHelper, "addCallbackToCancel:", a3);
}

- (AVKeyPathDependencyManager)initWithDependencyHost:(id)a3
{
  objc_class *v6;
  AVKeyPathDependencyManager *v7;
  AVKeyPathDependencyManager *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  objc_super v20;

  v6 = (objc_class *)objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = self;
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    NSStringFromClass(v6);
    v19 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot safely use %@ with %@ or its subclasses, due to rdar://problem/26865139, until we\x18 stop supporting legacy versions of iWork apps"), v14, v15, v16, v17, v18, (uint64_t)v13), 0);
    objc_exception_throw(v19);
  }
  v20.receiver = self;
  v20.super_class = (Class)AVKeyPathDependencyManager;
  v7 = -[AVKeyPathDependencyManager init](&v20, sel_init);
  if (v7)
  {
    v7->_weakReferenceToDependencyHost = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
    v7->_callbackCancellationHelper = objc_alloc_init(AVWeakObservableCallbackCancellationHelper);
    v7->_keyPathDependencies = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  return v7;
}

- (void)dependencyHostIsFullyInitialized
{
  id v3;
  id v4;
  NSMutableSet *keyPathDependencies;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[AVWeakReference referencedObject](self->_weakReferenceToDependencyHost, "referencedObject");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "declareKeyPathDependenciesWithRegistry:", self);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    keyPathDependencies = self->_keyPathDependencies;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](keyPathDependencies, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(keyPathDependencies);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "initializationIsCompleteForObject:", v4);
        }
        while (v7 != v9);
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](keyPathDependencies, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }
}

- (void)valueForKey:(id)a3 dependsOnValueAtKeyPath:(id)a4
{
  AVKeyPathDependency *v7;
  AVKeyPathDependency *v8;

  v7 = -[AVWeakReference referencedObject](self->_weakReferenceToDependencyHost, "referencedObject");
  if (v7)
  {
    v8 = -[AVKeyPathDependency initWithObject:thatHasPropertyWithKey:whoseValueDependsOnValueAtKeyPath:]([AVKeyPathDependency alloc], "initWithObject:thatHasPropertyWithKey:whoseValueDependsOnValueAtKeyPath:", v7, a3, a4);
    -[NSMutableSet addObject:](self->_keyPathDependencies, "addObject:", v8);
    v7 = v8;
  }

}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVKeyPathDependencyManager;
  -[AVKeyPathDependencyManager dealloc](&v3, sel_dealloc);
}

- (void)cancelAllCallbacks
{
  -[AVWeakObservableCallbackCancellationHelper cancelAllCallbacks](self->_callbackCancellationHelper, "cancelAllCallbacks");
}

@end
