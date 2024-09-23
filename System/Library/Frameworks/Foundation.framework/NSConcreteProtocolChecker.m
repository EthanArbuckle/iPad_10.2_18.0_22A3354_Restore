@implementation NSConcreteProtocolChecker

- (id)protocol
{
  return self->_protocol;
}

- (id)target
{
  return self->_target;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteProtocolChecker;
  -[NSProxy dealloc](&v3, sel_dealloc);
}

- (NSConcreteProtocolChecker)initWithTarget:(id)a3 protocol:(id)a4
{
  self->_target = a3;
  self->_protocol = (Protocol *)a4;
  return self;
}

@end
