@implementation NSObservationBuffer

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSObservationBuffer == a1)
    return +[NSObservationBuffer allocWithZone:](NSConcreteObservationBuffer, "allocWithZone:", a3);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSObservationBuffer;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

+ (id)bufferWithOutputQueue:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a1, "bufferWithMaximumObjectCount:fullPolicy:outputQueue:", 0, 0, a3);
  objc_msgSend(v3, "setMemoryPressureSensitive:", 1);
  objc_msgSend(v3, "setAutomaticallyEmitsObjects:", 1);
  return v3;
}

+ (id)bufferWithMaximumObjectCount:(unint64_t)a3 fullPolicy:(int64_t)a4 outputQueue:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMaximumObjectCount:fullPolicy:outputQueue:", a3, a4, a5);
}

- (NSObservationBuffer)initWithMaximumObjectCount:(unint64_t)a3 fullPolicy:(int64_t)a4 outputQueue:(id)a5
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSObservationBuffer;
  return -[NSObservationBuffer init](&v6, sel_init, a3, a4, a5);
}

- (BOOL)isMemoryPressureSensitive
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setMemoryPressureSensitive:(BOOL)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)bufferFullHandler
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setBufferFullHandler:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)automaticallyEmitsObjects
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setAutomaticallyEmitsObjects:(BOOL)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)emitObject
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)emitAllObjects
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end
