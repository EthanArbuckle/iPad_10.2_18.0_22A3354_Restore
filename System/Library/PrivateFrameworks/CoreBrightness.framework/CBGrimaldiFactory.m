@implementation CBGrimaldiFactory

- (BOOL)isReady
{
  BOOL v3;

  v3 = 0;
  if (self->_queue)
  {
    v3 = 0;
    if (self->_eventSource)
      return self->_samplingStrategy != 0;
  }
  return v3;
}

- (id)newInstance
{
  if (-[CBGrimaldiFactory isReady](self, "isReady"))
    return -[CBGrimaldiModule initWithQueue:andEventSource:andSamplingStrategy:]([CBGrimaldiModule alloc], "initWithQueue:andEventSource:andSamplingStrategy:", self->_queue, self->_eventSource, self->_samplingStrategy);
  else
    return 0;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBGrimaldiFactory *v4;

  v4 = self;
  v3 = a2;
  if (self->_queue)

  if (v4->_eventSource)
  if (v4->_samplingStrategy)

  v2.receiver = v4;
  v2.super_class = (Class)CBGrimaldiFactory;
  -[CBGrimaldiFactory dealloc](&v2, sel_dealloc);
}

- (CBGrimaldiEventSource)eventSource
{
  return (CBGrimaldiEventSource *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEventSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CBGrimaldiSamplingStrategy)samplingStrategy
{
  return (CBGrimaldiSamplingStrategy *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSamplingStrategy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
