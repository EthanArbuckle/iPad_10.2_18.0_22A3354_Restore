@implementation AVKeyPathFlattener

- (void)declareKeyPathDependenciesWithRegistry:(id)a3
{
  NSString *v5;

  v5 = -[AVTwoPartKeyPath topLevelPropertyKey](self->_dependencyKeyPath, "topLevelPropertyKey");
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", CFSTR("dependentProperty"), -[AVTwoPartKeyPath initWithTopLevelPropertyKey:secondLevelPropertyKey:]([AVTwoPartKeyPath alloc], "initWithTopLevelPropertyKey:secondLevelPropertyKey:", CFSTR("topLevelDependencyProperty"), -[AVTwoPartKeyPath secondLevelPropertyKey](self->_dependencyKeyPath, "secondLevelPropertyKey")));
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", CFSTR("topLevelDependencyProperty"), -[AVTwoPartKeyPath initWithTopLevelPropertyKey:secondLevelPropertyKey:]([AVTwoPartKeyPath alloc], "initWithTopLevelPropertyKey:secondLevelPropertyKey:", CFSTR("observedObject"), v5));
}

- (AVKeyPathFlattener)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99750];
  v6 = NSStringFromSelector(sel_initForObservingValueAtKeyPath_onObject_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ instead"), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (id)initForObservingValueAtKeyPath:(id)a3 onObject:(id)a4
{
  AVKeyPathFlattener *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVKeyPathFlattener;
  v6 = -[AVKeyPathFlattener init](&v8, sel_init);
  if (v6)
  {
    v6->_dependencyManager = -[AVKeyPathDependencyManager initWithDependencyHost:]([AVKeyPathDependencyManager alloc], "initWithDependencyHost:", v6);
    v6->_dependencyKeyPath = (AVTwoPartKeyPath *)objc_msgSend(a3, "copy");
    v6->_observedObject = a4;
    -[AVKeyPathDependencyManager dependencyHostIsFullyInitialized](v6->_dependencyManager, "dependencyHostIsFullyInitialized");
  }
  return v6;
}

- (void)addCallbackToCancelDuringDeallocation:(id)a3
{
  -[AVKeyPathDependencyManager addCallbackToCancel:](self->_dependencyManager, "addCallbackToCancel:", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[AVKeyPathDependencyManager cancelAllCallbacks](self->_dependencyManager, "cancelAllCallbacks");

  v3.receiver = self;
  v3.super_class = (Class)AVKeyPathFlattener;
  -[AVKeyPathFlattener dealloc](&v3, sel_dealloc);
}

- (id)observedObject
{
  return self->_observedObject;
}

- (id)topLevelDependencyProperty
{
  NSString *v3;
  char v4;
  NSObject *observedObject;

  v3 = -[AVTwoPartKeyPath topLevelPropertyKey](self->_dependencyKeyPath, "topLevelPropertyKey");
  v4 = objc_opt_respondsToSelector();
  observedObject = self->_observedObject;
  if ((v4 & 1) != 0)
    return (id)-[NSObject valueForKeyForKVO:](observedObject, "valueForKeyForKVO:", v3);
  else
    return -[NSObject valueForKey:](observedObject, "valueForKey:", v3);
}

- (id)dependentProperty
{
  NSString *v3;
  id v4;

  v3 = -[AVTwoPartKeyPath secondLevelPropertyKey](self->_dependencyKeyPath, "secondLevelPropertyKey");
  v4 = -[AVKeyPathFlattener topLevelDependencyProperty](self, "topLevelDependencyProperty");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(v4, "valueForKeyForKVO:", v3);
  else
    return (id)objc_msgSend(v4, "valueForKey:", v3);
}

@end
